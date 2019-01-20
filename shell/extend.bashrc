#
# ~/.extend.bashrc
#

# register dotfiles
dotfiles=(
	aliases
	bash_prompt
	usr_exports
)

for file in "${dotfiles[@]}"; do
    [ -r "$HOME/.$file" ] && source $HOME/.$file
done
unset file
