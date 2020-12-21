" Stop syntax highlighting from breaking when scrolling a file
" with long multiline string literals.
" https://vim.fandom.com/wiki/Fix_syntax_highlighting
autocmd BufEnter * :syntax sync fromstart

" :T creates a new terminal split (VT for a vertical split)
command! -nargs=* T  below split | terminal <args>
command! -nargs=* VT below vsplit | terminal <args>

command! SpellEnable  setlocal spell spelllang=en_gb
command! SpellDisable setlocal nospell

command Dunno :normal i¯\_(ツ)_/¯<esc>

augroup TerminalStuff
    au!
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/skeleton.sh
    autocmd BufNewFile *.py 0r ~/.config/nvim/templates/skeleton.py
    autocmd BufNewFile *.html 0r ~/.config/nvim/templates/skeleton.html
    autocmd BufNewFile webpack.config.js 0r ~/.config/nvim/templates/skeleton.webpack.config.js
    autocmd BufNewFile .nvimrc 0r ~/.config/nvim/templates/skeleton.nvimrc
    autocmd BufNewFile *.cabal 0r ~/.config/nvim/templates/skeleton.cabal
    autocmd BufNewFile Main.elm 0r ~/.config/nvim/templates/skeleton.Main.elm
    autocmd BufNewFile *.nix 0r ~/.config/nvim/templates/skeleton.nix
    autocmd BufNewFile tsconfig.json 0r ~/.config/nvim/templates/skeleton.tsconfig.json
    autocmd BufNewFile .curlrc 0r ~/.config/nvim/templates/skeleton.curlrc
  augroup END
endif

function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command TrimWhitespace :call TrimWhitespace()

" https://github.com/kcsongor/vim-hs
function! Haskell_add_language_pragma()
  let line = max([0, search('^{-# LANGUAGE', 'n') - 1])
  :call fzf#run({
  \ 'source': 'ghc --supported-languages',
  \ 'sink': {lp -> append(line, "{-# LANGUAGE " . lp . " #-}")},
  \ 'options': '--multi --ansi --reverse --prompt "LANGUAGE> "',
  \ 'down': '25%'})
endfunction

command LE :call Haskell_add_language_pragma()
