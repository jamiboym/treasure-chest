deploy-tmux:
	@ln -s ~/workplace/curly-invention/dotfiles/tmux.conf ~/.tmux.conf

deploy-vim:
	@ln -s ~/workplace/curly-invention/dotfiles/vimrc ~/.vimrc

deploy-bash:
	@ln -s ~/workplace/curly-invention/dotfiles/bash_profile ~/.bash_profile

deploy: deploy-tmux deploy-vim deploy-bash

clean:
	rm ~/.vimrc ~/.bash_profile ~/.tmux.conf
