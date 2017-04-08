#
# ~/.extend.bashrc
#

# Register dotfiles
dotfiles=(
    aliases
    bash_prompt
    usr_exports
)

# Load dotfiles
for file in "${dotfiles[@]}"; do
    [ -r "$HOME/.$file" ] && source $HOME/.$file
done
unset file
