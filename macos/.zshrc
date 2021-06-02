#               __             
#   ____  _____/ /_  __________
#  /_  / / ___/ __ \/ ___/ ___/
# _ / /_(__  ) / / / /  / /__  
#(_)___/____/_/ /_/_/   \___/  
#

# export thingys
export ZSH="/Users/$USER/.oh-my-zsh"
export BROWSER=/Applications/Firefox.app/Contents/MacOS/firefox-bin
export EDITOR=/usr/bin/vim
export SSH_KEY_PATH="~/.ssh/id_rsa"
export PATH=$PATH:$HOME/bin
export GPG_TTY=$(tty)
export PATH=$PATH:$HOME/.local/bin
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore --files'
export AWS_SESSION_TTL=12h
export AWS_ASSUME_ROLE_TTL=12h
export CLOUDSDK_PYTHON=python2
export RIPGREP_CONFIG_PATH="/Users/$USER/.ripgreprc"
export AUTO_LS_COMMANDS=(ls)

# zsh theme 
ZSH_THEME='robbyrussell'


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

# Keybinds for macOS after karbiner treatment

#enalbe vim mode


# Skip forward/back a word with ctrl-arrow
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word

# Skip to start/end of line with cmd-arrow
bindkey '[E' beginning-of-line
bindkey '[F' end-of-line

# Delete word with opt-backspace/opt-delete
#bindkey '^n' backward-kill-word
#bindkey '^?' backward-kill-word
bindkey '^U' redo
#bindkey '[H' kill-word
#bindkey "^?" backward-delete-char
#bindkey "^[[3~" delete-char
# Delete line with cmd-backspace
bindkey '[I' kill-whole-line

bindkey '^H'      backward-kill-word 

# end and home keys
#bindkey "^[[1~" beginning-of-line
#bindkey "^[[4~" end-of-line

#bindkey "^[[5~" history-beginning-search-backward-end
#bindkey "^[[6~" history-beginning-search-forward-end

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

# base16-shell 
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# fpath
fpath=($HOME/.zsh/zsh-completions/src $fpath)

# sourced scripts
source $HOME/.oh-my-zsh/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# plugins with oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle autojump
antigen bundle z
#antigen bundle fasd

# external plugins
antigen bundle unixorn/git-extra-commands
antigen bundle psprint/zsh-navigation-tools
#antigen bundle desyncr/auto-ls
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
source $HOME/.config/scripts/z.sh
source $HOME/.aliases
killall Dock
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/$USER/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/$USER/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/$USER/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/$USER/Downloads/google-cloud-sdk/completion.zsh.inc'; fi


#autojump

	[[ -s /Users/$USER/.autojump/etc/profile.d/autojump.sh ]] && source /Users/$USER/.autojump/etc/profile.d/autojump.sh

	autoload -U compinit && compinit -u

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
