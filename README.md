# zog-bash-prompt

Paul B. Hartzog's bash prompt w/ various handy bits in it. :-)

# Shell Setup (Bash)


## Meta

Author: Paul B. Hartzog  
Year: 2016  
WWW: [http://paulbhartzog.org](http://paulbhartzog.org)  
Github:  [http://github.com/paulbhartzog](http://github.com/paulbhartzog)

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

Load rbenv options/features always.  Benefits listed at https://github.com/rbenv/rbenv#how-rbenv-hooks-into-your-shell.

See

  * https://github.com/rbenv/rbenv/issues/815
  * https://github.com/rbenv/rbenv/issues/815#issuecomment-252632999


```sh
eval "$(rbenv init -)"
```

### Complete

The complete code block

```sh
# ruby env init (rbenv)
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
```
