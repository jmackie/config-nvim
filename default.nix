{ pkgs ? import <nixpkgs> { } }:

let
  dropExtension = str:
    pkgs.lib.lists.head (pkgs.lib.strings.splitString "." str);
  pluginFromSource = source:
    with builtins.fromJSON (builtins.readFile source);
    let name = dropExtension (builtins.baseNameOf source);
    in pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = name;
      version = date;

      src = builtins.fetchTarball {
        name = "${name}-${rev}";
        url = "${url}/archive/${rev}.tar.gz";
        inherit sha256;
      };
    };

  myPlugins = {
    start = [
      (pluginFromSource ./sources/airblade-vim-gitgutter.json)
      (pluginFromSource ./sources/andy-morris-happy-vim.json)
      (pluginFromSource ./sources/christoomey-vim-tmux-navigator.json)
      (pluginFromSource ./sources/godlygeek-tabular.json)
      (pluginFromSource ./sources/idris-hackers-idris-vim.json)
      (pluginFromSource ./sources/itchyny-lightline-vim.json)
      (pluginFromSource ./sources/junegunn-fzf-vim.json)
      (pluginFromSource ./sources/junegunn-fzf.json)
      (pluginFromSource ./sources/NLKNguyen-papercolor-theme.json)
      (pluginFromSource ./sources/rakr-vim-one.json)
      (pluginFromSource ./sources/reasonml-editor-vim-reason-plus.json)
      (pluginFromSource ./sources/scrooloose-nerdtree.json)
      (pluginFromSource ./sources/sheerun-vim-polyglot.json)
      #(pluginFromSource ./sources/Shougo-deoplete-nvim.json)
      (pluginFromSource ./sources/tpope-vim-commentary.json)
      (pluginFromSource ./sources/tpope-vim-fugitive.json)
      (pluginFromSource ./sources/tpope-vim-repeat.json)
      (pluginFromSource ./sources/tpope-vim-surround.json)
      (pluginFromSource ./sources/tpope-vim-unimpaired.json)
      (pluginFromSource ./sources/vim-scripts-alex-vim.json)
      (pluginFromSource ./sources/vim-scripts-gitignore.json)
      (pluginFromSource ./sources/vmchale-dhall-vim.json)
      (pluginFromSource ./sources/w0rp-ale.json)
    ];
    opt = [ ];
  };
in pkgs.neovim.override {
  configure = {
    packages.myPlugins = myPlugins;

    customRC = ''
      ${builtins.readFile ./settings.vim}
      ${builtins.readFile ./commands.vim}
      ${builtins.readFile ./mappings.vim}
      ${builtins.readFile ./globals.vim}
      ${builtins.readFile ./plugin_config.vim}
    '';
  };
}
