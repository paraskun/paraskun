# .bash_profile

# Get the aliases and functions

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

alias message="curl https://whatthecommit.com/index.txt"

# User specific environment and startup programs

export PATH=$HOME/go/bin:$PATH
