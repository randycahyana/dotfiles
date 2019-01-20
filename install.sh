#!/bin/bash

SRC="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# shell config
for i in $(ls $SRC/shell); do
  if [[ ! -f $i && ! -e $HOME/.$i ]]; then
    ln -svf $SRC/shell/$i $HOME/.$i
  fi
done

# apps config
for i in $(ls $SRC/config); do
  if [[ ! -f $i && ! -e $HOME/.config/$i ]]; then
    ln -svf $SRC/config/$i $HOME/.config/$i
  fi
done

# ssh config
for i in $(ls $SRC/ssh); do
  if [[ ! -f $i && ! -e $HOME/.config/$i ]]; then
    ln -svf $SRC/ssh/$i $HOME/.ssh/$i
  fi
done

# git config
for i in $(ls $SRC/git); do
  if [[ ! -f $i && ! -e $HOME/.$i ]]; then
    ln -svf $SRC/git/$i $HOME/.$i
  fi
done

# X config
for i in $(ls $SRC/X); do
  if [[ ! -f $i && ! -e $HOME/.$i ]]; then
    ln -svf $SRC/X/$i $HOME/.$i
  fi
done
