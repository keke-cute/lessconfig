if [ -e /Users/keke/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/keke/.nix-profile/etc/profile.d/nix.sh; fi
export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig:/Users/keke/Repos/nixbuild/root/lib/pkgconfig"
export LD_LIBRARY_PATH="/Users/keke/Repos/nixbuild/root/lib"
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
