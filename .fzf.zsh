# Setup fzf
# ---------
if [[ ! "$PATH" == */home/yuze/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/yuze/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/yuze/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/yuze/.fzf/shell/key-bindings.zsh"
