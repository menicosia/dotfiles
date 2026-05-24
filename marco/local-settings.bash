#
echo "sourcing local settings..."

if [ -d "/opt/homebrew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  [ -d "/opt/homebrew/opt/mysql-client" ] && PATH+=":/opt/homebrew/opt/mysql-client/bin"
fi
