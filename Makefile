ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

confirmation:
	@echo "Are you sure? [y/N] \c" && read ans && [ $${ans:-N} == y ]

deploy-tmux:
	ln -s $(ROOT_DIR)dotfiles/tmux.conf ~/.tmux.conf

deploy-vim:
	ln -s $(ROOT_DIR)dotfiles/vimrc ~/.vimrc

deploy-bash:
	ln -s $(ROOT_DIR)dotfiles/bash_profile ~/.bash_profile

deploy: confirmation deploy-tmux deploy-vim deploy-bash

clean: confirmation
	rm ~/.vimrc ~/.bash_profile ~/.tmux.conf
