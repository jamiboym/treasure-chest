#!/bin/bash
# This script will compile and install ag to INSTALL_DIR without requiring root
# access. Add INSTALL_DIR/local/bin to PATH, and INSTALL_DIR/local/lib to
# LD_LIBRARY_PATH  once it successfully finishes.

# variables setup
INSTALL_VER=1.0.2
INSTALL_DIR=$HOME/workplace
set -e

# create directories
mkdir -p $INSTALL_DIR/local $INSTALL_DIR/tmp
cd $INSTALL_DIR/tmp

# download sources
wget https://geoff.greer.fm/ag/releases/the_silver_searcher-$INSTALL_VER.tar.gz
wget https://pkgconfig.freedesktop.org/releases/pkg-config-0.29.1.tar.gz
wget https://ftp.pcre.org/pub/pcre/pcre-8.40.tar.gz
wget http://tukaani.org/xz/xz-5.2.3.tar.gz

# dependency: pkg-config
tar -xvf pkg-config-0.29.1.tar.gz
cd pkg-config-0.29.1/
./configure --prefix=$INSTALL_DIR/local --with-internal-glib
make
make install
cd ..

# dependency: pcre
tar -xvf pcre-8.40.tar.gz
cd pcre-8.40/
./configure --prefix=$INSTALL_DIR/local
make
make install
cd ..

# dependency: xz
tar -xvf xz-5.2.3.tar.gz
cd xz-5.2.3/
./configure --prefix=$INSTALL_DIR/local
make
make install
cd ..

# configure and install
tar -xvf the_silver_searcher-$INSTALL_VER.tar.gz
cd the_silver_searcher-$INSTALL_VER
PATH=$INSTALL_DIR/local/bin:$PATH LD_LIBRARY_PATH=$INSTALL_DIR/local/lib:$LD_LIBRARY_PATH ./configure --prefix=$INSTALL_DIR/local
make
make install

# cleanup
rm -rf $INSTALL_DIR/tmp
