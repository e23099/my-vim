set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " required
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'lepture/vim-jinja'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'itchyny/lightline.vim'
Plugin 'mattn/emmet-vim'
Plugin 'crusoexia/vim-monokai'
Plugin 'chrisbra/colorizer'
Plugin 'mechatroner/rainbow_csv'
Plugin 'junegunn/fzf'
Plugin 'rking/ag.vim'
Plugin 'tmsvg/pear-tree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'puremourning/vimspector'
Plugin 'szw/vim-maximizer'
Plugin 'preservim/tagbar'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call vundle#end()            " required
filetype plugin indent on    " required
call glaive#Install()        " google formatting

set nu
set cursorline
set foldmethod=manual
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType html,jinja,cc,cpp,hpp,js setlocal shiftwidth=2 tabstop=2
set si
set wrap
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

syntax on
set mouse=a
set ttymouse=xterm2 " for dragging window
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
inoremap <C-PageUp> :bp<CR>
inoremap <C-PageDown> :bn<CR>

" Status line
set laststatus=2

let mapleader=" "

" Copy to Clipboard
function CopyToClipboard()
    execute '! cat ' . expand('%:p') . ' | clip.exe'
endfunction

map<leader>cc :call CopyToClipboard()<cr><cr>

" setting for NERDTree
map <leader>nn :tabdo NERDTreeMirror <Bar> NERDTreeFocus <Bar> wincmd p <cr>
map <leader>nc :tabdo NERDTreeClose <cr>
"" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
"" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * silent NERDTreeMirror

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
"" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
"" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" popup color
highlight CocErrorFloat ctermfg=Red 

" vimspector
noremap <F4> :VimspectorReset<cr>
let g:vimspector_enable_mappings='VISUAL_STUDIO'
nmap <F8> <Plug>VimspectorToggleConditionalBreakpoint
nnoremap <leader>dj :CocCommand java.debug.vimspector.start<cr>

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

" Tagbar
nmap <F12> :TagbarToggle<CR>
augroup autoformat_settings
  "autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,arduino AutoFormatBuffer clang-format
  " autocmd FileType dart AutoFormatBuffer dartfmt
  " autocmd FileType go AutoFormatBuffer gofmt
  " autocmd FileType gn AutoFormatBuffer gn
  " autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  " autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  " autocmd FileType rust AutoFormatBuffer rustfmt
  " autocmd FileType vue AutoFormatBuffer prettier
augroup END

" Emmet
" let g:user_emmet_expandabbr_key = '<tab>'

