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
