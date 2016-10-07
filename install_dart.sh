#!/usr/bin/env bash

sudo apt-get update

sudo apt-get install apt-transport-https

command -v curl >/dev/null 2>&1 || {
    echo "install curl"
    sudo apt-get install curl
}

sudo sh -c "curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -"

sudo sh -c "curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list"

sudo apt-get update

sudo apt-get install dart

command -v pub >/dev/null 2>&1 || {
    echo "pub not found! add it to the path"
    echo "$PATH=$PATH:/usr/lib/dart/bin/" >> ~/.profile
}

echo "get atom latest"
curl -L https://atom.io/download/deb > atom.deb

sudo dpkg -i atom.deb

sudo apt-get install -f

rm -r atom.deb
