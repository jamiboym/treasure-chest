#!/bin/bash
# This script will compile and install tmux to INSTALL_DIR without requiring
# root access. Add INSTALL_DIR/local/bin to PATH once it successfully finishes.

# variables setup
INSTALL_VER=2.3
INSTALL_DIR=$HOME/workplace
set -e

# create directories
mkdir -p $INSTALL_DIR/local $INSTALL_DIR/tmp
cd $INSTALL_DIR/tmp

# download sources
wget https://github.com/tmux/tmux/releases/download/$INSTALL_VER/tmux-$INSTALL_VER.tar.gz
wget https://github.com/downloads/libevent/libevent/libevent-2.0.19-stable.tar.gz
wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz

# dependency: libevent
tar -xvf libevent-2.0.19-stable.tar.gz
cd libevent-2.0.19-stable
./configure --prefix=$INSTALL_DIR/local --disable-shared
make
make install
cd ..

# dependency: ncurses
tar -xvf ncurses-6.0.tar.gz
cd ncurses-6.0
CPPFLAGS="-P" ./configure --prefix=$INSTALL_DIR/local
make
make install
cd ..

# tmux
tar -xvf tmux-${INSTALL_VER}.tar.gz
cd tmux-${INSTALL_VER}
CFLAGS="-I$INSTALL_DIR/local/include -I$INSTALL_DIR/local/include/ncurses" LDFLAGS="-L$INSTALL_DIR/local/lib -L$INSTALL_DIR/local/include/ncurses -L$INSTALL_DIR/local/include" ./configure --prefix=$INSTALL_DIR/local
CPPFLAGS="-I$INSTALL_DIR/local/include -I$INSTALL_DIR/local/include/ncurses" LDFLAGS="-static -L$INSTALL_DIR/local/include -L$INSTALL_DIR/local/include/ncurses -L$INSTALL_DIR/local/lib" make
make install
cd ..

# cleanup
rm -rf $INSTALL_DIR/tmp
