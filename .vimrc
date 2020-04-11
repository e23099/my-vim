set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " required
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'glench/vim-jinja2-syntax'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'itchyny/lightline.vim'
Plugin 'mattn/emmet-vim'
Plugin 'crusoexia/vim-monokai'
call vundle#end()            " required
filetype plugin indent on    " required

set nu
set relativenumber
set foldmethod=manual
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
set si
set wrap

" Status line
set laststatus=2

let mapleader=","

" setting for NERDTree
map <leader>nn : NERDTreeToggle <cr>
map <leader>nc : NERDTreeClose <cr>

" setting for lightline
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }

" setting for monokai
colorscheme monokai
