if [ -e /Users/keke/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/keke/.nix-profile/etc/profile.d/nix.sh; fi
export PKG_CONFIG_PATH="/Users/keke/.keke/lib/pkgconfig"
export LD_LIBRARY_PATH="/Users/keke/.keke/lib"
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
export PATH="$PATH:/Users/keke/.keke/bin"
if [ -e $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh ]; then . $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh; fi
