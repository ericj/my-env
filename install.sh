#!/bin/sh
#set -x
PWD=`pwd`

if ! [ -d "$HOME/.vim/bundle/vundle" ]; then
    echo "install vundle plugin for vim..."
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

echo "creating vimrc soft link..."
ln -sf $PWD/vimrc ~/.vimrc

echo "vim :BundleInstall"
vim +BundleInstall +qall!
