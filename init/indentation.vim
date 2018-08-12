set cindent           " Smart, customizable indentation
set tabstop=4         " Soft tab size (default)
set softtabstop=4     " Unify
set shiftwidth=4      " Indent/outdent by 4 columns
set shiftround        " Always indent/outdent to the nearest tabstop
set expandtab         " Use spaces instead of tabs
set smarttab          " Use tabs at the start of a line, spaces elsewhere

" Need hard tabs in Makefiles
autocmd FileType make setlocal noexpandtab

" Mapping to disable auto indenting
:nnoremap <F8> :setl noai nocin nosi inde=<CR>
"set autoindent
