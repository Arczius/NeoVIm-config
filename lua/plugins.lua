local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
    return string.format("require(\"config/%s\")", name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        "git", "clone", "https://github.com/wbthomason/packer.nvim",
        install_path
    })
    execute "packadd packer.nvim"
end

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
	-- packer plugin so that packer can manage itself
	use 'wbthomason/packer.nvim'

	use 'junegunn/vim-easy-align'
	use 'dstein64/nvim-scrollview'
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'
	use 'junegunn/vim-github-dashboard'
	use 'SirVer/ultisnips'
	use 'honza/vim-snippets'
	use 'mattn/emmet-vim'
        use 'ryanoasis/vim-devicons'
	use 'townk/vim-autoclose'
	use 'tpope/vim-fugitive'
	use 'scrooloose/nerdcommenter'
      	use 'ms-jpq/chadtree'	
	use 'theblob42/drex.nvim'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	-- easy extendable lsp
	use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
	use 'seandewar/nvimesweeper'
	-- my personal color theme
	use 'ghifarit53/tokyonight-vim'
	
	-- the most important package ever
	use 'alec-gibson/nvim-tetris'

	
	if packer_bootstrap then
		require('packer').sync()
	end
end)
