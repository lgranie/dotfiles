" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Disable Arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Ruler / relative
set number
set relativenumber

" Disable swap and backup files
set nobackup
set nowritebackup
set noswapfile

" Autoindent / Use spaces no TABs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent

set history=50
set showcmd       " display incomplete command
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim

set cursorline    " highlight the current line
set visualbell    " stop that ANNOYING beeping
set wildmenu
set wildmode=list:longest,full

" Split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" Auto resize Vim splits to active split
set winwidth=130
set winheight=999
set winminwidth=80
set winminheight=5

" plugin path
set runtimepath+=$HOME/.vim/bundle/vim-tmux-navigator
set runtimepath+=$HOME/.vim/bundle/vim-airline
set runtimepath+=$HOME/.vim/bundle/vim-airline-themes
set runtimepath+=$HOME/.vim/bundle/gruvbox

set runtimepath+=$HOME/.vim/bundle/ctrlp.vim

set runtimepath+=$HOME/.vim/bundle/async.vim
set runtimepath+=$HOME/.vim/bundle/asyncomplete.vim
set runtimepath+=$HOME/.vim/bundle/asyncomplete-lsp.vim
set runtimepath+=$HOME/.vim/bundle/vim-lsp
set runtimepath+=$HOME/.vim/bundle/vim-lsp-java
set runtimepath+=$HOME/.vim/bundle/vim-lsp-typescript

set runtimepath+=$HOME/.vim/bundle/vim-jdb

" debugging vim-lsp
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')

" vim-lsp-java
let g:vim_lsp_java = {
  \ 'eclipse_jdtls' : {
    \ 'repository': expand('~/opt/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository'),
    \ 'version': '1.5.300.v20190213-1655',
    \ 'config': 'config_linux',
    \ 'workspace': '/mnt/c/workspace-poc',
  \ },
\ }

" color scheme
syntax enable
set background=dark
colorscheme gruvbox

" font
set guifont=DejaVu\ Sans\ Mono:h11

" ctrlp.vim
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.git|dist|target|node_modules|bower_components)$',
\ }

" ctrlp + ctags
nnoremap <leader>. :CtrlPTag<cr>

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
" let g:airline_solarized_bg='dark'

" xml folding
let g:xml_syntax_folding=1
au FileType xml,xslt setlocal foldmethod=syntax

" xml indent
au FileType xml,xslt setlocal equalprg=xmllint\ --format\ --recover\ --noblanks\ -\ 2>/dev/null

" indent json
au FileType json setlocal equalprg=jq\ .\ 2>/dev/null
