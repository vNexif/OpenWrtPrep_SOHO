#!/bin/bash

getRepo(){
    git clone https://git.openwrt.org/openwrt/openwrt.git;
    cd openwrt;
}

updateRepo(){
    ./scripts/feeds update -a;
    ./scripts/feeds install -a;
}


if ! [ -x "$(command -v git)" ]; then
    echo 'Error: git is not installed.' >&2
    exit 1
elif
    getRepo
    updateRepo
fi
