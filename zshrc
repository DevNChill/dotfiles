# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -z "$NO_FASTFETCH" ]]; then
    fastfetch
fi
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="robbyrussell"

plugins=( 
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-interactive-cd
)
source $ZSH/oh-my-zsh.sh

# Display Pokemon-colorscripts
# pokemon-colorscripts --no-title -s -r

# Adding My Custom Aliases
if [ -f ~/.myalias ]; then
  source ~/.myalias
fi

# Created by `pipx` on 2024-05-16 08:29:05
export PATH="$PATH:/home/mid3ee/.local/bin"
#for npm
export PATH="$PATH:/home/mid3ee/.npm-global/bin"
#My Custom Bin
export PATH="$HOME/bin:$PATH"
# Ensure vi mode is enabled
bindkey -v

# Define a function to switch from insert mode to normal mode
function vi-cmd-mode-custom() {
    zle vi-cmd-mode
}

# Create a custom widget for the function
zle -N vi-cmd-mode-custom vi-cmd-mode-custom

# Bind 'jk' to the custom widget in vi insert mode
bindkey -M viins 'jk' vi-cmd-mode-custom

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

export PATH=$PATH:/home/mid3ee/.spicetify
