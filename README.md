# dotfiles

Please don't think about using my dotfiles.

Please don't commit any secrets to my dotfiles.

## bash-it

1. install [bash-it](https://github.com/Bash-it/bash-it)
   ```sh
      cd ~/src ; git clone --depth=1 git@github.com:Bash-it/bash-it.git
      cd ~ ; ln -s src/bash_it ./.bash_it
   ```
1. Link necessary files
   ```sh
      mkdir ~/.bash_it/custom/
      ln -s common.aliases.bash ~/.bash_it/custom/
   ```

### A note about the bashrc
   I like to keep my bashrc as similar to the generated bashrc created by `bash_it` as possible. The template may update occasionally. Track it at `~/.bash_it/template/bashrc.template.bash` Also for reference, the ubuntu default .bashrc is located at `/etc/skel/.bashrc`.

### Make everything custom

1. Look for a environment-specific directory (intel, amd, etc) and link all those files to ~/.bash_it/custom/
1. Optional, non-bash-related dotfiles
   ```sh
      ln -s emacs ~/.emacs
      mkdir -p ~/.config/git
      ln -s git-config ~/.config/git/config
      ln -s git-ignore ~/.config/git/ignore
   ```
