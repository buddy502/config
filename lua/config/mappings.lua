local vim = vim
vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<leader>pv", ":Ex<CR>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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

--Window switch
keymap.set("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

keymap.set("n", "<leader>s", [[:%s/<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set('n', '<F2>', ":TransparentToggle<CR>")
keymap.set('n', '<leader>th', ":Telescope colorscheme<CR>")

keymap.set('n', '<leader>F', ":ToggleTerm<CR>")
keymap.set('n', '<leader>L', ':lua vim.cmd("cd " .. vim.fn.expand("%:p:h"))<CR>',
{ noremap = true, silent = true })
vim.keymap.set('n', '<leader>l', function()
  vim.cmd('cd ~')
end,{ noremap = true, silent = true })

keymap.set("n", "<leader>U", ":UndotreeToggle<CR>")

keymap.set('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
keymap.set('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
keymap.set('n', '<leader><S-Tab>', '<Cmd>BufferClose<CR>', opts)

keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>")

vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
