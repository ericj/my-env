#!/bin/bash
brew install vim openssl readline sqlite3 xz zlib git tcl-tk pyenv awscli automake \
    shellcheck cmake youtube-dl ffmpeg tmux ctags \
    pipx pyenv-virtualenv bat

env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.11.1

pipx install aws-adfs
