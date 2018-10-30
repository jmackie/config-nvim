" Make sure vim-plug is installed
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " TODO: This isn't as elegant as I'd like...
    autocmd VimEnter * PlugInstall
    source $MYVIMRC
else

" Load all the plugins
call plug#begin('~/.config/nvim/plugged')

" General/Editing
Plug 'neomake/neomake'                     " Code linting
                                           " NOTE: I'm beginning to think ALE is better...
Plug 'sbdchd/neoformat'                    " Code formatting
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdaeRemotePlugins' } " Code completion
Plug 'tpope/vim-commentary'                " Code comment commands
Plug 'scrooloose/nerdtree'                 " File tree browser
Plug 'vim-airline/vim-airline'             " Status bar
Plug 'vim-airline/vim-airline-themes'      " Staus bar theme
Plug 'ntpeters/vim-better-whitespace'      " White space trimming etc.
Plug 'Raimondi/delimitMate'                " Auto closing of quotes, parens etc.
Plug 'godlygeek/tabular'                   " Code alignment/tabularization
Plug 'tpope/vim-surround'                  " Quoting/parenthesizing commands
Plug 'tpope/vim-repeat'                    " Better '.' repeating
Plug 'junegunn/goyo.vim'                   " Disables certain plugins for distraction-free editing zen
Plug 'ctrlpvim/ctrlp.vim'                  " Fuzzy finder
Plug 'bagrat/vim-workspace'                " Session management
Plug 'ryanoasis/vim-devicons'              " File type glyphs/icons for NERDTree and friends
                                           " NOTE: must come after ctrlp
Plug 'mileszs/ack.vim'                     " Better(?) grep
Plug 'majutsushi/tagbar'                   " Code outline
"Plug 'ludovicchabant/vim-gutentags'        " Tag management

" Colours
Plug 'NLKNguyen/papercolor-theme'          " Material-inspired colour scheme

" Git
Plug 'tpope/vim-fugitive'                  " Git commands
Plug 'christoomey/vim-conflicted'          " Merge conflict resolution
Plug 'airblade/vim-gitgutter'              " Gutter signs for git diff

" Languages/Syntax
Plug 'neovimhaskell/haskell-vim',          { 'for': 'haskell'        }
Plug 'ndmitchell/ghcid',                   { 'rtp': 'plugins/nvim'   }
Plug 'Twinside/vim-hoogle',                { 'for': 'haskell'        }
Plug 'rust-lang/rust.vim',                 { 'for': 'rust'           }
Plug 'racer-rust/vim-racer',               { 'for': 'rust'           }
Plug 'purescript-contrib/purescript-vim',  { 'for': 'purescript'     }
Plug 'frigoeu/psc-ide-vim',                { 'for': 'purescript'     }
Plug 'vim-syntastic/syntastic',            { 'for': 'purescript'     }
Plug 'elmcast/elm-vim',                    { 'for': 'elm'            }
Plug 'w0rp/ale',                           { 'for': ['elm', 'idris'] }
Plug 'idris-hackers/idris-vim',            { 'for': 'idris'          }
Plug 'LnL7/vim-nix',                       { 'for': 'nix'            }
Plug 'klen/python-mode',                   { 'for': 'python'         }
Plug 'mattn/emmet-vim',                    { 'for': 'html'           }
Plug 'moll/vim-node',                      { 'for': 'javascript'     }
Plug 'ekalinin/Dockerfile.vim',            { 'for': 'Dockerfile'     }
Plug 'cespare/vim-toml',                   { 'for': 'toml'           }
Plug 'maralla/vim-toml-enhance',           { 'for': 'toml'           }

" Language Server Protocol (LSP)
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'make release' }
Plug 'junegunn/fzf'    " (Optional) multi-entry selection UI

" Recyling bin
"Plug 'tpope/vim-unimpaired'
"Plug 'euclio/gitignore.vim'
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'tyru/open-browser.vim'
"Plug 'tyru/open-browser-github.vim'

call plug#end()  " TODO: maybe use less plugins...

" Disable gutentags if ctags isn't available
if !executable('ctags')
    let g:gutentags_dont_load = 1
endif

" Source all .vim files under init/
for fpath in split(globpath('~/.config/nvim/init/**', '*.vim'), '\n')
    execute 'source' fpath
endfor

endif
