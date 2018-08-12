" TODO: make this work nicely in Nix environments
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie', '--lsp'],
    \ 'rust':    ['rustup', 'run', 'nightly', 'rls']
    \ }

nnoremap <silent> K    :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd   :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
