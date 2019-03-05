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

function mcist () {
  mvn -T 4 clean install -DskipTests
}

function mci () {
  mvn -T 4 clean install
}

if [ -f ~/.local_bash_aliases ]; then
. ~/.local_bash_aliases
fi

function start_dev() {
  cd $1 && \
  tmux attach || tmux new-session \; \
  send-keys 'vim' C-m \; \
  split-window -v -p 20 \; \
  send-keys 'cd /home/lgranie/opt/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/' C-m \; \
  send-keys 'java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1045 -Declipse.application=org.eclipse.jdt.ls.core.id1 -Dosgi.bundles.defaultStartLevel=4 -Declipse.product=org.eclipse.jdt.ls.core.product -Dlog.level=ALL -noverify -Xmx1G -jar ./plugins/org.eclipse.equinox.launcher_1.5.300.v20190213-1655.jar -configuration ./config_linux -data ' $1 C-m \; \
  split-window -h \;
}

