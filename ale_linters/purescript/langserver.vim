" WIP

call ale#Set('purescript_langserver_executable', 'purescript-language-server')

function! ale_linters#purescript#langserver#GetCommand(buffer) abort
    return '%e'
endfunction

function! ale_linters#purescript#langserver#GetProjectRoot(buffer) abort
    let l:package_json = ale#path#FindNearestFile(a:buffer, 'package.json')
    return !empty(l:package_json) ? fnamemodify(l:package_json, ':h') : ''
endfunction

call ale#linter#Define('purescript', {
\   'name': 'purescript-language-server',
\   'lsp': 'stdio',
\   'lsp-config': {},
\   'executable_callback': ale#VarFunc('purescript_langserver_executable'),
\   'command_callback': 'ale_linters#purescript#langserver#GetCommand',
\   'project_root_callback': 'ale_linters#purescript#langserver#GetProjectRoot',
\})
