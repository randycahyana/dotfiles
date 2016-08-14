## Requirement: 
- Git
- Urxvt-unicode
- Inconsolata for powerline
- Vim
- I3-gaps
- i3-status
- Rofi

## Installation Step:
- Clone dotfiles repository along with the submodules
- Git clone --recursive git@github.com:ranch/dotfiles.git
 - Link files
        - ln -sf ~/dotfiles/bash/bashrc ~/.bashrc
        - ln -sf ~/dotfiles/bash/bash_profile ~/.bash_profile
        - ln -sf ~/dotfiles/bash/aliases ~/.aliases
        - ln -sf ~/dotfiles/bash/exports ~/.exports
        - ln -sf ~/dotfiles/bash/bash_prompt ~/.bash_prompt
        - ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
        - ln -sf ~/dotfiles/vim ~/.vim
        - ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
        - ln -sf ~/dotfiles/i3 ~/.i3
        - ln -sf ~/dotfiles/X/xinitrc ~/.xinitrc
        - ln -sf ~/dotfiles/X/Xresources ~/.Xresources
        - (optional) ln -sf ~/dotfiles/config/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/ 

