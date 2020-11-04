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

" Hacky solution for now
" https://github.com/ocaml/merlin/wiki/vim-from-scratch
set rtp+=/nix/store/yswgrgzq9sx3i5m77kd6206m9pkxdr8s-ocaml4.06.1-merlin-3.2.2/share/merlin/vim/

" XXX: While I develop my syntax plugin for ditto
set rtp^=~/ditto-lang/ditto-vim
