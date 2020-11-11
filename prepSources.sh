#!/bin/sh

sources(){
    sed -i '$ a\\ndeb http://deb.debian.org/debian/ stretch main contrib\ndeb-src http://deb.debian.org/debian/ stretch main contrib' /etc/apt/sources.list
}

doUpdate(){
    apt update; apt dist-upgrade -y; reboot;
}

sources
doUpdate