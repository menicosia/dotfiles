echo "sourcing common aliases"
# Link this file to ~/.bash_it/custom/common.aliases.bash
alias 0='cat >/dev/null'
alias dc='cd'
alias cdc='cd ; clear'
# alias chtitle='echo -n "]0;\!:2-$" >> \!:1'
alias ls='ls -FCAs --color=never'

add() {
  perl -ne 'BEGIN {$f=0}; END {print "$f\n"} if (/^$/) {exit 0} $f += $_'
}

## https://www.iterm2.com/documentation-badges.html
itermbadge() {
  printf "\e]1337;SetBadgeFormat=%s\a" $(echo -n "$1" | base64)
}
