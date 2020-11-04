set nocompatible               " Get rid of Vi compatibility mode. SET FIRST!
set shell=bash                 " Use a bourne-compatible shell
set encoding=utf8              " UTF-8 encoding
set conceallevel=0             " Disable concealing
set ffs=unix,mac,dos           " Unix as the standard file type
set exrc                       " Enable per-project .vimrc files
set secure                     " Don't let other foreign vimrcs run dangerous commands
set gdefault                   " global sed by default
set number                     " Show line numbers
set colorcolumn=80             " Ruler at 80 chars
set cursorline                 " Highlight the current line
set history=200                " Remember a lot of stuff
set ruler                      " Always show info along bottom
set cmdheight=2                " Set height of the command bar
set signcolumn=yes             " Always draw the sign column
set scrolloff=7                " Some lines around scroll for context
set autoread                   " Auto-reload files changed on disk
set noswapfile                 " Disable swap files
set updatecount=0              " Disable swap files
set wildmode=longest,list,full " :e completion mode
set foldmethod=marker          " fold code between a marker
set foldmarker={{{,}}}         " fold code between triple braces
set clipboard+=unnamedplus     " Use system clipboard for yanks
set termguicolors              " Enable 24-bit color
set textwidth=80               " Wrap text at 80 characters...
set formatoptions-=t           " ...but only if I say so
set nowrap                     " Don't visually wrap
set updatetime=100             " Suggested by gitgutter
set backupcopy=yes             " Play nice with file watchers

set cindent                    " Smart, customizable indentation
set tabstop=2                  " Soft tab size (default)
set softtabstop=2              " Unify
set shiftwidth=2               " Indent/outdent by 4 columns
set shiftround                 " Always indent/outdent to the nearest tabstop
set expandtab                  " Use spaces instead of tabs
set smarttab                   " Use tabs at the start of a line, spaces elsewhere

set hlsearch                   " Highlight all search results
set incsearch                  " Highlight while you type your search
set ignorecase                 " Make searches case-insensitive...
set smartcase                  " ...unless they contain at least one capital letter

filetype plugin indent on      " Filetype detection[ON] plugin[ON] indent[ON]
syntax enable                  " Enable syntax highlighting (previously syntax on)

" Make backspace act as it should
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Mouse issue (https://github.com/neovim/neovim/wiki/Following-HEAD#20170403)
set mouse=a

" Vimdiff
set diffopt=filler,vertical

" netrw stuff
let g:netrw_dirhistmax = 0
let g:netrw_liststyle  = 3

" Stop syntax highlighting from breaking when scrolling a file
" with long multiline string literals.
" https://vim.fandom.com/wiki/Fix_syntax_highlighting
autocmd BufEnter * :syntax sync fromstart

" COMMANDS =====================================================================

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
    autocmd BufNewFile *.html 0r ~/.config/nvim/templates/skeleton.html
    autocmd BufNewFile webpack.config.js 0r ~/.config/nvim/templates/skeleton.webpack.config.js
    autocmd BufNewFile .nvimrc 0r ~/.config/nvim/templates/skeleton.nvimrc
    autocmd BufNewFile *.cabal 0r ~/.config/nvim/templates/skeleton.cabal
    autocmd BufNewFile Main.elm 0r ~/.config/nvim/templates/skeleton.Main.elm
    autocmd BufNewFile *.nix 0r ~/.config/nvim/templates/skeleton.nix
    autocmd BufNewFile tsconfig.json 0r ~/.config/nvim/templates/skeleton.tsconfig.json
  augroup END
endif

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command TrimWhitespace :call TrimWhitespace()

" MAPPINGS =====================================================================

" Window Navigation
" (make uppercase navigation work across windows)
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" Map VIM 0 to first non-blank character
map 0 ^

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Ctrl+s saves
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>

" Ctrl+b makes
map <c-b> :make<CR>

" Visual mode '*' searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" Plain arrows move text around
nmap <up>    [e
nmap <down>  ]e
nmap <left>  <<
nmap <right> >>
vmap <up>    [egv
vmap <down>  ]egv
vmap <left>  <gv
vmap <right> >gv

" Ctrl+arrow to resize pane
nnoremap <c-up>    :resize +2<CR>
nnoremap <c-down>  :resize -2<CR>
nnoremap <c-left>  :vertical resize -2<CR>
nnoremap <c-right> :vertical resize +2<CR>

" Exit terminal mode naturally
tnoremap <Esc> <C-\><C-n>

" Tab cycles through tabs (in normal mode!)
nnoremap <tab> :tabn<CR>

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

" XXX: While I develop my syntax plugin for ditto
set rtp^=~/ditto-lang/ditto-vim

" PLUGINS ======================================================================
" https://twitter.com/mjackson/status/1073618826141396992
" https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9

" Make sure vim-plug is installed
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " TODO: This isn't as elegant as I'd like...
    autocmd VimEnter * PlugInstall
    source $MYVIMRC
endif

" Load all the plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'

Plug 'sheerun/vim-polyglot'
Plug 'vmchale/dhall-vim'
Plug 'idris-hackers/idris-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/gitignore'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'christoomey/vim-tmux-navigator'

" Themes
" (dark)
Plug 'NLKNguyen/papercolor-theme'
" (light)
Plug 'rakr/vim-one'

" Funky haskell syntax
Plug 'vim-scripts/alex.vim'
Plug 'andy-morris/happy.vim'

call plug#end()

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


" Theme
" -----
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


" Hacky solution for now
" https://github.com/ocaml/merlin/wiki/vim-from-scratch
set rtp+=/nix/store/yswgrgzq9sx3i5m77kd6206m9pkxdr8s-ocaml4.06.1-merlin-3.2.2/share/merlin/vim/
