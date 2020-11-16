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
Plug 'editorconfig/editorconfig-vim'

" Dark theme
Plug 'NLKNguyen/papercolor-theme'

" Light theme
Plug 'rakr/vim-one'

" Funky haskell syntax
Plug 'vim-scripts/alex.vim'
Plug 'andy-morris/happy.vim'

call plug#end()
