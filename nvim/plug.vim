if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

" Vim plug
" Run :PlugInstall

call plug#begin()

" file navigation using <Space>n
Plug 'preservim/nerdtree'

" git and github actions
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" comment out lines with gc / gcc
Plug 'tpope/vim-commentary'

" better . support for vim
Plug 'tpope/vim-repeat'

" auto closes () [] and {}
Plug 'cohama/lexima.vim'

" needed dependency for telescope
Plug 'nvim-lua/plenary.nvim'

" fuzzy finder
Plug 'nvim-telescope/telescope.nvim'

" language parser?
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'gruvbox-community/gruvbox'

" linting plugin: checks syntax and semantics
Plug 'dense-analysis/ale'

" Javascript syntax highlighting and improved indentation
Plug 'pangloss/vim-javascript'

" Expands Abbrevietions
Plug 'mattn/emmet-vim'

" auto closes divs and html tags
Plug 'alvan/vim-closetag'

call plug#end()

" Vundle
" Run :PluginInstall

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/bundle')

" required
Plugin 'VundleVim/Vundle.vim'

" autocomplete
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()
filetype plugin indent on
