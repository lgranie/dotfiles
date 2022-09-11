let mapleader=";"

" tab size
set tabstop=2
set shiftwidth=2
set softtabstop=2

" line number (use vim-numbertoggle plugin)
set number

" Telescope binding
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

