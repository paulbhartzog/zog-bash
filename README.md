# zog-bash

Paul B. Hartzog's bash stuff w/ various handy bits in it. :-)

# Shell Setup (Bash)


## Meta

Author: Paul B. Hartzog  
Year: 2016  
WWW: [http://paulbhartzog.org](http://paulbhartzog.org)  
Github:  [http://github.com/paulbhartzog](http://github.com/paulbhartzog)


## BASH

Source .bashrc if it exists

```sh
# source .bashrc if it exists
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
```

## NVM

From https://github.com/creationix/nvm

```sh
# nvm loader
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
```

## RBENV

### PATH

Add rbenv to PATH.

From https://github.com/rbenv/rbenv

```sh
export PATH="$HOME/.rbenv/bin:$PATH"
```

### Shell Hooks

Load rbenv shell hooks.  Benefits listed at https://github.com/rbenv/rbenv#how-rbenv-hooks-into-your-shell.

See

  * https://github.com/rbenv/rbenv/issues/815
  * https://github.com/rbenv/rbenv/issues/815#issuecomment-252632999


```sh
eval "$(rbenv init -)"
```

## BASH PROMPT

### Colors

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

### Account@machine

```sh
# \u : the username of the current user
# \h : the hostname up to the first ‘.’
user_at_host="$WHITE_BOLD\u@\h"
```

### Working dir

```sh
# \w : the working directory, with $HOME abbreviated with a tilde
working_dir="$GREEN_BOLD\w"
```

### Git branch

```sh
get_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
git_branch="$CYAN_BOLD git$(get_git_branch)"
```

### Ruby env (from rbenv)

```sh
get_ruby_env () {
  rbenv version | sed -e 's/ .*//'
}
ruby_env="$DARK_RED_BOLD ruby $(get_ruby_env)"
```

### Prompt (prompt character, using $)

```sh
prompt="$LIGHT_PURPLE_BOLD\$$COLOR_RESET "
```

### Prompt

Output the correct prompt depending on what vars are available.

```sh
if [ -f $(brew --prefix)/etc/bash_completion ] && [ -f `which rbenv` ]; then
  export PS1="$user_at_host $working_dir $git_branch $ruby_env $prompt"
elif [ -f $(brew --prefix)/etc/bash_completion ]; then
  export PS1="$user_at_host $working_dir $git_branch $prompt"
elif [ `which rbenv` ]; then
  export PS1="$user_at_host $working_dir $ruby_env $prompt"
else
  export PS1="$user_at_host $working_dir $prompt"
fi
```

