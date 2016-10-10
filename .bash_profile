# Paul B. Hartzog bash stuff
# begin .bash_profile

# ---------------------------------------------------------------------------
# .bash_profile
# ---------------------------------------------------------------------------
echo "- source $HOME/.bash_profile"

# ---------------------------------------------------------------------------
# .bashrc
# ---------------------------------------------------------------------------
echo "- source .bashrc if it exists"
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# ---------------------------------------------------------------------------
# NVM
# ---------------------------------------------------------------------------
echo "- load nvm"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# ---------------------------------------------------------------------------
# RBENV
# ---------------------------------------------------------------------------
echo "- set rbenv PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
echo "- load rbenv shell hooks"
eval "$(rbenv init -)"

# ---------------------------------------------------------------------------
# bash completion for git
# ---------------------------------------------------------------------------
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
source ~/.git-completion.bash

# ---------------------------------------------------------------------------
# create useful bash prompt
# account@machine working-dir git-branch ruby-env prompt
# ---------------------------------------------------------------------------
echo "- create useful bash prompt:"
echo "  - account@machine working-dir git-branch ruby-env prompt"

# ---------------------------------------------------------------------------
# colors
# ---------------------------------------------------------------------------
# 0; is regular
# 1; is bold
DARK_RED="\[\033[0;31m\]"
DARK_RED_BOLD="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
GREEN_BOLD="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
YELLOW_BOLD="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
BLUE_BOLD="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
PURPLE_BOLD="\[\033[1;35m\]"
CYAN="\[\033[0;36m\]"
CYAN_BOLD="\[\033[1;36m\]"
WHITE="\[\033[0;37m\]"
WHITE_BOLD="\[\033[1;37m\]"
BLACK="\[\033[0;30m\]"
BLACK_BOLD="\[\033[1;30m\]"
LIGHT_RED="\[\033[0;91m\]"
LIGHT_RED_BOLD="\[\033[1;91m\]"
LIGHT_BLUE="\[\033[0;94m\]"
LIGHT_BLUE_BOLD="\[\033[1;94m\]"
LIGHT_PURPLE="\[\033[0;95m\]"
LIGHT_PURPLE_BOLD="\[\033[1;95m\]"
COLOR_RESET="\[\033[00m\]"

# ---------------------------------------------------------------------------
# account@machine ( \u@\h )
# ---------------------------------------------------------------------------
# \u : the username of the current user
# \h : the hostname up to the first ‘.’
user_at_host="$WHITE_BOLD\u@\h"

# ---------------------------------------------------------------------------
# working-dir ( \w )
# ---------------------------------------------------------------------------
# \w : the working directory, with $HOME abbreviated with a tilde
working_dir="$GREEN_BOLD\w"

# ---------------------------------------------------------------------------
# git-branch
# ---------------------------------------------------------------------------
get_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
git_branch="$CYAN_BOLD git$(get_git_branch)"

# ---------------------------------------------------------------------------
# ruby-env
# ---------------------------------------------------------------------------
get_ruby_env () {
  rbenv version | sed -e 's/ .*//'
}
ruby_env="$DARK_RED_BOLD ruby $(get_ruby_env)"

# ---------------------------------------------------------------------------
# prompt ($)
# ---------------------------------------------------------------------------
prompt="$LIGHT_PURPLE_BOLD\$$COLOR_RESET "

# ---------------------------------------------------------------------------
# assing prompt based on available vars
# ---------------------------------------------------------------------------
if [ -f $(brew --prefix)/etc/bash_completion ] && [ -f `which rbenv` ]; then
  export PS1="$user_at_host $working_dir $git_branch $ruby_env $prompt"
elif [ -f $(brew --prefix)/etc/bash_completion ]; then
  export PS1="$user_at_host $working_dir $git_branch $prompt"
elif [ `which rbenv` ]; then
  export PS1="$user_at_host $working_dir $ruby_env $prompt"
else
  export PS1="$user_at_host $working_dir $prompt"
fi


# end .bash_profile
