{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.neofetch
    pkgs.kitty
    pkgs.tmux
    pkgs.mpv
    pkgs.go
    pkgs.gopls
    pkgs.fontconfig
    pkgs.source-han-serif-simplified-chinese
  ];
  
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
  ];
  
  fonts.fontconfig.enable = true;
  
  programs.emacs = {
    enable = true;
    package = pkgs.emacsGcc;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "keke";
  home.homeDirectory = "/Users/keke";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
