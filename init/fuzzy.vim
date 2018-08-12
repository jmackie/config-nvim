set wildignore+=tags

let g:ctrlp_extensions = ['tag', 'buffertag']

" Prefer ripgrep
if executable('rg')
    set grepprg=rg\ --color=never
    set grepformat=%f:%l:%c:%m,%f:%l:%m

    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching  = 0
    let g:ackprg             = 'rg --vimgrep --no-heading'
endif

"let g:ctrlp_custom_ignore = {
"    \ 'dir':  '\.git$\|node_modules$',
"    \ 'file': '\v\.(exe|so|dll)$',
"    \ }
