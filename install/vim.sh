#!/bin/bash
# This script will compile and install vim to INSTALL_DIR without requiring
# root access. Add INSTALL_DIR/local/bin to PATH once it successfully finishes.

# variables setup
INSTALL_VER=8.0
INSTALL_DIR=$HOME/workplace
set -e

# create directories
mkdir -p $INSTALL_DIR/local $INSTALL_DIR/tmp $INSTALL_DIR/tmp/vim_src
cd $INSTALL_DIR/tmp

# download sources
wget ftp://ftp.vim.org/pub/vim/unix/vim-$INSTALL_VER.tar.bz2
wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz

# dependency: ncurses
tar -xvf ncurses-6.0.tar.gz
cd ncurses-6.0
CPPFLAGS="-P" ./configure --prefix=$INSTALL_DIR/local
make
make install
cd ..

# vim
tar -xvf vim-$INSTALL_VER.tar.bz2 -C $INSTALL_DIR/tmp/vim_src --strip-components=1
cd vim_src
LDFLAGS=-L$INSTALL_DIR/local/lib ./configure --prefix=$INSTALL_DIR/local
make
make install
cd ..

# cleanup
rm -rf $INSTALL_DIR/tmp


