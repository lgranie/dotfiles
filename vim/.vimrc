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
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim

set cursorline    " highlight the current line
set visualbell    " stop that ANNOYING beeping
set wildmenu
set wildmode=list:longest,full

" Navigate split window
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" Auto resize Vim splits to active split
"set winwidth=130
"set winheight=999
"set winminwidth=80
"set winminheight=5

" plugin path
set runtimepath+=$HOME/.vim/bundle/vim-tmux-navigator

set runtimepath+=/usr/share/doc/fzf/examples
set runtimepath+=$HOME/.vim/bundle/fzf.vim

set runtimepath+=$HOME/.vim/bundle/async.vim
set runtimepath+=$HOME/.vim/bundle/asyncomplete.vim
set runtimepath+=$HOME/.vim/bundle/asyncomplete-lsp.vim
set runtimepath+=$HOME/.vim/bundle/vim-lsp
set runtimepath+=$HOME/.vim/bundle/vim-lsp-java
set runtimepath+=$HOME/.vim/bundle/vim-lsp-typescript
set runtimepath+=$HOME/.vim/bundle/vim-lsp-javascript
set runtimepath+=$HOME/.vim/bundle/vim-lsp-bash

set runtimepath+=$HOME/.vim/bundle/vim-jdb

" debugging vim-lsp
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('/tmp/vim-lsp.log')

let g:lsp_diagnostics_enabled = 1     " enable diagnostics support
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

" let g:lsp_signs_enabled = 1           " enable signs
let g:lsp_signs_enabled = get(g:, 'lsp_signs_enabled', has('patch-8.1.0772') && exists('*sign_define'))
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_signs_hint = {'text': 'o'}

let g:lsp_textprop_enabled = 1

" vim-lsp-java
let g:vim_lsp_java = {
  \ 'eclipse_jdtls' : {
    \ 'repository': expand('~/opt/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository'),
    \ 'version': '1.5.700.v20200107-1357',
    \ 'config': 'config_linux',
    \ 'workspace': expand('$WORKSPACE'),
  \ },
\ }

" color scheme
let base16colorspace=256
syntax enable
set background=dark
colorscheme base16

" font
set termencoding=utf-8
set guifont=DejaVu\ Sans\ Mono:h11

" Powerline status bar
set laststatus=2
let g:powerline_pycmd = 'py3'
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set t_Co=256

" vimdiff
if &diff
  set nofoldenable
  map ] ]c
  map [ [c
  set diffopt+=iwhite
  set diffexpr=""
endif

" xml folding
let g:xml_syntax_folding=1
au FileType xml,xslt setlocal foldmethod=syntax

" xml indent
au FileType xml,xslt setlocal equalprg=xmllint\ --format\ --recover\ --noblanks\ -\ 2>/dev/null

" indent json
au FileType json setlocal equalprg=jq\ .\ 2>/dev/null

