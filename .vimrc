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
Plugin 'chrisbra/colorizer'
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
syntax on
set mouse=a

"smart mapping for tab completion
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction 

inoremap <TAB> <C-R>=InsertTabWrapper()<CR>


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

" setting for Colorizer
map <leader>ch : ColorHighlight <cr>
map <leader>chc: ColorClear <cr>
