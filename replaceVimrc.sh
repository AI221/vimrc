#!/bin/bash
#to run:
curl -S https://raw.githubusercontent.com/AI221/vimrc/master/replaceVimrc.sh | bash

cd
mv .vimrc .oldvimrc
git clone https://www.github.com/ai221/vimrc TEMPDIR_DELETE
mv TEMPDIR_DELETE/.vimrc ./.vimrc
rm TEMPDIR_DELETE -rf
echo "Vimrc installed, old vimrc renamed to .oldvimrc"
