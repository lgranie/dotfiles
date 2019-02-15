alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias lla='ls -Al --color=auto'
alias l='ls -CF --color=auto'

alias rm='rm -i'
alias mv='mv -i'
alias le='less'

function mcist () {
  mvn -T 4 clean install -DskipTests
}

function mci () {
  mvn -T 4 clean install
}

