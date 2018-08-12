set wrap
highlight QuickFixLine ctermbg=none

" https://www.reddit.com/r/vim/comments/5v6tma/help_getting_full_error_messages_in_syntastic/
function! IsLocation()
    silent exec 'redir @t | ls | redir END'
    return match(@t,'%a-  "\[Location List\]"') >= 0
endfunction

function! IsQuickFix()
    silent exec 'redir @t | ls | redir END'
    return match(@t,'%a-  "\[Quickfix List\]"') >= 0
endfunction

map <buffer> <expr> <leader>em IsLocation()
    \? ':echo getloclist(0)[line(".")-1]["text"]<cr>'
    \: ':echo getqflist()[line(".")-1]["text"]<cr>'
