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

" Use spaces no TABs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

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
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999

" color scheme
syntax enable
set background=dark
colorscheme solarized

" font
set guifont=DejaVu\ Sans\ Mono:h11

" plugin path
set runtimepath+=$HOME/.vim/bundle/ctrlp.vim,$HOME/.vim/bundle/vim-tmux-navigator,$HOME/.vim/bundle/vim-airline

" ctrlp.vim
let g:ctrlp_custom_ignore = {
     \ 'dir': '\v[\/](\.git|dist|target|node_modules|bower_components)$',
   \ }

