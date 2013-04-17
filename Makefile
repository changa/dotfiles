install: ~/.psqlrc

~/.psqlrc:
	mkdir -p ~/.psql_history
	ln -s `pwd`/psqlrc ~/.psqlrc
