# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Oh-my-zsh theme
ZSH_THEME="af-magic"

# Aliases
alias c="cd ~;clear"

# Oh-my-zsh plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Local settings
source ~/.zshrc-local
