let g:neoformat_enabled_haskell       = ['stylishhaskell', 'brittany']

let g:neomake_haskell_enabled_makers  = ['hlint']
let g:neomake_haskell_hlint_args      =
    \ neomake#makers#ft#haskell#hlint().args + ['-X', 'TypeApplications', '-X', 'QuasiQuotes']

let g:LanguageClient_autoStart        = 0  " I generally prefer ghcid

" vim-haskell settings:
let g:haskell_indent_disable          = 1
let g:haskell_classic_highlighting    = 1
let g:haskell_indent_if               = 3
let g:haskell_indent_case             = 5
let g:haskell_indent_let              = 4
let g:haskell_indent_where            = 2
let g:haskell_indent_before_where     = 2
let g:haskell_indent_after_bare_where = 4
let g:haskell_indent_do               = 3
let g:haskell_indent_in               = 1
let g:haskell_indent_guard            = 4
let g:haskell_indent_case_alternative = 4
let g:cabal_indent_section            = 4

" My custom compatibility hack
let g:gutentags_ctags_executable_haskell = 'hasktags_'

let g:haskell_project_errorformat = '%E%f:%l:%c:\ error:%#,' .
    \ '%W%f:%l:%c:\ warning:%#,' .
    \ '%W%f:%l:%c:\ warning:\ [-W%.%#]%#,' .
    \ '%f:%l:%c:\ %trror: %m,' .
    \ '%f:%l:%c:\ %tarning: %m,' .
    \ '%E%f:%l:%c:%#,' .
    \ '%E%f:%l:%c:%m,' .
    \ '%W%f:%l:%c:\ Warning:%#,' .
    \ '%C\ \ %m%#,' .
    \ '%-G%.%#'

augroup HaskellMaps
    au FileType haskell,lhaskell setlocal makeprg=cabal\ new-build
    au FileType haskell,lhaskell setlocal errorformat=g:haskell_project_errorformat
augroup END
