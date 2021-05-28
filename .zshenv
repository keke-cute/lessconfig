alias pass="./Repos/password-store/src/password-store.sh"
alias lupingx="ffmpeg -y -f avfoundation -i 1:0 -framerate 60 -c:v libx264 -r 60 -pix_fmt yuv420p -preset 0 -crf 19 -c:a aac -b:a 192k \"$HOME/Screen Record $(date "+%Y-%m-%d %H-%M-%S").mp4\""
alias luping="ffmpeg -f x11grab -s 1920x1080 -r 25 -i $DISPLAY -c:v libx264 -b:v 800k -s 1920x1080 test.mp4"
alias ce="emacsclient -c"
alias zipai="ffmpeg -f v4l2 -s 640x480 -i /dev/video0 output.mpg"
alias ssh="kitty +kitten ssh"

export LD_LIBRARY_PATH="/opt/local/include:/opt/local/include/gcc11"
export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
export PATH="$PATH:$HOME/go/bin"
#export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig"
export CPPFLAGS="-I/opt/local/include -I/opt/local/include/gcc11"
export LDFLAGS="-L/opt/local/lib -L/opt/local/lib/gcc11"
export CFLAGS="-I/opt/local/include -I/opt/local/include/gcc11"
export LIBRARY_PATH="/opt/local/include:/opt/local/include/gcc11"
export CPATH="/opt/local/include:/opt/local/include/gcc11"
export C_INCLUDE_PATH="/opt/local/lib:/opt/local/lib/gcc11"
if [ -e /Users/keke/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/keke/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
