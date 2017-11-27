# user
#git config --global user.email "ericj.tw@gmail.com"
#git config --global user.name "kuanhung"

# alias
git config --global alias.st status
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.ci commit

# editor
git config --global core.editor /usr/local/bin/vim

# difftool
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool

# mergetool
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false
