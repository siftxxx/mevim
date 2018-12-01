#!/bin/bash

if [ -e ~/.vimrc ]; then
  cp ~/.vimrc ~/vimrc.bak
  rm -f ~/.vimrc
fi
mv vimrc ~/.vimrc

if [ -e ~/.vim ]; then
  cp -r ~/.vim ~/vim.bak
  rm -rf ~/.vim
fi
mv vim ~/.vim

echo "Successfully Deploy dai's vim."
