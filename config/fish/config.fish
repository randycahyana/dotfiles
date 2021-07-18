# Go 
set -gx GOROOT /home/$USER/go
set -gx GOROOT_BOOTSTRAP /usr/local/go1.9.5
set -gx GOPATH /home/$USER/workspace

# PATH
set -gx PATH $GOROOT/bin $PATH
set -gx PATH $GOPATH/bin $PATH
set -gx PATH /home/$USER/.local/bin $PATH
set -gx PATH /home/$USER/google-cloud-sdk/bin $PATH
set -gx PATH /home/$USER/.yarn/bin $PATH

# Aliases
alias d="kitty +kitten diff"
alias dc="docker-compose"
alias dot="cd $HOME/dotfiles"
alias tf="terraform"

# Kitty completion
kitty + complete setup fish

## kubectl
set -gx KUBE_EDITOR vim

alias kc="kubectl"
function kcc
	if test (count $argv) -eq 0
		kc config get-contexts
	else
		kc config use-context $argv
	end
end

alias ktop="kubectl top pod -A | sort --reverse --key 3 --numeric | head -5"

## gcloud
alias gcl="gcloud"
function gclc
	if test (count $argv) -eq 0
		set -gx KUBECONFIG /home/$USER/.kube/config
		gcl config configurations activate local
	else
		set -gx KUBECONFIG /home/$USER/.kube/config-$argv
		gcl config configurations activate $argv
	end
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f "/home/$USER/google-cloud-sdk/path.fish.inc" ]; . "/home/$USER/google-cloud-sdk/path.fish.inc"; end

# Load user config files
for f in /home/randy/dotfiles/config/fish/usr/*
	source $f
end
