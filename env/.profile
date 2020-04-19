# The XDG_ variables definitions:
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html#variables

## User directories
[[ -z ${XDG_CONFIG_HOME:-} ]] && export XDG_CONFIG_HOME="$HOME/.config"
[[ -z ${XDG_CACHE_HOME:-} ]] && export XDG_CACHE_HOME="$HOME/.cache"
[[ -z ${XDG_DATA_HOME:-} ]] && export XDG_DATA_HOME="$HOME/.local/share"

export PATH="$HOME/.local/bin:$PATH"

# fzf default options
export FZF_DEFAULT_OPTS="--layout=reverse --border"

# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_PACKAGES="${XDG_CONFIG_HOME}/npm/global"
export PATH="$NPM_PACKAGES/bin:$PATH"

# history
export HISTFILE=${XDG_DATA_HOME}/history

# aliases
[ -f ${XDG_CONFIG_HOME}/aliases/aliases ] && . ${XDG_CONFIG_HOME}/aliases/aliases
 
# local envrc
[ -f ${XDG_CONFIG_HOME}/local/profile ] && . ${XDG_CONFIG_HOME}/local/profile
