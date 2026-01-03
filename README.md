# dotfiles

Please don't think about using my dotfiles.

Please don't commit any secrets to my dotfiles.

## bash-it

1. install [bash-it](https://github.com/Bash-it/bash-it)
1. Link necessary files
```mkdir ~/.bash_it/custom/
   ln -s common.aliases.bash ~/.bash_it/custom/
```
1. Look for a environment-specific directory (intel, amd, etc) and link all those files to ~/.bash_it/custom/
1. Optional, non-bash-related dotfiles
```
   ln -s emacs ~/.emacs
   mkdir -p ~/.config/git
   ln -s git-config ~/.config/git/config
   ln -s git-ignore ~/.config/git/ignore
```
