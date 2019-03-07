" Author: jmackie <jmackie@protonmail.com>
" Description: A language server for PureScript

call ale#Set('purescript_language_server_executable', 'purescript-language-server')

function! ale_linters#purescript#purescript_language_server#GetCommand(buffer) abort
    " https://github.com/nwolverson/purescript-language-server#usage
    "
    " Passing an empty config doesn't seem to cause issues as
    " far as I can tell...
    return '%e --stdio --config {}'
endfunction

function! ale_linters#purescript#purescript_language_server#GetProjectRoot(buffer) abort
    let l:spago_dhall = ale#path#FindNearestFile(a:buffer, 'spago.dhall')
    let l:package_json = ale#path#FindNearestFile(a:buffer, 'psc-package.json')
    let l:bower_json = ale#path#FindNearestFile(a:buffer, 'bower.json')
    
    if !empty(l:spago_dhall)
        " spago project
        return fnamemodify(l:spago_dhall, ':h')
    elseif !empty(l:package_json)
        " psc-package project
        return fnamemodify(l:package_json, ':h')
    elseif !empty(l:bower_json)
        " bower project
        return fnamemodify(l:bower_json, ':h')
    else
        " ¯\_(ツ)_/¯   In this case the linter won't work!
        return ''
    endif
endfunction

call ale#linter#Define('purescript', {
\   'name': 'purescript-language-server',
\   'lsp': 'stdio',
\   'executable_callback': ale#VarFunc('purescript_language_server_executable'),
\   'command_callback': 'ale_linters#purescript#purescript_language_server#GetCommand',
\   'project_root_callback': 'ale_linters#purescript#purescript_language_server#GetProjectRoot',
\})
