install: ~/.psqlrc ~/.tigrc

~/.psqlrc:
	mkdir -p ~/.psql_history
	ln -s `pwd`/psqlrc ~/.psqlrc

~/.tigrc:
	ln -s `pwd`/tigrc ~/.tigrc

~/.gitexcludes:
	ln -s `pwd`/gitexcludes ~/.gitexcludes

~/.gitconfig: ~/.gitexcludes
	ln -s `pwd`/gitconfig ~/.gitconfig
