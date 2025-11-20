local vim = vim
require('config.mappings')
require('config.set')
require('config.packer')

vim.g.NERDTreeShowHidden = 1

vim.cmd [[colorscheme tokyonight-storm]]

require("dap-python").setup("/home/buddy/.virtualenvs/debugpy/bin/python3")

vim.api.nvim_set_hl(0, "Comment", { fg = "green" })

vim.cmd [[highlight CursorLine guibg=#32394e]]

vim.cmd [[highlight CursorLineNr guifg=#525c80 guibg=NONE]]

vim.cmd [[highlight LineNrAbove guibg=NONE guifg=#525c80]]

vim.cmd [[highlight LineNrAbove guibg=NONE guifg=#525c80]]

vim.cmd [[highlight LineNrBelow guibg=NONE guifg=#525c80]]

vim.o.foldmethod = 'indent'
vim.o.foldlevel = 3
vim.o.foldlevelstart = 99

vim.api.nvim_set_hl(0, "Comment", { fg = "#6fbf73"})

vim.g['airline#extensions#diagnostic#enabled'] = 0
vim.g['airline#extensions#ale#enabled'] = 0
vim.g['airline#extensions#whitespace#enabled'] = 0
