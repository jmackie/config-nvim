" junegunn/fzf.vim
" ----------------

" git grep wrapper
" See: https://github.com/junegunn/fzf.vim#example-git-grep-wrapper
command! -bang -nargs=* GGrep call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0)
nmap <leader>gg :GGrep<cr>

" ctrlp habit...
nmap <c-p> :GitFiles<cr>


" scrooloose/nerdtree
" -------------------

map  <c-n>     :NERDTreeToggle<cr>
nmap <leader>n :NERDTreeFind<cr>

let g:NERDTreeWinPos = 'left'
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 35
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeIgnore = ['\.git$']
let g:NERDTreeRespectWildIgnore = 1

" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" w0rp/ale
" --------

" Enable minimal linters by default,
" prefer to set on a project-by-project basis
let g:ale_linters = {
\   'sh': ['shellcheck'],
\   'nix': ['nix'],
\}

" Only use explicitly declared linters
let g:ale_linters_explicit = 1

" Lint on save
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

" Format on save
let g:ale_fix_on_save = 1

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_set_highlights = 0  " don't highlight

" https://github.com/rust-lang/rls/issues/1011#issuecomment-456498046
"let g:ale_rust_rls_toolchain = 'nightly'

" Some nice LSP mappings
nnoremap <silent> gd :ALEGoToDefinition<cr>
nnoremap <silent> K  :ALEHover<cr>
nnoremap <silent> ?  :ALEDetail<cr>

au BufNewFile,BufRead dune setf dune

" More silly javascript filetype mappings
au BufNewFile,BufRead .babelrc setf json
au BufNewFile,BufRead .eslintrc setf json
au BufNewFile,BufRead .prettierrc setf json


" Shougo/deoplete.nvim
" ---------------------

let g:deoplete#enable_at_startup = 1

" Use ALE as the completion source for all code
call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})


" itchyny/lightline.vim
" ---------------------

if $JMACKIE_THEME == 'light'
  let s:lightline_colorscheme = 'one'
else
  let s:lightline_colorscheme = 'powerline'
endif

let g:lightline = {
\   'colorscheme': s:lightline_colorscheme,
\   'inactive': {
\       'left': [
\           [ 'absolutepath' ]
\       ]
\   },
\   'active': {
\       'left': [
\           [ 'mode', 'paste' ],
\           [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ]
\       ]
\   },
\   'component_function': {
\       'gitbranch': 'fugitive#head'
\   },
\   'separator': { 'left': '', 'right': '' },
\   'subseparator': { 'left': '', 'right': '' },
\}


" NLKNguyen/papercolor-theme
" rakr/vim-one
" --------------------------

if $JMACKIE_THEME == 'light'
  set background=light
  let g:one_allow_italics = 1
  colorscheme one
else
  " Use the terminal's background color
  " NOTE: must come before `colorscheme PaperColor`
  let g:PaperColor_Theme_Options = {'theme': {'default.dark': { 'transparent_background': 1 } } }
  set background=dark
  colorscheme PaperColor
endif


" airblade/vim-gitgutter
" ----------------------

highlight! link SignColumn LineNr
