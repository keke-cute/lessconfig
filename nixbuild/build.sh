#!/bin/bash
set -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)
BUILD_DIR=$SCRIPT_DIR/build
INSTALL_DIR=$SCRIPT_DIR/root
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
    download https://dl.bintray.com/boostorg/release/1.76.0/source/boost_1_76_0.tar.gz
    tar xf $DOWNLOAD_DIR/boost_1_76_0.tar.gz -C .
    pushd boost_1_76_0
    ./bootstrap.sh --prefix=$INSTALL_DIR
    ./b2 install
    popd
fi
export BOOST_ROOT=$SCRIPT_DIR/boost_1_76_0

# pkgconfig
if [ ! -d pkg-config-0.29.2 ]; then
    #download 
    tar xf $DOWNLOAD_DIR/pkg-config-0.29.2.tar.gz -C .
    pushd pkg-config-0.29.2
    ./configure --prefix=$INSTALL_DIR --with-internal-glib
    make
    make install
    popd
fi

easy_install https://github.com/troglobit/editline/releases/download/1.17.1/editline-1.17.1.tar.gz

easy_install https://curl.se/download/curl-7.76.1.tar.gz
