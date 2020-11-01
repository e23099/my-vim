set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=C:/tools/vim/bundle/Vundle.vim
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
Plugin 'mechatroner/rainbow_csv'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tmsvg/pear-tree'
Plugin 'aklt/plantuml-syntax'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call vundle#end()            " required
filetype plugin indent on    " required

set nu
set foldmethod=manual
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType html,jinja,java setlocal shiftwidth=2 tabstop=2
set si
set wrap

syntax on
set mouse=a
" windows setting
set encoding=utf-8
set nobackup
set backspace=2
if has('gui_running')
    set fileencoding=utf-8
    set guioptions-=T  " no toolbar
    set guifont=Fira\ Code:h12
    "set guifontwide=Microsoft\ JhengHei
endif

" Windows chinese region crap
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"smart mapping for tab completion
"function InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    else
"        return "\<c-p>"
"    endif
"endfunction 
"
"inoremap <TAB> <C-R>=InsertTabWrapper()<CR>


" Status line
set laststatus=2

let mapleader=","

" setting for NERDTree
map <leader>nn : NERDTreeToggle <cr>

" setting for lightline
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" setting for monokai
colorscheme monokai

" setting for Colorizer
map <leader>ch : ColorHighlight <cr>
map <leader>chc: ColorClear <cr>

" pear-tree
let g:pear_tree_repeatable_expand = 0

" java complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" coc
"" path to node executable
let g:coc_node_path = 'C:\Program Files\nodejs\node.exe' 
"" tab complete
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
