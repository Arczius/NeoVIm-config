" load the plugins from packer
lua require('plugins')

syntax on
syntax enable
filetype plugin on

" to use the system clipboard
set clipboard=unnamedplus

" colorscheme stuff
if(has("termguicolors"))
set termguicolors
endif
let g:tokyonight_style = 'night'
colorscheme tokyonight
let g:airline_theme = "tokyonight"

" open CHADtree on startup(a NERDTree alternative)
autocmd VimEnter * CHADopen

" auto check the plugins.lua file for new plugins and auto install them
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  autocmd BufWritePost plugins.lua source <afile> | PackerInstall
augroup end

" some keybindings
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
