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

# enable z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# run keychain
eval $(keychain --eval --noask --quiet id_ed25519)
