install: create-home-if-needed ~/.psqlrc ~/.tigrc ~/.gitconfig ~/.screenrc \
  ~/.tmux.conf ~/.pryrc ~/.Xdefaults

# Obviously unnecessary… unless we only do a dry-run in an alternative
# directory provided by overriding HOME.
create-home-if-needed:
	mkdir -p ${HOME}

~/.psqlrc:
	mkdir -p ~/.psql_history
	ln -sf `pwd`/psqlrc ~/.psqlrc

~/.tigrc:
	ln -sf `pwd`/tigrc ~/.tigrc

~/.gitexcludes:
	ln -sf `pwd`/gitexcludes ~/.gitexcludes

~/.gitconfig: ~/.gitexcludes
	ln -sf `pwd`/gitconfig ~/.gitconfig

~/.screenrc:
	ln -sf `pwd`/screenrc ~/.screenrc

~/.tmux.conf:
	ln -sf `pwd`/tmux.conf ~/.tmux.conf

~/.pryrc:
	ln -sf `pwd`/pryrc ~/.pryrc

~/.Xdefaults: ~/.urxvt
	ln -sf `pwd`/Xdefaults ~/.Xdefaults

~/.urxvt:
	ln -sf `pwd`/urxvt ~/.urxvt
