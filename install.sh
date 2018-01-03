#!/bin/bash

SRC="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# link shell config
for i in $(ls $SRC/shell); do
  if [[ ! -f $i && ! -e $HOME/.$i ]]; then
    echo "Linking: $SRC/bash/$i to ~/.$i"
    ln -sf $SRC/shell/$i $HOME/.$i
  fi
done

for i in $(ls $SRC/config); do
  if [[ ! -f $i && ! -e $HOME/.$i ]]; then
    echo "Linking: $SRC/config/$i to ~/.config/$i"
    ln -sf $SRC/config/$i $HOME/.config/$i
  fi
done

for i in $(ls $SRC/git); do
  if [[ ! -f $i && ! -e $HOME/.$i ]]; then
    echo "Linking: $SRC/git/$i to ~/.$i"
    ln -sf $SRC/git/$i $HOME/.$i
  fi
done
