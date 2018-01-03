#!/bin/bash

SRC="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# link shell config
for i in $(ls $SRC/bash); do
  if [[ ! -f $i && ! -e $HOME/.$i ]]; then
    echo "Linking: $SRC/bash/$i to ~/.$i"
    ln -s $SRC/shell/$i $HOME/.$i
  fi
done

echo "Linking: $SRC/nvm to ~/.config/nvim"
mkdir -p ~/.config
ln -s $SRC/config/nvim ~/.config/nvim

echo "Linking: $SRC/git/gitconfig to ~/.gitconfig"
ln -s $SRC/git/gitconfig ~/.gitconfig
