# Paul B. Hartzog .bash_profile

# nvm loader
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# ruby env init (rbenv)
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# source .bashrc if it exists
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
