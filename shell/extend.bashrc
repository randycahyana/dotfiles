#
# ~/.extend.bashrc
#

# register dotfiles
dotfiles=(
	aliases
	bash_prompt
	usr_exports
	private
)

for file in "${dotfiles[@]}"; do
    [ -r "$HOME/.$file" ] && source $HOME/.$file
done
unset file

# run keychain
eval $(keychain --eval --noask --quiet id_ed25519)
