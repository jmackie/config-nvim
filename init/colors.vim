" Use the terminal's background color
" NOTE: must come before `colorscheme PaperColor`
let g:PaperColor_Theme_Options = {
    \ 'theme': {'default.dark': { 'transparent_background': 1 } }
    \ }

" Enable pretty colors
set termguicolors
colorscheme PaperColor
set background=dark

highlight WarningMsg ctermfg=180 guifg=#e5c07b
