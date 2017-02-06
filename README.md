# curly-invention

[jami's](http://www.jamiboy.com) development environment treasure chest.

## Dotfiles

The `dotfiles` folder contains the `.bash_profile`, `.vimrc`, and the `.tmux.conf`. Running `make deploy` will create symbolic links to the home folder. Changes in the repo will reflect in the home folder, and vice versa. Running `make clean` will remove the deployed links.

**Important:** The make file, and a few other stuff, assumes that this repository is in `~/workplace/curly-invention`.

## Initial Setup

In its default configuration, [ag](#ag) and [core-utils](#core-utils) will be needed to be installed. Of course, these can be commented out from `bash_profile`.

Running `vim` for the first time will check if [Vim-Plug](https://github.com/junegunn/vim-plug) will be needed to be downloaded, and an initial `:PlugInstall` will be invoked. **Note:** Version 8 is required for [ale](#ale), a linter plugin, to run.

Running `tmux` will install [tpm](https://github.com/tmux-plugins/tpm) on its initial execution. To install the rest of the plugins, press `<prefix> + I`. **Note:** `tmux` will fail to run if the executable `reattach-to-user-namespace` is not installed, possibly through `brew`. Otherwise, this line can be commented out from `.tmux.conf`

## Terminal

The configurations assume that the terminal is using [solarized](http://ethanschoonover.com/solarized) colors. There are terminal files under the `terminal` folder that can be used to set this up.

## Branches

Since the dotfiles are symbolically linked to the repository, they can easily be switched by changing branches. This allows for setting up different profiles for different machines, or wanting to try something out. The main branches are `master`, meant for MacOS deployments, and `linux-base`, meant for Linux deployments.

## Local Executables

There are 3 scripts under the `install` directory that automatically download and install core tools for the development environment.

For all installations, ensure that `wget`, `make`, `g++`, `gcc`, and `tar` are on the machine.

Post-installation, make sure to adjust your `PATH` and `LD_LIBRARY_PATH` accordingly. There is a line that is commented out in `bash_profile` for this.

## Configurations

### ag

`ag` is used for [fzf](https://github.com/junegunn/fzf.vim) in the vim configuration. If it cannot be installed on the machine due to the lack of permissions, see [Local Executables](#local-executables). For more information, visit [ag's github page](https://github.com/ggreer/the_silver_searcher).

### ale

`ale` is the linter used in the vim configuration. It requires version 8 to be used for asynchronous jobs. If vim 8 cannot be installed on the machine due to the lack of permissions, see [Local Executables](#local-executables). For more information, see [ale's github page](https://github.com/w0rp/ale).

### core-utils

For **MacOS users**, `core-utils` brings `gls` and `gdircolors` to the system, allowing for customized, colored `ls` output. This can be installed with `brew` (`brew install core-utils`).

For **Linux users**, no installation is needed. Checkout the `linux-base` branch of the repo (`git checkout linux-base`) to use `ls` and `dircolors` instead of its `core-utils` counterpart.
