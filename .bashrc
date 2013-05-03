alias ls='ls -aFG'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Put together a nice looking prompt
function bash_git_branch
{
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\(\1\)/'
}
# If id command returns zero, you.ve root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
    export PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w #\\[$(tput sgr0)\\] "
else # normal
    export PS1="\e[0;32m\\u@\\h: \e[0;33m\\w\e \e[0;36m\$(bash_git_branch)\n\[\e[0;37m\]$ "
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting