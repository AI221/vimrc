#!/bin/bash
cd
mv .vimrc .oldvimrc
git clone https://www.github.com/ai221/vimrc TEMPDIR_DELETE
mv TEMPDIR_DELETE/.vimrc .
rm TEMPDIR_DELETE -rf
echo "Vimrc installed, old vimrc renamed to .oldvimrc"
