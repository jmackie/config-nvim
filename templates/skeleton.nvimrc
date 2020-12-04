" https://github.com/w0rp/ale/blob/master/supported-tools.md
" https://github.com/w0rp/ale/tree/master/ale_linters
let g:ale_linters = {
\   'sh': ['shellcheck'],
\   'nix': ['nix'],
\   'haskell': ['hlint'],
\}

"   'typescript': ['tsserver'],

"let g:ale_elixir_elixir_ls_config = { 'elixirLS': { 'dialyzerEnabled': v:false }}

" https://github.com/w0rp/ale/blob/master/autoload/ale/fix/registry.vim
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'sh': ['shfmt'],
\   'nix': [{buffer -> { 'command': 'nixfmt' }}],
\   'json': ['prettier'],
\   'haskell': [{buffer -> { 'command': 'ormolu' }}],
\   'elixir': ['mix_format'],
\}

"   'go': ['goimports'],
"   'markdown': ['prettier'],
"   'yaml': ['prettier'],
"   'bzl': [{buffer -> { 'command': 'buildifier' }}],
"   'purescript': [{buffer -> { 'command': 'purty %t' }}],
"   'dhall': [{buffer -> { 'command': 'dhall --ascii format' }}],

"map <c-b> :make<CR>

" See :help ale-lint-language-servers
"  call ale#linter#Define('haskell', {
"  \   'name': 'ghcide',
"  \   'lsp': 'stdio',
"  \   'executable': '/home/jmackie/habito/dev/bin/ghcide',
"  \   'command': '%e --lsp',
"  \   'project_root': '/home/jmackie/habito',
"  \})
