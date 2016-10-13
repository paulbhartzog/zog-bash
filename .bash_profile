# begin .bash_profile

# ================================================================ #
# [Author]      Paul B. Hartzog <PaulBHartzog@PaulBHartzog.org>
# [Year]        2016
# [File]        .bash_profile
# [Usage]       $HOME/.bash_profile for bash-3.0 (or later)
# [Source]      https://github.com/paulbhartzog/zog-bash
# [Created]     Tue Oct 11 EDT 2016
# [Modified]    Thu Oct 13 EDT 2016
# [Version]     1.0.0
# [License]     MIT License https://opensource.org/licenses/MIT
#
# Feel free to modify this to suit your needs.
#
# ================================================================ #

# ---------------------------------------------------------------------------
# .bash_profile
# ---------------------------------------------------------------------------
echo "- .bash_profile"
echo "  - source $HOME/.bash_profile"

# ---------------------------------------------------------------------------
# .bashrc
# ---------------------------------------------------------------------------
echo "- .bashrc"
if [ -f $HOME//.bashrc ]; then
  echo "  - $HOME/.bashrc exists"
  echo "  - source $HOME/.bashrc"
  source $HOME/.bashrc
else
  echo "  - no $HOME/.bashrc exists, cannot source .bashrc"
fi

# ---------------------------------------------------------------------------
# NVM
# ---------------------------------------------------------------------------
echo "- nvm"
echo "   load nvm"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# ---------------------------------------------------------------------------
# RBENV
# ---------------------------------------------------------------------------
echo "- rbenv"
echo "  - add rbenv to PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
echo "  - load rbenv shell hooks"
eval "$(rbenv init -)"
if [ -f ./.ruby-version ]; then
  echo "  - ./.ruby-version exists in $PWD"
  echo "  - RBENV_SOURCE is local"
else
  echo "  - NO ./.ruby-version exists in $PWD"
  echo "  - RBENV_SOURCE is global"
fi

# ---------------------------------------------------------------------------
# bash completion for git
# ---------------------------------------------------------------------------
echo "- bash completion"
echo "  - setup bash completion"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
echo "  - source $HOME/.git-completion.bash"
source $HOME/.git-completion.bash

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
# create useful bash prompt
# account@machine working-dir git-branch ruby-env prompt
# ---------------------------------------------------------------------------
echo "- create useful bash prompt:"
echo "  - account@machine working-dir git-branch ruby-env prompt"

# ---------------------------------------------------------------------------
# account@machine ( \u@\h )
# ---------------------------------------------------------------------------
# \u : the username of the current user
# \h : the hostname up to the first ‘.’
user_at_host="$GREEN_BOLD\u@\h"

# ---------------------------------------------------------------------------
# working-dir ( \w )
# ---------------------------------------------------------------------------
# \w : the working directory, with $HOME abbreviated with a tilde
working_dir="$YELLOW_BOLD\w"

# ---------------------------------------------------------------------------
# git-branch
# ---------------------------------------------------------------------------
get_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# slash \ before func call is necessary to refresh prompt on branch change
git_branch="$CYAN_BOLD git\$(get_git_branch)"

# ---------------------------------------------------------------------------
# ruby-env
# ---------------------------------------------------------------------------
get_ruby_env() {
  rbenv version | sed -e 's/ .*//'
}
get_rbenv_source(){
  RBENV_SOURCE=""
  if [ -f ./.ruby-version ]; then
    RBENV_SOURCE="local"
  else
    RBENV_SOURCE="global"
  fi
  echo $RBENV_SOURCE
}
# slash \ before func call is necessary to refresh prompt on dir change
ruby_env="$DARK_RED_BOLD ruby \$(get_ruby_env) (\$(get_rbenv_source))"

# ---------------------------------------------------------------------------
# prompt ($)
# ---------------------------------------------------------------------------
prompt="$LIGHT_PURPLE_BOLD\$"

# ---------------------------------------------------------------------------
# assing prompt based on available vars
# ---------------------------------------------------------------------------
if [ -f $(brew --prefix)/etc/bash_completion ] && [ -f `which rbenv` ]; then
  export PS1="$user_at_host  $working_dir $git_branch $ruby_env $prompt $COLOR_RESET"
elif [ -f $(brew --prefix)/etc/bash_completion ]; then
  export PS1="$user_at_host  $working_dir $git_branch $prompt $COLOR_RESET"
elif [ `which rbenv` ]; then
  export PS1="$user_at_host  $working_dir $ruby_env $prompt $COLOR_RESET"
else
  export PS1="$user_at_host  $working_dir $prompt $COLOR_RESET"
fi


# end .bash_profile
