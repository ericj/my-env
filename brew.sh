#!/bin/bash
brew install vim openssl readline sqlite3 xz zlib git tcl-tk pyenv awscli automake

env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.10.0
