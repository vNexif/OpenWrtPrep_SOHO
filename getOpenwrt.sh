#!/bin/bash

getRepo(){
    git clone https://git.openwrt.org/openwrt/openwrt.git;
    cd openwrt;
    
    #Get ath79 default config
    wget https://downloads.openwrt.org/releases/19.07.0/targets/ath79/generic/config.buildinfo -O .config
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
    #make menuconfig disabled because of fetched .config file
    #Comment wget and uncomment make menuconfig or type it yourself in your console
    #make menuconfig
    make download
    exit

