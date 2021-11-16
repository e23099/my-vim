set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=C:/Users/e2309/.vim/bundle/Vundle.vim
if has('gui_running')
    set fileencoding=utf-8
    set guioptions-=T  " no toolbar
    set guifont=Fira\ Code:h10
    set rtp+=C:/tools/vim/bundle/Vundle.vim
    "set guifontwide=Microsoft\ JhengHei
endif
" polyglot
let g:polyglot_disabled = ['csv']
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " required
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'itchyny/lightline.vim'
Plugin 'crusoexia/vim-monokai'
Plugin 'sheerun/vim-polyglot'
Plugin 'mechatroner/rainbow_csv'
Plugin 'chrisbra/colorizer'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tmsvg/pear-tree' " complete brackets
Plugin 'preservim/tagbar'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'puremourning/vimspector'
Plugin 'szw/vim-maximizer'
Plugin 'neoclide/coc.nvim' " after install/update, manually execute `:call coc#util#install()`
" for flask development
Plugin 'lepture/vim-jinja'
Plugin 'mattn/emmet-vim'
call vundle#end()            " required
filetype plugin indent on    " required
set nu
set cursorline
set foldmethod=manual
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
autocmd FileType html,jinja,xml,srp,js setlocal shiftwidth=2 tabstop=2
set si
set wrap
syntax on
set mouse=a
" windows setting
set encoding=utf-8
set nobackup
set backspace=2
" Windows chinese region crap
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


let mapleader=" "

" setting for NERDTree
map <leader>nn : NERDTreeToggle <cr>
let NERDTreeIgnore=['\.o$', '\~$', '__pycache__']
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" setting for lightline
set noshowmode
set guioptions-=e
set showtabline=2
set laststatus=2
let g:lightline = {
\    'colorscheme': 'wombat',
\    'active': {
\        'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]
\    },
\    'component_function': {
\        'gitbranch': 'FugitiveHead',
\        'filename': 'LightlineFilename'
\    },
\    'tabline': {
\        'left': [['tabs']],
\        'right': [[]],
\    },
\}
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" setting for monokai
colorscheme monokai


" setting for Colorizer
map <leader>ch : ColorHighlight <cr>
map <leader>cc : ColorClear <cr>

" pear-tree
let g:pear_tree_repeatable_expand = 0

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
nnoremap <leader>dc :call GoToWindow(g:vimspector_session_windows.code)<cr>
nnoremap <leader>dt :call GoToWindow(g:vimspector_session_windows.tagpage)<cr>
nnoremap <leader>dv :call GoToWindow(g:vimspector_session_windows.variables)<cr>
nnoremap <leader>dw :call GoToWindow(g:vimspector_session_windows.watches)<cr>
nnoremap <leader>ds :call GoToWindow(g:vimspector_session_windows.stack_trace)<cr>
nnoremap <leader>do :call GoToWindow(g:vimspector_session_windows.output)<cr>

" Tagbar
nmap <F12> :TagbarToggle<CR>

" rainbow
let g:disable_rainbow_hover = 1

