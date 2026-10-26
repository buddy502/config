local vim = vim
-- LSP Mappings + Settings -----------------------------------------------------
-- modified from: https://github.com/neovim/nvim-lspconfig#suggested-configuration
local opts = { noremap = true, silent = true }
-- Basic diagnostic mappings, these will navigate to or display diagnostics
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
   -- Enable completion triggered by <c-x><c-o>
   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

   -- Mappings to magical LSP functions!
   local bufopts = { noremap = true, silent = true, buffer = bufnr }
   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
   vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, bufopts)
   vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
   vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Capabilities required for the visualstudio lsps (css, html, etc)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Activate LSPs
-- All LSPs in this list need to be manually installed via NPM/PNPM/whatevs

local lspconfig = require("lspconfig")

local servers = {
  "zls",
  "lua_ls",
  "rust_analyzer",
  "pyright",
  "asm_lsp",
  "jsonls",
  "clangd",
  "gopls",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

--lspconfig.tsserver.setup({
--  on_attach = on_attach,
--  capabilities = capabilities,
--  init_options = {
--    preferences = {
--      disableSuggestions = true,
--    },
--  },
--})

lspconfig.asm_lsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["asm-lsp"] = {
      compileCommands = {
        ["*.s"] = {
          "gcc",
          "-c",
          "-o",
          "/dev/null",
          "-x",
          "assembler",
          "${file}",
        },
      },
    },
  },
})

vim.filetype.add({
  extension = {
    asm = 'asm',
    s = 'asm',
    S = 'asm',
    inc = 'asm',
  },
})

vim.lsp.config('asm-lsp', {
  cmd = { 'asm-lsp' },
  filetypes = { 'asm' },
  root_markers = { '.asm-lsp.toml', '.git' },
})

-- Enable it for asm filetype
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'asm',
  callback = function(args)
    vim.lsp.start({ name = 'asm-lsp', bufnr = args.buf })
  end,
})
