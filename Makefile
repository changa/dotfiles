.PHONY: load_xdefaults create-home-if-needed

install: create-home-if-needed ~/.psqlrc ~/.tigrc ~/.gitconfig ~/.screenrc \
  ~/.tmux.conf ~/.pryrc ~/.gemrc load_xdefaults

# Obviously unnecessary… unless we only do a dry-run in an alternative
# directory provided by overriding HOME.
create-home-if-needed:
	mkdir -p ${HOME}

~/.gemrc:
	ln -sf $(CURDIR)/gemrc ~/.gemrc

~/.psqlrc:
	mkdir -p ~/.psql_history
	ln -sf $(CURDIR)/psqlrc ~/.psqlrc

~/.tigrc:
	ln -sf $(CURDIR)/tigrc ~/.tigrc

~/.gitexcludes:
	ln -sf $(CURDIR)/gitexcludes ~/.gitexcludes

~/.gitconfig: ~/.gitexcludes
	ln -sf $(CURDIR)/gitconfig ~/.gitconfig

~/.screenrc:
	ln -sf $(CURDIR)/screenrc ~/.screenrc

~/.tmux.conf:
	ln -sf $(CURDIR)/tmux.conf ~/.tmux.conf

~/.pryrc:
	ln -sf $(CURDIR)/pryrc ~/.pryrc

~/.Xdefaults: ~/.urxvt
	ln -sf $(CURDIR)/Xdefaults ~/.Xdefaults

~/.urxvt:
	ln -sf $(CURDIR)/urxvt ~/.urxvt

load_xdefaults: ~/.Xdefaults
	xrdb -quiet -load $(CURDIR)/Xdefaults
