#
# These environment variables are nearly universal
#
echo "sourcing common environment setup..."

## Common PATH modifications

[[ ":$PATH:" != *":$HOME/bin:"* ]] && PATH+=":$HOME/bin"

# Claude, Atlassian CLI, etc installs in .local/bin
[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && PATH+=":$HOME/.local/bin"
export PATH

export NVM_DIR="$HOME/.nvm"
if [ -d "$NVM_DIR" ]; then
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"   # This loads nvm bash_completion
fi

export PERL5_DIR="$HOME/perl5"
if [ -x "$PERL5_DIR" ]; then
  PATH="$PERL5_DIR/bin${PATH:+:${PATH}}"; export PATH;
  PERL5LIB="$PERL5_DIR/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
  PERL_LOCAL_LIB_ROOT="$PERL5_DIR${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
  PERL_MB_OPT="--install_base \"$PERL5_DIR\""; export PERL_MB_OPT;
  PERL_MM_OPT="INSTALL_BASE=$PERL5_DIR"; export PERL_MM_OPT;
fi
