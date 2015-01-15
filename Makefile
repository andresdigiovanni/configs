all:
	@echo "This Makefile isn't intended to build anything."
	@echo "Run 'make setup-unix' to setup the configuration."



# Setup for "everything" except Vim.
setup-unix:
	ln -sf ${PWD}/bashrc ~/.bashrc
	ln -sf ${PWD}/aliases ~/.aliases
	ln -sf ${PWD}/environment ~/.environment
	test ~/.kde/ && test -d ~/.kde/env || mkdir -p ~/.kde/env/
	ln -sf ${PWD}/environment ~/.kde/env/environment.sh
	@# This config is for git to modify at will, so is only copied. Is where the
	@# user name and email can be set to each ones values.
	cp -f ${PWD}/gitconfig ~/.gitconfig
	@# This is not changed by "git config --global", so it can be under version
	@# control, and improved by hand like the other files.
	ln -sf ${PWD}/gitconfig.extra ~/.gitconfig.extra
	ln -sf ${PWD}/tmux.conf ~/.tmux.conf
	@# Set the symbolic links for vim, but not the submodules for plugins.
	ln -sf ${PWD}/vimrc ~/.vimrc
	test -L ~/.vim || ln -sf ${PWD}/dotvim ~/.vim
