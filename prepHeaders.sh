beSu(){
    su -
}

getEssential(){
    apt install linux-headers-amd64 make sudo build-essential -y
}

if [ "$EUID" -ne 0 ]; then
    beSu
fi

getEssential