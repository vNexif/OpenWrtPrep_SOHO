#!/bin/bash

getRepo(){
    git clone https://git.openwrt.org/openwrt/openwrt.git;
    cd openwrt;
}

getDeps(){
    apt install gawk zlib1g libncurses5 libncurses5-dev libncursesw5-dev g++ flex unzip wget rsync
}

updateRepo(){
    ./scripts/feeds update -a;
    ./scripts/feeds install -a;
}


if ! [ -x "$(command -v git)" ]; then
    echo 'Error: git is not installed.' >&2
    exit 1
fi

    getRepo
    getDeps
    updateRepo
    ./../compile;

