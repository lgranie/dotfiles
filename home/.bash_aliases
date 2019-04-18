alias xrdb='xrdb -I$HOME'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ll='ls -l --color=auto'
  alias la='ls -A --color=auto'
  alias lla='ls -Al --color=auto'
  alias l='ls -CF --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

alias rm='rm -i'
alias mv='mv -i'
alias le='less'
alias du='du -h -d 1'

function d2u () {
  sed -i 's/\r//' $1
}

# git
# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout develop'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'

alias gusmom='git submodule foreach git pull origin master'

# ----------------------
# Git Functions
# ----------------------
# Git log find by commit message
function glf() { git log --all --grep="$1"; }

function mcist () {
  mvn -T 4 clean install -DskipTests
}

function mci () {
  mvn -T 4 clean install
}

function msbd () {
  mvn spring-boot:run -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005"
}

function start_dev () {
  cd $1 && \
  tmux send-keys 'vim' C-m \; \
  split-window -v -p 16 \; \
  select-pane -t 1 \;
}

function udist () {
  sudo apt-get update;
  sudo apt-get -u dist-upgrade;
  sudo apt-get -u upgrade;
  sudo apt-get --purge autoremove;
  sudo apt-get clean;
  deborphan;
}

if [ -f ~/.config/local/bash_aliases ]; then
. ~/.config/local/bash_aliases
fi

