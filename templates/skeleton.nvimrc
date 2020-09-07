" See :help ale-lint-language-servers
call ale#linter#Define('haskell', {
\   'name': 'ghcide',
\   'lsp': 'stdio',
\   'executable': '/home/jmackie/habito/dev/bin/ghcide',
\   'command': '%e --lsp',
\   'project_root': '/home/jmackie/habito',
\})

" https://github.com/w0rp/ale/blob/master/supported-tools.md
" https://github.com/w0rp/ale/tree/master/ale_linters
let g:ale_linters = {
\   'sh': ['shellcheck'],
\   'nix': ['nix'],
\   'haskell': ['ghcide'],
\   'typescript': ['tsserver'],
\   'typescriptreact': ['tsserver'],
\}

" https://github.com/w0rp/ale/blob/master/autoload/ale/fix/registry.vim
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': ['goimports'],
\   'sh': ['shfmt'],
\   'dhall': [{buffer -> { 'command': 'dhall --ascii format' }}],
\   'haskell': [{buffer -> { 'command': 'ormolu' }}],
\   'purescript': [{buffer -> { 'command': 'purty %t' }}],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'terraform': ['terraform'],
\}

"   'json': ['prettier'],
"   'markdown': ['prettier'],
"   'yaml': ['prettier'],
"   'nix': [{buffer -> { 'command': 'nixfmt' }}],
"   'bzl': [{buffer -> { 'command': 'buildifier' }}],
