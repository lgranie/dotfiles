# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# load .profile (env)
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

# base16
if [ -f ~/.config/local/base16.sh ]; then
  source ~/.config/local/base16.sh
fi

# Enable colors and change prompt:
autoload -Uz colors && colors
eval "$(dircolors -b)"

# Keep 1000 lines of history within the shell 
setopt histignorealldups sharehistory
HISTSIZE=1000
SAVEHIST=1000

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zmodload zsh/complist
compinit
_comp_options+=(globdots)   # Include hidden files.

# Use vi keybindings even if our EDITOR is set to vi
bindkey -v
export KEYTIMEOUT=1

# Edit line in vim buffer ctrl-v
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line
# Enter vim buffer from normal mode
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line

# Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#       [[ ${KEYMAP} == viins ]] ||
#       [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select

# zle-line-init() {
#   zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -v` has been set elsewhere)
#   echo -ne '\e[5 q'
# }
# zle -N zle-line-init

# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# precmd() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char

fpath=($fpath "/home/lgranie/.zfunctions")

# Set up the prompt
# Set Spaceship ZSH as a prompt
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_VI_MODE_SHOW=false
autoload -Uz promptinit
promptinit
prompt spaceship
spaceship_vi_mode_enable

# use fzf bindings
if [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi 

# Load zsh-syntax-highlighting; should be last.
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
fi

if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# fix LS_COLORS
LS_COLORS=${LS_COLORS}'ow=1;34:tw=1;34:'
