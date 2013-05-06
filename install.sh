#!/bin/bash
rm -Rf bundle
ln -s .vimrc ../.vimrc
git clone https://github.com/gmarik/vundle.git bundle/vundle
vim +BundleInstall +qall
