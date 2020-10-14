#               __             
#   ____  _____/ /_  __________
#  /_  / / ___/ __ \/ ___/ ___/
# _ / /_(__  ) / / / /  / /__  
#(_)___/____/_/ /_/_/   \___/  
#

# export thingys
export ZSH="/home/$USER/.oh-my-zsh"
export BROWSER=/usr/bin/firefox-developer-edition
export EDITOR=/usr/bin/vim
export SSH_KEY_PATH="~/.ssh/id_rsa"
export PATH=$PATH:$HOME/bin
export GPG_TTY=$(tty)
export PATH=$PATH:$HOME/.local/bin

# zsh theme 
ZSH_THEME='icy'


# zsh setup
autoload -Uz compinit colors add-zsh-hook history-search-end
colors
compinit
zstyle ':completion:*' list-colors "di=34"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
export ZLE_REMOVE_SUFFIX_CHARS=''
setopt extended_glob
setopt autocd

# partial history matching
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
#bindkey "^[[A" history-beginning-search-backward-end
#bindkey "^[[B" history-beginning-search-forward-end

# command history
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# prompt

# end and home keys
#bindkey "^[[1~" beginning-of-line
#bindkey "^[[4~" end-of-line

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# base16-shell 
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# fpath
fpath=($HOME/.zsh/zsh-completions/src $fpath)

# sourced scripts
source $HOME/.aliases
source $HOME/.oh-my-zsh/antigen.zsh
#source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source $ZSH/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# plugins with oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle common-aliases
# antigen bundle autojump
# antigen bundle z
antigen bundle fasd

# external plugins
#antigen bundle unixorn/git-extra-commands
antigen bundle psprint/zsh-navigation-tools
antigen bundle desyncr/auto-ls
#antigen bundle MichaelAquilina/zsh-you-should-use
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting # must be last plugin to get effect

# theme
#antigen theme blinks

# apply config
antigen apply
plugins=(git)

source $ZSH/oh-my-zsh.sh
killall Dock

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
