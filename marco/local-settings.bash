#
echo "sourcing local settings..."

[ -d "/opt/homebrew" ] && eval `/opt/homebrew/bin/brew shellenv ${SHELL##*/}`
[ -d "/opt/homebrew/opt/mysql-client" ] && PATH+=":/opt/homebrew/opt/mysql-client/bin"
[ -d "/opt/homebrew/opt/python/libexec/bin" ] && PATH+=":/opt/homebrew/opt/python/libexec/bin"

[[ ":$PATH:" != *":$HOME/.local/bin"* ]] && PATH+=":$HOME/.local/bin"
[ -d /usr/local/sbin ] && PATH+=":/usr/local/sbin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.bash.inc' ]; then source '$HOME/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '$HOME/google-cloud-sdk/completion.bash.inc' ]; then source '$HOME/google-cloud-sdk/completion.bash.inc'; fi

[ -d /usr/local/opt/chruby ] && source /usr/local/opt/chruby/share/chruby/chruby.sh

export PATH ;
