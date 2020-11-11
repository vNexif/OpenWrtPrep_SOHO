#!/bin/bash

getRepo(){
    git clone https://git.openwrt.org/openwrt/openwrt.git;
    cd openwrt;
}

updateRepo(){
    bash ./scripts/feeds update -a;
    bash ./scripts/feeds install -a;
}


if ! [ -x "$(command -v git)" ]; then
    echo 'Error: git is not installed.' >&2
    exit 1
fi

    getRepo
    updateRepo
    exit

