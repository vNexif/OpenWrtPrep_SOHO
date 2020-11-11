#!/bin/bash

beSu(){
    su -
}

getEssential(){
    apt install linux-headers-amd64 make sudo build-essential -y
}

createUsers(){
    /usr/sbin/adduser --disabled-password --shell /sbin/nologin osboxes 
    /usr/sbin/usermod -a -G sudo osboxes
    echo ' osboxes ALL=(ALL)    ALL' >> /etc/sudoers
}

#check if user is equal to 0
if [ "$EUID" -ne 0 ]; then
    beSu
fi
if [ "$EUID" = 0 ]; then
    getEssential
    createUsers
fi