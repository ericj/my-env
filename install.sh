#!/bin/sh
#set -x
PWD=$(pwd)

if ! [ -d "$HOME/.vim/bundle/vundle" ]; then
    echo "install vundle plugin for vim..."
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

echo "creating vimrc soft link..."
ln -sf "$PWD/vimrc" "$HOME/.vimrc"

echo "vim :BundleInstall"
vim +BundleInstall +qall!

echo "install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "creating tmux.conf soft link..."
ln -sf "$PWD/tmux.conf" "$HOME/.tmux.conf"

echo "cp my utils"
ln -sf "$PWD/bin" $HOME/bin

echo "creating gitignore soft link"
ln -sf "$PWD/gitignore" "$HOME/.gitignore"
