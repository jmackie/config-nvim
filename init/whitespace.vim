let g:better_whitespace_enabled             = 1
let g:better_whitespace_filetypes_blacklist = ['diff', 'gitcommit']

" Strip trailing whitespace
autocmd BufWritePre * :StripWhitespace
"let g:strip_whitespace_on_save = 1      " Doesn't seem to be working for me...
