local vim = vim
vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<leader>pv", ":Ex<CR>")

keymap.set("v", "K", ":m '>+1<CR>gv=gv")
keymap.set("v", "L", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]])
-- next greatest remap ever : asbjornHaland
keymap.set({"n", "v"}, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({"n", "v"}, "<leader>d", [["_d]])

keymap.set("i", "<C-c>", "<Esc>")

keymap.set("n", "<C-k>", ":cnext<CR>zz")
keymap.set("n", "<C-j>", ":cprev<CR>zz")
keymap.set("n", "<leader>k", ":lnext<CR>zz")
keymap.set("n", "<leader>j", ":lprev<CR>zz")

-- vim key change
keymap.set('n', 'j', 'h')  -- j moves left (previously h)
keymap.set('n', 'k', 'j')  -- k moves down (previously j)
keymap.set('n', 'l', 'k')  -- l moves up (previously k)
keymap.set('n', ';', 'l')  -- ; moves right (previously l)

keymap.set('v', 'j', 'h')  -- j moves left (previously h)
keymap.set('v', 'k', 'j')  -- k moves down (previously j)
keymap.set('v', 'l', 'k')  -- l moves up (previously k)
keymap.set('v', ';', 'l')  -- ; moves right (previously l)

keymap.set('n', 'h', '<Nop>')
keymap.set('v', 'h', '<Nop>')

-- Window Switch
keymap.set("n", "<C-j>", "<C-w>h", { desc = "switch window left" })
keymap.set("n", "<C-k>", "<C-w>j", { desc = "switch window down" })
keymap.set("n", "<C-l>", "<C-w>k", { desc = "switch window up" })
keymap.set("n", "<C-;>", "<C-w>l", { desc = "switch window right" })

keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set('n', '<F2>', ":TransparentToggle<CR>")
keymap.set('n', '<leader>th', ":Telescope colorscheme<CR>")

keymap.set('n', '<leader>F', ":ToggleTerm<CR>")
keymap.set('n', '<leader>L', ':lua vim.cmd("cd " .. vim.fn.expand("%:p:h"))<CR>',
{ noremap = true, silent = true })
vim.keymap.set('n', '<leader>lc', function()
  vim.cmd('cd ~')
end,{ noremap = true, silent = true })
keymap.set("n", "<leader>U", ":UndotreeToggle<CR>")

keymap.set('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
keymap.set('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
keymap.set('n', '<leader><S-Tab>', '<Cmd>BufferClose<CR>', opts)

keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>")

keymap.set("n", "<leader>z", ":vsplit<CR>")
keymap.set("n", "<leader>rz", ":split<CR>")

keymap.set("n", "<leader>tk", ":8winc < <CR>")
keymap.set("n", "<leader>tl", ":8winc > <CR>")
keymap.set("n", "<leader>to", ":3winc - <CR>")
keymap.set("n", "<leader>tp", ":3winc + <CR>")

-- NVIM-SURROUND COMMANDS
--    Old text                    Command         New text
----------------------------------------------------------------------------------
--    surr*ound_words             ysiw)           (surround_words)
--    *make strings               ys$"            "make strings"
--    [delete ar*ound me!]        ds]             delete around me!
--    remove <b>HTML t*ags</b>    dst             remove HTML tags
--    'change quot*es'            cs'"            "change quotes"
--    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--    delete(functi*on calls)     dsf             function calls

-- dap-ui
keymap.set('n', '<F5>', function() require('dap').continue() end)
keymap.set('n', '<F6>', function() require('dap').step_over() end)
keymap.set('n', '<F7', function() require('dap').step_into() end)
keymap.set('n', '<F8>', function() require('dap').step_out() end)
keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
keymap.set({'n', 'v'}, '<Leader>dh', function()
   require('dap.ui.widgets').hover()
end)
keymap.set({'n', 'v'}, '<Leader>dp', function()
   require('dap.ui.widgets').preview()
end)
keymap.set('n', '<Leader>df', function()
   local widgets = require('dap.ui.widgets')
   widgets.centered_float(widgets.frames)
end)
keymap.set('n', '<Leader>ds', function()
   local widgets = require('dap.ui.widgets')
   widgets.centered_float(widgets.scopes)
end)

keymap.set({'n', 'v'}, '<S-u>', "^");
keymap.set({'n', 'v'}, '<S-m>', "$");

keymap.set("n", "<S-o>", "O<Esc>", { noremap = true, silent = true })

-- :noh command end search

keymap.set("n", "<C-9>", ":noh<CR>")
keymap.set("n", "<C-\\>", ":noh<CR>")
