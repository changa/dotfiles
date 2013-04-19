install: ~/.psqlrc ~/.tigrc ~/.gitconfig ~/.screenrc ~/.tmux.conf ~/.pryrc

~/.psqlrc:
	mkdir -p ~/.psql_history
	ln -s `pwd`/psqlrc ~/.psqlrc

~/.tigrc:
	ln -s `pwd`/tigrc ~/.tigrc

~/.gitexcludes:
	ln -s `pwd`/gitexcludes ~/.gitexcludes

~/.gitconfig: ~/.gitexcludes
	ln -s `pwd`/gitconfig ~/.gitconfig

~/.screenrc:
	ln -s `pwd`/screenrc ~/.screenrc

~/.tmux.conf:
	ln -s `pwd`/tmux.conf ~/.tmux.conf

~/.pryrc:
	ln -s `pwd`/pryrc ~/.pryrc
