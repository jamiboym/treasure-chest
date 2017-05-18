ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

mkdir-local:
	@mkdir -p ~/workplace/local

deploy-tmux:
	ln -s $(ROOT_DIR)dotfiles/tmux.conf ~/.tmux.conf

deploy-vim:
	ln -s $(ROOT_DIR)dotfiles/vimrc ~/.vimrc

deploy-dircolors: mkdir-local
	ln -s $(ROOT_DIR)dotfiles/dircolors ~/workplace/local/

deploy-git-completion: mkdir-local
	ln -s $(ROOT_DIR)dotfiles/git-completion.bash ~/workplace/local/

deploy-bash: deploy-dircolors deploy-git-completion
	ln -s $(ROOT_DIR)dotfiles/bash_profile ~/.bash_profile

deploy-private:
	@[ -f private/Makefile ] && make deploy -C private ||:

deploy: deploy-tmux deploy-vim deploy-bash deploy-private

clean-private:
	@[ -f private/Makefile ] && make clean -C private ||:

clean: clean-private
	rm ~/.vimrc ~/workplace/local/dircolors ~/.bash_profile ~/.tmux.conf ~/workplace/local/git-completion.bash
