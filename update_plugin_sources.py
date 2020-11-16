#! /usr/bin/env nix-shell
#! nix-shell -i python3 -p python3 

import json
import subprocess
import os.path

PLUGINS = [
  "tpope/vim-commentary",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-fugitive",
  "tpope/vim-unimpaired",
  "sheerun/vim-polyglot",
  "vmchale/dhall-vim",
  "idris-hackers/idris-vim",
  "Shougo/deoplete.nvim",
  "junegunn/fzf",
  "junegunn/fzf.vim",
  "scrooloose/nerdtree",
  "w0rp/ale",
  "airblade/vim-gitgutter",
  "godlygeek/tabular",
  "itchyny/lightline.vim",
  "vim-scripts/gitignore",
  "reasonml-editor/vim-reason-plus",
  "christoomey/vim-tmux-navigator",
  "NLKNguyen/papercolor-theme",
  "rakr/vim-one",
  "vim-scripts/alex.vim",
  "andy-morris/happy.vim"
]

def main():
    for plugin in PLUGINS:
        repo = "https://github.com/" + plugin
        name = plugin.replace(".", "-").replace("/", "-")
        path = os.path.join("sources", name + ".json")
        with open(path, "w") as f:
            subprocess.run(
                ["nix-prefetch-git", repo],
                check=True,
                stdout=f,
                stderr=subprocess.DEVNULL
            )

if __name__ == "__main__":
    main()
