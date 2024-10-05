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

   use {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  requires = { {'nvim-lua/plenary.nvim'} }
}
   use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}, {
      indent = { enable = true },
   })
   use 'folke/tokyonight.nvim'
   use ('bluz71/vim-nightfly-colors', {name = "nightfly", lazy = false,
   priority = 1000
   })
   use 'craftzdog/solarized-osaka.nvim'

   use 'smjonas/inc-rename.nvim'
   use 'preservim/nerdtree'
   use 'vim-airline/vim-airline'
   use 'm4xshen/autoclose.nvim'
   use 'ap/vim-css-color'
   use 'ryanoasis/vim-devicons'
   use 'xiyaowong/transparent.nvim'
   use 'ray-x/starry.nvim'
   use 'nvim-lua/plenary.nvim'
   use 'nvim-lua/completion-nvim'
   use 'CRAG666/code_runner.nvim'
   use 'mbbill/undotree'
   use 'romgrk/barbar.nvim'
   use 'nvim-tree/nvim-web-devicons'
   use 'CRAG666/betterTerm.nvim'
   use 'mfussenegger/nvim-dap'
   use 'rcarriga/nvim-dap-ui'
   use 'nvim-neotest/nvim-nio'
   use 'hrsh7th/nvim-cmp'
   use "williamboman/mason.nvim"
   use "neoclide/coc.nvim"
   use "neovim/nvim-lspconfig"
   require("mason").setup()
   use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
   end}
   use ('ThePrimeagen/harpoon',
   {['branch'] = 'harpoon2'})
   if packer_bootstrap then
      require('packer').sync()
   end
   use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
         require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
         })
      end
   })
end)
