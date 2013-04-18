install: ~/.psqlrc ~/.tigrc

~/.psqlrc:
	mkdir -p ~/.psql_history
	ln -s `pwd`/psqlrc ~/.psqlrc

~/.tigrc:
	ln -s `pwd`/tigrc ~/.tigrc
