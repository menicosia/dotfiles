#
echo "sourcing local settings..."

if [ -d "/opt/homebrew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  [ -d "/opt/homebrew/opt/mysql-client" ] && PATH+=":/opt/homebrew/opt/mysql-client/bin"
fi

PATH+=":$HOME/bin"
PATH+=":$HOME/.local/bin"
export PATH

export NVM_DIR="$HOME/.nvm"
if [ -d "$NVM_DIR" ]; then
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"   # This loads nvm bash_completion
fi


