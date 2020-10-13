#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
BROWSER=/usr/bin/firefox-developer
EDITOR=/usr/bin/vim
export TERM=rxvt-unicode-256color
alias ssh "TERM=xterm; ssh"

complete -C /usr/bin/terraform terraform
