" --------------vim-plug---------------
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'
let g:fzf_command_prefix = ''
nnoremap <C-f> :Files<cr>
nnoremap <C-\> :Rg<cr>
" Initialize plugin system
call plug#end()

" ------------------------------------
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
" Fast saving ,quitting & suspending
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>z :sus<cr>
" enable mouse for normal, visual & insert mode
set mouse=nvi
" avoid save prompt when changed buffer goes 'hidden'
set hidden
" Highlight search results
set hlsearch
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Enable line numbers
set number 
" Highlight current line
set cursorline
" Set vertical bar in INSERT-mode
" (Only works in Terminal.app)
" Enable syntax highlighting
syntax enable 
" Setup editor colorscheme
colorscheme onedark
" Setup lightline colorscheme
let g:lightline = { 'colorscheme': 'onedark' }
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" set ai "Auto indent
" set si "Smart indent
" set wrap "Wrap lines
" Always show the status line
set laststatus=2

