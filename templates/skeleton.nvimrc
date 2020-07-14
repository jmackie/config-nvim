" https://github.com/w0rp/ale/blob/master/supported-tools.md
" https://github.com/w0rp/ale/tree/master/ale_linters
let g:ale_linters = {
\   'sh': ['shellcheck'],
\   'nix': ['nix'],
\   'make': ['checkmake'],
\   'haskell': ['hlint'],
\   'idris': ['idris'],
\   'purescript': ['purescript-language-server'],
\   'rust': ['rls'],
\   'ocaml': ['merlin-lsp'],
\   'reason': ['ols'],
\   'racket': ['raco'],
\   'elm': ['make'],
\   'go': ['gobuild'],
\}

" https://github.com/w0rp/ale/blob/master/autoload/ale/fix/registry.vim
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\   'elm': ['elm-format'],
\   'go': ['goimports'],
\   'sh': ['shfmt'],
\   'dhall': [{buffer -> { 'command': 'dhall --ascii format' }}],
\   'haskell': [{buffer -> { 'command': 'ormolu' }}],
\   'purescript': [{buffer -> { 'command': 'purty %t' }}],
\   'ocaml': ['ocamlformat'],
\   'reason': ['refmt'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'json': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'less': ['prettier'],
\   'markdown': ['prettier'],
\   'yaml': ['prettier'],
\   'nix': [{buffer -> { 'command': 'nixfmt' }}],
\   'bzl': [{buffer -> { 'command': 'buildifier' }}],
\   'dune': [{buffer -> { 'command': 'dune format-dune-file' }}],
\   'terraform': ['terraform'],
\}
