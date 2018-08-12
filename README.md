# treasure-chest

[jami's](http://www.jamiboy.com) development environment treasure chest.

## Dotfiles

The `dotfiles` folder contains the `.bash_profile`, `.vimrc`, and the `.tmux.conf`. Running `make deploy` will create symbolic links to the home folder. Changes in the repo will reflect in the home folder, and vice versa. Running `make clean` will remove the deployed links.

## Initial Setup

Running `vim` for the first time will check if [Vim-Plug](https://github.com/junegunn/vim-plug) will be needed to be downloaded, and an initial `:PlugInstall` will be invoked. **Note:** Version 8 is required for [ale](#ale), a linter plugin, to run.

Running `tmux` will install [tpm](https://github.com/tmux-plugins/tpm) on its initial execution. To install the rest of the plugins, press `<prefix> + I`.

## Terminal

The configurations assume that the terminal is using [solarized](http://ethanschoonover.com/solarized) colors. There are terminal files under the `terminal` folder that can be used to set this up.

## Branches

Since the dotfiles are symbolically linked to the repository, they can easily be switched by changing branches. This allows for setting up different profiles for different machines, or wanting to try something out. The main branches are `master`, meant for MacOS deployments, and `linux-base`, meant for Linux deployments.
