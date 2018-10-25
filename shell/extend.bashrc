#
# ~/.extend.bashrc
#

# Register dotfiles
dotfiles=(
	aliases
	bash_prompt
	usr_exports
	private
)

# Load dotfiles
for file in "${dotfiles[@]}"; do
    [ -r "$HOME/.$file" ] && source $HOME/.$file
done
unset file

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh


eval $(keychain --eval --noask --quiet id_ed25519)
