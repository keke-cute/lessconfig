DIR := ~/.config
RDIR := ./.config
mac:
	cp -rv $(RDIR)/{kitty,rime} $(DIR)
	echo "🍎 部署完成"
clean:
	rm -rvf $(DIR)/{kitty,rime}
	echo "🚮 清理完成～"
