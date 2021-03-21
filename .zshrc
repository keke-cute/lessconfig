# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

source ~/.zinit/bin/zinit.zsh
# 语法高亮
zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting

# 自动建议
zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# 补全
zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions

# 加载 OMZ 框架及部分插件
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

zinit ice lucid wait='1'
zinit snippet OMZ::plugins/git/git.plugin.zsh

zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 个人设置

alias lupingx="ffmpeg -y -f avfoundation -i 1:0 -framerate 60 -c:v libx264 -r 60 -pix_fmt yuv420p -preset 0 -crf 19 -c:a aac -b:a 192k \"$HOME/Screen Record $(date "+%Y-%m-%d %H-%M-%S").mp4\""
alias luping="ffmpeg -f x11grab -s 1920x1080 -r 25 -i $DISPLAY -c:v libx264 -b:v 800k -s 1920x1080 test.mp4"
alias ce="emacsclient -c"
alias e="/Applications/MacPorts/EmacsMac.app/Contents/MacOS/Emacs -nw"
alias ge="/Applications/MacPorts/EmacsMac.app/Contents/MacOS/Emacs"
alias zipai="ffmpeg -f v4l2 -s 640x480 -i /dev/video0 output.mpg"
export PATH="$PATH:$HOME/go/bin"
