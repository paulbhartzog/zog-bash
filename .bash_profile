# Paul B. Hartzog bash stuff
# begin .bash_profile

echo "source $HOME/.bash_profile"

# nvm loader
echo "load nvm"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# ruby env init (rbenv)
echo "set rbenv PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
echo "load rbenv shell hooks"
eval "$(rbenv init -)"

# source .bashrc if it exists
echo "# source .bashrc if it exists"
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
