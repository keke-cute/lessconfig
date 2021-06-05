DIR := ~/.config
PWD := $(shell pwd)
RDIR := $(shell pwd)/.config
HOME := $(shell echo $$HOME)

ifeq ($(wildcard ~/.zinit),)
$(shell mkdir ~/.zinit && git clone https://github.com/zdharma/zinit.git ~/.zinit/bin)
endif

#ifeq ($(wildcard ~/Repos/password-store),)
#$(shell mkdir ~/Repos & git clone https://git.zx2c4.com/password-store ~/Repos/password-store)
#endif

ryzen: mac nix1

mba: mac nix2

mac: all macpath squirrel hammerspoon key

all: zsh kitty rime git

zsh:
	@ln -s $(PWD)/.zshrc $(HOME)/.zshrc
        @ln -s $(PWD)/.zprofile $(HOME)/.zprofile
	@ln -s $(PWD)/.p10k.zsh $(HOME)/.p10k.zsh
	@echo "🤪 zsh 完成"

kitty:
	@ln -s $(RDIR)/kitty/kitty.conf $(DIR)/kitty
	@echo "🤪 kitty 完成"

rime:
	@ln -s $(RDIR)/rime $(DIR)
	@echo "🤪 rime 完成"

git:
	@git config --global user.email librek@protonmail.com
	@git config --global user.name keke
	@git config --global user.signingkey librek@protonmail.com
	@git config --global commit.gpgsign true
	@echo "🤪 git 完成"

nix1:
	@ln -s $(RDIR)/nixpkgs/ryzen.nix $(DIR)/nixpkgs/home.nix
	@echo "😛 nix 完成"

nix2:
	@ln -s $(RDIR)/nixpkgs/mba.nix $(DIR)/nixpkgs/home.nix
	@echo "😛 nix 完成"

#mpv:
#	@ln -s $(RDIR)/mpv $(DIR)
#	@echo "😛 mpv 完成"

key:
	@ln -s $(RDIR)/karabiner $(DIR)
	@echo "😛 karabiner 完成"

macpath:
	@sudo perl -i -l -p -e 'print "/Users/keke/.local/bin\n/opt/local/sbin\n/opt/local/bin" if $$. == 1' /etc/paths
	@echo "makefile里的perl $ 符号需要进行转义($$)"
	@echo "🤪 /etc/paths 完成"

squirrel:
	@cp -rv $(RDIR)/rime/* ~/Library/Rime
	@echo "🤪 鼠须管完成"

hammerspoon:
	@ln -s $(PWD)/.hammerspoon $(HOME)
	@echo "🤪 hammerspoon 完成"

#clean:
#	@rm -rvf $(DIR)/{kitty,rime}
#	@rm -rvf ~/.zinit ~/.zshrc ~/.p10k.zsh ~/.zprofile ~/.gitconfig ~/Repos/password-store
#	@echo "🚮 清理完成～"
