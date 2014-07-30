#!/bin/bash
rm -Rf bundle
cd ..
ln -s .vim/.vimrc .vimrc
cd .vim
git clone https://github.com/gmarik/vundle.git bundle/vundle
vim +PluginInstall +qall
