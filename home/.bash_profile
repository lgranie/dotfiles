if [ -f ~/.bashrc ]
then
    . ~/.bashrc
fi

if [ -f ~/.bash_aliases ]
then
    . ~/.bash_aliases
fi

. ~/.local_bashrc
. ~/.local_bash_aliases

