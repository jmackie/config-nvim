let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie', '--lsp'],
    \ 'rust':    ['rustup', 'run', 'nightly', 'rls']
    \ }

nnoremap <silent> K     :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <c-]> :call LanguageClient_textDocument_definition()<CR>
