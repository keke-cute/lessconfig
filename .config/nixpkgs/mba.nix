{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.mpv
    pkgs.pass
    pkgs.source-han-serif-simplified-chinese
    pkgs.go
    pkgs.gopls
    pkgs.aria2
  ];
  
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
  ];
  
  programs.emacs = {
    enable = true;
    package = pkgs.emacsGit;
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
