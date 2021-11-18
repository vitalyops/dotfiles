# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/vites/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/vites/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/vites/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh


export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
