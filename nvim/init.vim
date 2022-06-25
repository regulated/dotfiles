" Fundamentals "{{{
" ---------------------------------------------------------------------

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

" relative numbers
set relativenumber
set nu
set hidden

" remap for telescope
let mapleader = " "

" Telescope
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>

" NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" shows hidden .files by default
let NERDTreeShowHidden=1

" for vim-closetag plugin
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.ts,*.jsx,*.tsx'
let g:closetag_enable_react_fragment = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Set theme for vim airline status bar
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts = 1

" vim plug and Vundle in plug.vim

set nocompatible
set number
syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
inoremap jk <Esc>
"let loaded_matchparen = 1
set shell=zsh
set backupskip=/tmp/*,/private/tmp/*

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" JSX
au BufNewFile,BufRead *.jsx setf javascriptreact
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"}}}

" Imports "{{{
" ---------------------------------------------------------------------


" runtime ./plug.vim
" if has("unix")
"   let s:uname = system("uname -s")
"   " Do Mac stuff
"   if s:uname == 'Darwin\n'
"     runtime ./macos.vim
"   endif
" endif
" if has('win32')
"   runtime ./windows.vim
" endif

" runtime ./maps.vim
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------

" true color
if exists("&termguicolors") 
  "&& exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " Use NeoSolarized
  "let g:neosolarized_termtrans=1
  "runtime ./colors/NeoSolarized.vim
  " Use gruvbox
  "runtime ./colors/gruvbox.vim
  let g:gruvbox_termcolors=1
  colorscheme gruvbox
  highlight Normal guibg=none
endif

"}}}

" Extras "{{{
" ---------------------------------------------------------------------
set exrc
"}}}

" Plugins "{{{
" ---------------------------------------------------------------------

if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

" Vim plug
" Run :PlugInstall

call plug#begin()

" file navigation using <Space>n
Plug 'preservim/nerdtree'
" nerdtree dev icons
Plug 'ryanoasis/vim-devicons'

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
" currently too slow and is disabled
"Plug 'dense-analysis/ale'

" Javascript syntax highlighting and improved indentation
Plug 'pangloss/vim-javascript'

" JSX highlighting FINALLY THIS ONE WORKS
Plug 'MaxMEllon/vim-jsx-pretty'

" Expands Abbrevietions
Plug 'mattn/emmet-vim'

" auto closes divs and html tags
Plug 'alvan/vim-closetag'

" Airline status bar for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim be good game
Plug 'ThePrimeagen/vim-be-good'

" Prettier
Plug 'prettier/vim-prettier'

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

"}}}

" vim: set foldmethod=marker foldlevel=0:
