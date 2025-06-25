# Modify the PROMPT_COMMAND to activate/deactivate python venv when present.
#
# Using PROMPT_COMMAND to avoid colliding with bash_it's theme setting of PS1
#
# BUG: if bash-it's SCM_CHECK=true,this will burp a git error when
# exiting a venv-enable directory
#
echo "automatically enable python venv projects"

export _PREV_PWD="$PWD"

venv_toggle() {
  if [[ "$PWD" != "$_PREV_PWD" ]]; then
    shopt -s dotglob # necessary to detect .venv dirs
    if [ -r $_PREV_PWD/*venv/bin/activate ]; then deactivate; fi
    if [ -r ./*venv/bin/activate ]; then source ./*venv/bin/activate; fi
    shopt -u dotglob

    export _PREV_PWD="$PWD"
  fi
}

if [[ "XX" -eq "$PROMPT_COMMAND"XX ]]; then
  PROMPT_COMMAND="$PROMPT_COMMAND; venv_toggle"
else
  PROMPT_COMMAND="venv_toggle"
fi

