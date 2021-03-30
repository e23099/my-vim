set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " required
Plugin 'tpope/vim-fugitive'
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
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'puremourning/vimspector'
Plugin 'szw/vim-maximizer'
Plugin 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call vundle#end()            " required
filetype plugin indent on    " required

set nu
set cursorline
set foldmethod=manual
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType html,jinja,java setlocal shiftwidth=2 tabstop=2
set si
set wrap
set visualbell

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

" for cursor shape on windows terminal
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

" for tmux to display the same color
set background=dark
set t_Co=256

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

let mapleader=" "

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
let g:coc_node_path = '/usr/bin/node' 
let g:coc_disable_startup_warning=1
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

" vimspector
noremap <F4> :VimspectorReset<cr>
let g:vimspector_enable_mappings='VISUAL_STUDIO'
nmap <F8> <Plug>VimspectorToggleConditionalBreakpoint

" maximizer
function GoToWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfunction

nnoremap <leader>m :MaximizerToggle!<cr>
noremap <leader>dc :call GoToWindow(g:vimspector_session_windows.code)<cr>
nnoremap <leader>dt :call GoToWindow(g:vimspector_session_windows.tagpage)<cr>
nnoremap <leader>dv :call GoToWindow(g:vimspector_session_windows.variables)<cr>
nnoremap <leader>dw :call GoToWindow(g:vimspector_session_windows.watches)<cr>
nnoremap <leader>ds :call GoToWindow(g:vimspector_session_windows.stack_trace)<cr>
nnoremap <leader>do :call GoToWindow(g:vimspector_session_windows.output)<cr>
