# Paul B. Hartzog bash stuff
# begin .bashrc

# alias res(et) to clear terminal and reload ~/.bash_profile
# ~/.bash_profile sources .bashrc automagically
alias res="clear; source $HOME/.bash_profile"

# alias ls to show colors (on mac ls is BSD version of ls, so -G)
alias ls="ls -G"

# alias rm for safety
alias rm="rm -i"
