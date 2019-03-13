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

function mcist () {
  mvn -T 4 clean install -DskipTests
}

function mci () {
  mvn -T 4 clean install
}

function msbd () {
  mvn spring-boot:run -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005"
}

if [ -f ~/.local_bash_aliases ]; then
. ~/.local_bash_aliases
fi

function start_dev () {
  cd $1 && \
  tmux attach || tmux new-session \; \
  send-keys 'vim' C-m \; \
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

