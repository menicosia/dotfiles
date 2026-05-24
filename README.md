# dotfiles

Please don't think about using my dotfiles.

Please don't commit any secrets to my dotfiles.

## Where to install dotfiles
```sh
   ln -s emacs ~/.emacs
   ln -s <env>/ssh-config ~/.ssh/config
   mkdir -p ~/.config/git
   ln -s git-config ~/.config/git/config
   ln -s git-ignore ~/.config/git/ignore
```

### Setting up a fresh computer
These instructions assume using bash-it, see below.
1. install [bash-it](https://github.com/Bash-it/bash-it)
   ```sh
      cd ~/src ; git clone --depth=1 git@github.com:Bash-it/bash-it.git
      cd ~ ; ln -s src/bash_it ./.bash_it
      ./bash_it/install.sh --no-modify-config
   ```
1. Link necessary files
   ```sh
      ln -s ~/dotfiles/<environment>/bashrc ~/.bashrc
      ln -s ~/dotfiles/bash_profile ~/.bash_profile
   ```

## bash-it

### bash_profile and bashrc

I like to keep these files as vanilla as possible. I think this works for three reasons: 1. bash-it changes the template bashrc once in a while, and this makes it easy to merge those changes. 2. I have lots of different work and personal environments (WSL, Linux, OSX) to maintain; this way I can keep separate configs  in source control separately (see below), and 3. Many apps want to automatically munge bashrc (brew, for example, but many others), and this allows me to see those changes easily and digest them into the appropriate places.

I like to keep my bash_profile barebones. It's only used by login shells. There's almost nothing I need to run only once. Unless maybe running an ssh daemon, or an emacs server, I don't modify it beyond this boilerplate:
```sh
   #
   echo "sourcing .bash_profile"
   if [[ $- == *i* && -s ~/.bashrc ]]; then
         source ~/.bashrc
   fi
```

Note: As a reminder, `$-` is the shell's arguments, and `i` is the flag for "interactive."

I like to keep my bashrc as similar to the generated bashrc created by `bash_it` as possible. The template may update occasionally. Track it at `~/.bash_it/template/bashrc.template.bash` Also for reference, the ubuntu default .bashrc is located at `/etc/skel/.bashrc`.

### Make custom environments

Since I like to keep above files generic, I use bash-it's [Custom Content](https://bash-it.readthedocs.io/en/latest/custom/) feature to separate out config for each environment.

Each directory in this repo represents a different environment. I copy the template bashrc into this directory and set `BASH_IT_CUSTOM` to this directory. This is less work per system than linking each of the files to `~/.bash_it/custom/`

I have a few files in the repo which are truly common. I've experimented with a bunch of ways, but since moving to `BASH_IT_CUSTOM` I have to symlink these common files into each env.

```sh
   cd ~/dotfiles/env
   ln -s ../custom-bobby-py.theme.bash .
   ln -s ../common.aliases.bash .
```
Anything else which is truly specific to this environment also goes into a `*.bash` folder.  Note, bash-it loads files in order, so `*.aliases.bash`, `*.completion.bash`, `*.plugin.bash` and any other `*.bash` files, in alphabetical order.
