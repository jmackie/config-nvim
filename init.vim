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
set cmdheight=1                " Set height of the command bar
set scrolloff=7                " Some lines around scroll for context
set autoread                   " Auto-reload files changed on disk
set noswapfile                 " Disable swap files
set updatecount=0              " Disable swap files
set wildmode=longest,list,full " :e completion mode
set nofoldenable               " Disable code folding
set clipboard+=unnamedplus     " Use system clipboard for yanks
set termguicolors              " Enable 24-bit color
set textwidth=80               " Wrap text at 80 characters...
set formatoptions-=t           " ...but only if I say so
set nowrap                     " Don't visually wrap
set updatetime=100             " Suggested by gitgutter
set backupcopy=yes             " Play nice with file watchers

set cindent                    " Smart, customizable indentation
set tabstop=4                  " Soft tab size (default)
set softtabstop=4              " Unify
set shiftwidth=4               " Indent/outdent by 4 columns
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

" Leader
let mapleader      = ','
let maplocalleader = ','


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

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

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

Plug 'sheerun/vim-polyglot'
Plug 'vmchale/dhall-vim'
Plug 'idris-hackers/idris-vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/gitignore'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

Plug 'NLKNguyen/papercolor-theme'

call plug#end()


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


" junegunn/fzf.vim
" ----------------
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" ctrlp habit...
nmap <c-p> :GitFiles<cr>


" w0rp/ale
" --------
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
\   'ocaml': ['ols'],
\   'racket': ['raco'],
\   'elm': ['elm'],
\   'go': ['gobuild'],
\}
" Only use the above linters
let g:ale_linters_explicit = 1

" Lint on save
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

" https://github.com/w0rp/ale/blob/master/autoload/ale/fix/registry.vim
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\   'elm': ['elm-format'],
\   'go': ['goimports'],
\   'sh': ['shfmt'],
\   'dhall': ['DhallFormat'],
\   'ocaml': ['ocamlformat'],
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'less': ['prettier'],
\   'markdown': ['prettier'],
\   'bzl': ['Buildifier'],
\}
let g:ale_fix_on_save = 1

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_set_highlights = 0  " don't highlight

" https://github.com/rust-lang/rls/issues/1011#issuecomment-456498046
let g:ale_rust_rls_toolchain = 'nightly-2019-01-15'

" Some nice LSP mappings
nnoremap <silent> gd :ALEGoToDefinition<cr>
nnoremap <silent> K  :ALEHover<cr>

function! DhallFormat(buffer) abort
    return { 'command': 'dhall format' }
endfunction

function! Floskell(buffer) abort
    return { 'command': 'floskell' }
endfunction

function! Buildifier(buffer) abort
    return { 'command': 'buildifier' }
endfunction


" itchyny/lightline.vim
" ---------------------
let g:lightline = {
\   'colorscheme': 'powerline',
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
" --------------------------
" Use the terminal's background color
" NOTE: must come before `colorscheme PaperColor`
let g:PaperColor_Theme_Options = {'theme': {'default.dark': { 'transparent_background': 1 } } }
colorscheme PaperColor
set background=dark
