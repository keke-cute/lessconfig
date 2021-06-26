if [ -e /Users/keke/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/keke/.nix-profile/etc/profile.d/nix.sh; fi
export PKG_CONFIG_PATH="/Users/keke/.keke/lib/pkgconfig"
export LD_LIBRARY_PATH="/Users/keke/.keke/lib"
export DYLD_LIBRARY_PATH="/Users/keke/.keke/lib"    
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
export PATH="$PATH:/Users/keke/.keke/bin"
export JAVA_HOME=/Users/keke/Minecraft/zulu16.30.19-ca-fx-jdk16.0.1-macosx_aarch64
if [ -e $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh ]; then . $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh; fi
