#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '

PERL_PATH="/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
GOBIN_PATH="$(go env GOPATH)/bin"

export PATH="$GOBIN_PATH:$PERL_PATH:/opt/llvm/bin:$PATH"
export FLAVOUR="frappe"

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
