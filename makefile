DIR := ~/.config
PWD := $(shell pwd)
RDIR := $(shell pwd)/.config
HOME := $(shell echo $$HOME)

# Rime
ifeq ($(wildcard ~/Library/Rime),)
$(shell mkdir ~/Library/Rime)
endif

# zinit
ifeq ($(wildcard ~/.zinit),)
$(shell mkdir ~/.zinit && git clone https://github.com/zdharma/zinit.git ~/.zinit/bin)
endif

# mkdir nixpkgs
ifeq ($(wildcard ~/.config/nixpkgs),)
$(shell mkdir ~/.config/nixpkgs)
endif

ryzen: mac nix1

mba: mac nix2

mac: all squirrel hammerspoon karabiner

all: zsh kitty rime git tmux

zsh:
	@ln -s $(PWD)/.zshrc $(HOME)/.zshrc
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

tmux:
	@ln -s $(PWD)/.tmux.conf $(HOME)/.tmux.conf

nix1:
	@ln -s $(RDIR)/nixpkgs/ryzen.nix $(DIR)/nixpkgs/home.nix
	@echo "😛 nix 完成"

nix2:
	@ln -s $(RDIR)/nixpkgs/mba.nix $(DIR)/nixpkgs/home.nix
	@echo "😛 nix 完成"

karabiner:
	@ln -s $(RDIR)/karabiner $(DIR)
	@echo "😛 karabiner 完成"

macpath:
#makefile里的perl $ 符号需要进行转义($$)
	@sudo perl -i -l -p -e 'print "/Users/keke/.nix-profile/bin\n/nix/bin" if $$. == 1' /etc/paths
	@echo "🤪 /etc/paths 完成"

squirrel:
	@cp -rv $(RDIR)/rime/* ~/Library/Rime
	@echo "🤪 鼠须管完成"

hammerspoon:
	@ln -s $(PWD)/.hammerspoon $(HOME)
	@echo "🤪 hammerspoon 完成"
