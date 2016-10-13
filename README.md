# zog-bash

Paul B. Hartzog's bash stuff w/ various handy bits in it. :-)

Shared under the MIT License.

## Meta

Author: Paul B. Hartzog  
Year: 2016  
WWW: [http://paulbhartzog.org](http://paulbhartzog.org)  
Github:  [http://github.com/paulbhartzog](http://github.com/paulbhartzog)


## Manifest

  * .bash_logout
  * .bash_profile
  * .bashrc
  * LICENSE
  * README.md

---
# Paul B. Hartzog - Shell Setup (Bash)

**All of the code examples below are explanatory and not exactly what is in the scripts themselves.  I have removed some comments and "echo" statements for clarity.**


---

## .bash_logout

Simply contains an example "Goodbye" statement that is executed when exiting a shell instance.

---
## .bash_profile

This .bash_profile produces the following bash prompt:

**user@host ~/current/working/directory  git (branch)  ruby version (source) $**


### BASH

Source .bashrc if it exists

```sh
# source .bashrc if it exists
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
```

### NVM

From https://github.com/creationix/nvm

```sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
```

### RBENV

#### PATH

Add rbenv to PATH.

From https://github.com/rbenv/rbenv

```sh
export PATH="$HOME/.rbenv/bin:$PATH"
```

#### Shell Hooks

Load rbenv shell hooks.  Benefits listed at https://github.com/rbenv/rbenv#how-rbenv-hooks-into-your-shell.

See

  * https://github.com/rbenv/rbenv/issues/815
  * https://github.com/rbenv/rbenv/issues/815#issuecomment-252632999


```sh
eval "$(rbenv init -)"
```

### BASH PROMPT

#### Colors

Setup some colors to use.  (You can google to find all the color codes and how to use them in a bash script).

```sh
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
```

#### Account@machine

```sh
# \u : the username of the current user
# \h : the hostname up to the first ‘.’
user_at_host="$GREEN_BOLD\u@\h"
```

#### Working dir

```sh
# \w : the working directory, with $HOME abbreviated with a tilde
working_dir="$YELLOW_BOLD\w"
```

#### Git branch

```sh
get_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# slash \ before func call is necessary to refresh prompt on branch change
git_branch="$CYAN_BOLD git\$(get_git_branch)"
```

#### Ruby environment

The Ruby environment part of the prompt is actually based on two things: 1) rbenv version, and 2) whether or not that setting is coming from global or local.

First, I have a function to determine the version in use, and second, I have a function to determine whether the source of that ruby setting is global or local. If .ruby-version exists in the current working directory then rbenv will use that as a local ruby setting, otherwise rbenv defaults to global.



```sh
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
```

#### Prompt Character (using $)

```sh
prompt="$LIGHT_PURPLE_BOLD\$"
```

#### Prompt Context

Output the appropriate prompt depending on context.

```sh
if [ -f $(brew --prefix)/etc/bash_completion ] && [ -f `which rbenv` ]; then
  export PS1="$user_at_host $working_dir $git_branch $ruby_env $prompt $COLOR_RESET "
elif [ -f $(brew --prefix)/etc/bash_completion ]; then
  export PS1="$user_at_host $working_dir $git_branch $prompt $COLOR_RESET "
elif [ `which rbenv` ]; then
  export PS1="$user_at_host $working_dir $ruby_env $prompt $COLOR_RESET "
else
  export PS1="$user_at_host $working_dir $prompt $COLOR_RESET "
fi
```

---

## .bashrc

Personal aliases (etc.) are in .bashrc

```sh
# alias res(et) to clear terminal and reload ~/.bash_profile
# ~/.bash_profile sources .bashrc automagically
alias res="clear; source $HOME/.bash_profile"

# alias ls to show colors (on mac ls is BSD version of ls, so -G)
alias ls="ls -G"

# alias rm for safety
alias rm="rm -i"
```

---
end
