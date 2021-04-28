DIR := ~/.config
RDIR := ./.config

ifeq ($(wildcard ~/.zinit),)
$(shell mkdir ~/.zinit && git clone https://github.com/zdharma/zinit.git ~/.zinit/bin)
endif

ifeq ($(wildcard ~/Repos/password-store),)
$(shell mkdir ~/Repos & git clone https://git.zx2c4.com/password-store ~/Repos/password-store)
endif

mac: all macpath

all: zsh config git

zsh:
	@cp -v .zshrc ~/.zshrc
	@cp -v .p10k.zsh ~/.p10k.zsh
	@cp -v .zprofile ~/.zprofile
	@echo "🤪 zsh 完成"

config:
	@cp -rv $(RDIR)/kitty $(DIR)
	@cp -rv $(RDIR)/rime $(DIR)
	@echo "🤪 ~/.config 完成"
git:
	@git config --global user.email librek@protonmail.com
	@git config --global user.name keke
	@git config --global user.signingkey librek@protonmail.com
	@git config --global commit.gpgsign true
	@echo "🤪 git 完成"

macpath:
	@sudo perl -i -l -p -e 'print "/Users/keke/.local/bin\n/opt/local/sbin\n/opt/local/bin" if $$. == 1' /etc/paths
	@echo "makefile里的perl $ 符号需要进行转义($$)"
	@echo "🤪 /etc/paths 完成"

clean:
	@rm -rvf $(DIR)/{kitty,rime}
	@rm -rvf ~/.zinit ~/.zshrc ~/.p10k.zsh ~/.zprofile ~/.gitconfig ~/Repos/password-store
	@echo "🚮 清理完成～"
