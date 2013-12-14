# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Oh-my-zsh theme
ZSH_THEME="ys"

# Aliases
alias c="cd ~;clear"
alias s="screen -ls"

# Whois aliases
alias apnic='whois -h whois.apnic.net'
alias ripe='whois -h whois.ripe.net'
alias arin='whois -h whois.arin.net'
alias afrinic='whois -h whois.afrinic.net'
alias lacnic='whois -h whois.lacnic.net'
alias org='whois -h whois.pir.org'
alias edu='whois -h whois.educause.edu'
alias cctld='whois -h whois.iana.org'
alias bgp='whois -h riswhois.ripe.net'

# Oh-my-zsh plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Local settings
source ~/.zshrc-local
