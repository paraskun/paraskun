#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '

export PATH=$HOME/go/bin:/opt/llvm/bin:/opt/paraview/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$PATH
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
