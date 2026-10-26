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

use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/nvim-cmp'

use ({"akinsho/toggleterm.nvim", tag = '*', config = function()
   require("toggleterm").setup()
end})

use 'preservim/nerdtree'
use 'vim-airline/vim-airline'

use {"windwp/nvim-autopairs", config = function()
        require("nvim-autopairs").setup({
            check_ts = true,               -- integrates with Treesitter
            enable_afterquote = true,
            enable_check_bracket_line = true,
        })
    end}

use 'ryanoasis/vim-devicons'
use 'xiyaowong/transparent.nvim'
use 'mbbill/undotree'
use 'romgrk/barbar.nvim'

use 'nvim-lua/plenary.nvim'
use 'nvim-lua/completion-nvim'
use 'nvim-tree/nvim-web-devicons'

use ('ThePrimeagen/harpoon',
{['branch'] = 'harpoon2'})
if packer_bootstrap then
   require('packer').sync()
end
use ({"kylechui/nvim-surround",
tag = "*",
config = function()
   require("nvim-surround").setup({
   })
end})

end)
