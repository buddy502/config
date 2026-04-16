local vim = vim
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

    use "wbthomason/packer.nvim"

--tag = '0.1.8',

    use { 'nvim-telescope/telescope.nvim', config = function()
       require("telescope").setup({
          defaults = {
             preview = {
                treesitter = false,
             },
          },
       })
   end }
        requires = { {'nvim-lua/plenary.nvim'} }
    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}, {
        indent = { enable = true },
    })

    use 'ziglang/zig.vim'

    -- dap configs
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'mfussenegger/nvim-dap-python'

    -- Themes for nvim
    use 'folke/tokyonight.nvim'
    use 'ray-x/starry.nvim'
    use ('bluz71/vim-nightfly-colors', {name = "nightfly", lazy = false,
    priority = 1000
})
use {
    'prettier/vim-prettier',
    run = 'yarn install --frozen-lockfile --production',
    ft = {'javascript', 'typescript', 'css', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'}
}

-- lsp lua
use 'mason-org/mason.nvim'
use 'mason-org/mason-lspconfig.nvim'
use 'neovim/nvim-lspconfig'

use {"ray-x/lsp_signature.nvim", config = function()
   require("lsp_signature").setup({
      bind = true,               -- automatically bind to LSP
      floating_window = true,    -- show in a floating window
      hint_enable = true,        -- show parameter hints
      hint_prefix = " ",        -- prefix symbol for the hint
      max_height = 10,           -- max height of the floating window
      max_width = 80,            -- max width of the floating window
      doc_lines = 0,             -- show only parameters
      handler_opts = {
         border = "single"      -- border style
      },
      always_trigger = false,    -- show only while typing
   })
end }

use 'hrsh7th/cmp-nvim-lsp'
use "jose-elias-alvarez/null-ls.nvim"
use 'hrsh7th/nvim-cmp'

use ({"akinsho/toggleterm.nvim", tag = '*', config = function()
   require("toggleterm").setup()
end})

use 'preservim/nerdtree'
use 'vim-airline/vim-airline'
use 'mattn/emmet-vim'

use {"windwp/nvim-autopairs", config = function()
        require("nvim-autopairs").setup({
            check_ts = true,               -- integrates with Treesitter
            enable_afterquote = true,
            enable_check_bracket_line = true,
        })
    end}

use 'ryanoasis/vim-devicons'
use 'xiyaowong/transparent.nvim'
use 'nvim-lua/plenary.nvim'
use 'nvim-lua/completion-nvim'
use 'CRAG666/code_runner.nvim'
use 'mbbill/undotree'
use 'romgrk/barbar.nvim'
use 'nvim-tree/nvim-web-devicons'
use 'nvim-neotest/nvim-nio'

use { 'samodostal/image.nvim',
   requires = { 'nvim-lua/plenary.nvim'},
   config = function()
      require("image").setup()
   end}

use ('ThePrimeagen/harpoon',
{['branch'] = 'harpoon2'})
if packer_bootstrap then
   require('packer').sync()
end
use ({"kylechui/nvim-surround",
tag = "*", -- Use for stability; omit to use `main` branch for the latest features
config = function()
   require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
   })
end})

end)
