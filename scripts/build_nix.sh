#!/bin/bash
set -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)
BUILD_DIR=$SCRIPT_DIR/build
INSTALL_DIR=/Users/keke/.keke
DOWNLOAD_DIR=$SCRIPT_DIR/download

PATH=$INSTALL_DIR/bin:$PATH

download() {
    local url=$1
    local f=$(basename $1)
    if [ -n "$2" ]; then
        f=$2
    fi

    if [ -f $DOWNLOAD_DIR/$f ]; then
        echo "$f is already downloaded"
        return
    fi

    pushd $DOWNLOAD_DIR
    curl -OL $url
    popd
}

easy_install() {
    local url=$1
    local f=$(basename $1)
    local d=${f/%.tar.gz/}
    if [ ! -d $d ]; then
        echo "installing $d"
        download $url
        tar xf $DOWNLOAD_DIR/$f -C .
        pushd $d
        ./configure --prefix=$INSTALL_DIR
        make
        make install
        popd
    fi
}

#xz
if [ ! -d xz-5.2.5 ]; then
    echo "installing xz"
    download https://tukaani.org/xz/xz-5.2.5.tar.gz
    tar xf $DOWNLOAD_DIR/xz-5.2.5.tar.gz -C .
    pushd xz-5.2.5
    ./configure --prefix=$INSTALL_DIR
    make
    make install
    popd
fi

if [ ! -d boost_1_76_0 ]; then
    echo "installing boost"
    download https://boostorg.jfrog.io/artifactory/main/release/1.76.0/source/boost_1_76_0.tar.gz
    tar xf $DOWNLOAD_DIR/boost_1_76_0.tar.gz -C .
    pushd boost_1_76_0
    ./bootstrap.sh --prefix=$INSTALL_DIR
    ./b2 install
    popd
fi
export BOOST_ROOT=$SCRIPT_DIR/boost_1_76_0

# pkgconfig
if [ ! -d pkg-config-0.29.2 ]; then
    echo "installing pkg-config"
    download https://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
    tar xf $DOWNLOAD_DIR/pkg-config-0.29.2.tar.gz -C .
    pushd pkg-config-0.29.2
    ./configure --prefix=$INSTALL_DIR --with-internal-glib
    make
    make install
    popd
fi

# openssl
if [ ! -d openssl-1.1.1k ]; then
    echo "installing openssl"
    download https://github.com/openssl/openssl/archive/refs/tags/OpenSSL_1_1_1k.tar.gz
    tar xf $DOWNLOAD_DIR/OpenSSL_1_1_1k.tar.gz -C .
    pushd openssl-OpenSSL_1_1_1k
    ./config --prefix=$INSTALL_DIR
    make
    make install
    popd
fi

# sqlite
if [ ! -d sqlite-autoconf-3350500 ]; then
    echo "installing sqlite"
    download https://www.sqlite.org/2021/sqlite-autoconf-3350500.tar.gz
    tar xf $DOWNLOAD_DIR/sqlite-autoconf-3350500.tar.gz -C .
    pushd sqlite-autoconf-3350500
    ./configure --prefix=$INSTALL_DIR
    make
    make install
    popd
fi

easy_install https://curl.se/download/curl-7.76.1.tar.gz

easy_install https://github.com/troglobit/editline/releases/download/1.17.1/editline-1.17.1.tar.gz

easy_install https://github.com/Kitware/CMake/releases/download/v3.20.1/cmake-3.20.1.tar.gz

if [ ! -d brotli-1.0.9 ]; then
    git clone https://github.com/google/brotli
    pushd brotli
    mkdir out && pushd out
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_MACOSX_RPATH=ON -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR ..
    cmake --build . --config Release --target install
    popd
    popd
fi

if [ ! -d libsodium-1.0.18-stable ]; then
    download https://download.libsodium.org/libsodium/releases/libsodium-1.0.18-stable.tar.gz
    tar xf $DOWNLOAD_DIR/libsodium-1.0.18-stable.tar.gz -C .
    pushd libsodium-stable
    ./configure --prefix=$INSTALL_DIR
    make
    make install
    popd
fi

# nix
# if [ ! -d nix-2.3.10 ]; then
#     download https://nixos.org/releases/nix/nix-2.3.10/nix-2.3.10.tar.xz
#     tar xf $DOWNLOAD_DIR/nix-2.3.10.tar.xz -C .
#     pushd nix-2.3.10
#     ./configure --prefix=$INSTALL_DIR --with-store-dir=$HOME/nix/store --localstatedir=$HOME/nix/var --sysconfdir=$HOME/nix/etc --with-boost=$INSTALL_DIR
#     make
#     make install
#     popd
# fi

## cd nix-2.3.10
## ./configure --prefix=$INSTALL_DIR --with-store-dir=$HOME/nix/store --localstatedir=$HOME/nix/var --sysconfdir=$HOME/nix/etc --with-boost=$INSTALL_DIR
## make
## make install
# 
