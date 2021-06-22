{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  home.packages = [
    # For Basic
    pkgs.pass
    pkgs.tmux
    pkgs.aria2
    pkgs.ripgrep
    pkgs.unrar
    # For Media
    pkgs.mpv
    pkgs.ffmpeg
    pkgs.graphviz
    # For Code
    pkgs.go
    pkgs.gopls
    # For Librime
    # pkgs.capnproto
    # pkgs.boost
    # pkgs.cmake
    # pkgs.leveldb
    # pkgs.marisa
    # pkgs.opencc
    # pkgs.libyamlcpp
    # For Font
    pkgs.source-han-serif-simplified-chinese
  ];
  
  nixpkgs.overlays = [
    # Import emacs-overlay
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
    # Apply patch to emacsGit (in emacs-overlsy)
    # (self: super: {
    #   emacsGit = super.emacsGit.overrideAttrs (oldAttrs: rec {
    #     patches = oldAttrs.patches ++ [ ./no-titlebar.patch ];
    #   });
    # })
  ];
  
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
