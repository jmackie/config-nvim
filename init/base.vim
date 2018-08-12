" General
set nocompatible               " Get rid of Vi compatibility mode. SET FIRST!
set shell=bash                 " Use a bourne-compatible shell
set encoding=utf8              " UTF-8 encoding
set nowrap                     " Don't wrap text
set conceallevel=0             " Disable concealing
set ffs=unix,mac,dos           " Unix as the standard file type
set exrc                       " Enable per-project .vimrc files
set secure                     " Don't let other foreign vimrcs run dangerous commands
filetype plugin indent on      " Filetype detection[ON] plugin[ON] indent[ON]
syntax enable                  " Enable syntax highlighting (previously syntax on)

" Search
set hlsearch           " Highlight all results
set incsearch          " But do highlight as you type your search
set ignorecase         " Make searches case-insensitive
set smartcase          " Unless they contain at least one capital letter
set gdefault           " :s///g flag by default

" Make backspace act as it should
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Mouse issue (https://github.com/neovim/neovim/wiki/Following-HEAD#20170403)
set mouse=a

" Cursor/Line
set number                     " Show line numbers
set colorcolumn=80             " Ruler at 80 chars width
set cursorline                 " Highlight the current line

" Status/History
set history=200                " Remember a lot of stuff
set ruler                      " Always show info along bottom
set cmdheight=1                " Height of the command bar

" Scrolling
set scrolloff=7                " Some lines around scroll for context

" Files
set autoread                   " Auto-reload files changed on disk
set noswapfile                 " Disable swap files
set updatecount=0              " Disable swap files
set wildmode=longest,list,full " :e completion mode
set nofoldenable               " Disable code folding

" Backups
let g:backup_dir = '/tmp/nvim.bak/'
if !isdirectory(g:backup_dir)
    call mkdir(g:backup_dir)
endif
set backupdir=/tmp/nvim.bak/

" Spelling
command! SpellEnable  setlocal spell spelllang=en_gb
command! SpellDisable setlocal nospell

" Vimdiff
set diffopt=filler,vertical

" Leader
let mapleader      = ','
let maplocalleader = ','

" Clipboard
set clipboard+=unnamedplus  " Use system clipboard for yanks

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" :T creates a new terminal split (VT for a vertical split)
command! -nargs=* T  below split  | terminal <args>
command! -nargs=* VT below vsplit | terminal <args>

" Mappings

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
