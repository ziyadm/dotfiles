# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

alias ll='ls --color=auto'
alias claer='clear'
alias b='git branch'
alias co='git checkout'
alias kansas='make load_test_data stop_kansas_city start_kansas_city'
alias web='./bin/web-build --watch'
alias auto='make autoload_objectstore_classes'
alias dev='node-dev gotham'
alias pull='git pull origin master'
alias node='./bin/node'
alias edmund='./bin/edmund-local'
alias jslint='make jslint'
alias ag='ag --ignore ~/.ignore'
