call ale#Set('merlin_lsp_executable', 'ocamlmerlin-lsp')

function! ale_linters#ocaml#merlin_lsp#FindProjectRoot(buffer) abort
    let l:dune_project = ale#path#FindNearestFile(a:buffer, 'dune-project')
    echo l:dune_project
    return !empty(l:dune_project) ? fnamemodify(l:dune_project, ':h') : ''
endfunction

call ale#linter#Define('ocaml', {
\   'name': 'merlin-lsp',
\   'lsp': 'stdio',
\   'executable_callback': ale#VarFunc('merlin_lsp_executable'),
\   'command': '%e',
\   'project_root_callback': 'ale_linters#ocaml#merlin_lsp#FindProjectRoot',
\})
