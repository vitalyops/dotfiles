# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/vitaly/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/vitaly/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/vitaly/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/vitaly/.fzf/shell/key-bindings.zsh"
