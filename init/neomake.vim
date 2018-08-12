" Neomake on save
call neomake#configure#automake('w')

let g:neomake_warning_sign = {
    \ 'text': '⚠',
    \ 'texthl': 'WarningMsg',
    \ }
let g:neomake_error_sign = {
    \ 'text': '✘',
    \ 'texthl': 'ErrorMsg',
    \ }

let g:neomake_log_file = '/tmp/neomake/log'
