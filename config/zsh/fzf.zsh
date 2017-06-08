# Setup fzf
# ---------
if [[ ! "$PATH" == */home/anthony/.fzf/bin* ]]; then
  export PATH="$PATH:/home/anthony/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/anthony/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/anthony/.fzf/shell/key-bindings.zsh"

