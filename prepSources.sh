#!/bin/sh

#check debian version
Deb_Ver=$(cat /etc/os-release | grep "VERSION_ID" | awk -F "\"" '{print $2}')

if [ $Deb_Ver = "9" ]; then
    sources(){
        sed -i '$ a\\ndeb http://deb.debian.org/debian/ stretch main contrib\ndeb-src http://deb.debian.org/debian/ stretch main contrib' /etc/apt/sources.list
    }
fi

if [ $Deb_Ver = "10" ]; then
    sources(){
        sed -i '$ a\\ndeb http://deb.debian.org/debian buster main contrib\ndeb-src http://deb.debian.org/debian buster main contrib' /etc/apt/sources.list
    }
fi

doUpdate(){
    apt update;
    apt dist-upgrade -y;
    /sbin/reboot;
}

sources
doUpdate