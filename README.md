# dotfiles

In this repository I configure all the parameters to use the terminal and particularly
Neovim as a powerfull tool.

This is not an original work. I use
Oscar Arbelaez [dotfiles](https://github.com/odarbelaeze/dotfiles) as a guide.
Furthermore, I know Oscar's work is based on the
Jess Archer's [talk](https://www.youtube.com/watch?v=434tljD-5C8&ab_channel=JessArcher)
in Vimconf 2021. In fact I almost change nothing from Oscar's repository. The key porpouse
of this repository is to give a step-by-step guide to install all the required programs
and packages, and to make the new configuration works perfectly when activated.

## Installation of packages

These is what you need to install in Ubuntu to activate the Terminal and Neovim
superpowers. Probably the order is not that important, the important thing is that
all the necessary packages to be installed.

### Zsh and my-oh-zsh

The Z shell (zsh) is an Unix shell that can be used as an interactive login shell and as a
command interpreter for shell scripting. Zsh is an extended Bourne shell with many
improvements, including some features of Bash, ksh, and tcsh.

In a terminal install zsh with

```bash
$ sudo apt-get install zsh
```

Oh My Zsh is a delightful, open source, community-driven framework for managing your Zsh
configuration. It comes bundled with thousands of helpful functions, helpers, plugins,
themes.

To install oh-my-zsh via curl use

```bash
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Neovim

Neovim is a project that seeks to aggressively refactor Vim source code in order to
simplify maintenance to improve the speed that bug fixes and features get merged, split
the work among multiple developers, enable the implementation of new/modern user
interfaces without any modifications to the core source and improve the extensibility
power with a new plugin architecture based on coprocesses.

To install the last version of Neovim use

```bash
$ sudo apt-get update
$ sudo add-apt-repository ppa:neovim-ppa/unstable
$ sudo apt-get update
$ sudo apt-get install neovim
```

However, remember that for using Neovim the command in the terminal is `nvim`.

### GNU Stow

This config is managed using [GNU Stow](https://www.gnu.org/software/stow/).
GNU Stow is a symlink farm manager which takes distinct packages of software and/or data
located in separate directories on the filesystem, and makes them appear to be installed
in the same place.

To install GNU Stow use

```bash
$ sudo apt-get install stow
```

### NVM

NVM is a Node Version Manager tool. Using the NVM utility, you can install multiple node.js
versions on a single system. You can also choose a specific Node version for applications.

To install nvm use

```bash
$ curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
```

Then, you need to reboot your computer.

With nvm you can install multiple node.js versions. For us the latest version is fine

```bash
$ nvm install node
```

Here, node is the alias for the latest version.

### ripgrep

ripgrep is a line-oriented search tool that recursively searches the current directory for
a regex pattern. By default, ripgrep will respect gitignore rules and automatically skip
hidden files/directories and binary files.

To install ripgrep use

```bash
$ sudo apt-get install ripgrep
```

### fzf

fzf is a general-purpose command-line fuzzy finder. It's an interactive Unix filter for
command-line that can be used with any list; files, command history, processes, hostnames,
bookmarks, git commits, etc.

To install fzf use

```bash
$ sudo apt-get install fzf
```

### Antigen

Antigen is a small set of functions that help you easily manage your shell (zsh) plugins,
called bundles. The concept is pretty much the same as bundles in a typical vim+pathogen
setup. Antigen is to zsh, what Vundle is to vim.

To install Antigen use

```bash
$ curl -L git.io/antigen > antigen.zsh
```

### pyenv

pyenv lets you easily switch between multiple versions of Python. It's simple,
unobtrusive, and follows the UNIX tradition of single-purpose tools that do one thing
well.

Before the installation of pyenv, it is suggested to install the following dependencies

```bash
$ sudo apt-get update
$ sudo apt-get install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

To install pyenv use

```bash
$ curl https://pyenv.run | bash
```

Finally, you need to configure your shell's environment for Pyenv

```bash
$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
$ echo 'eval "$(pyenv init --path)"' >> ~/.profile
$ echo 'if [ -n "$PS1" -a -n "$BASH_VERSION" ]; then source ~/.bashrc; fi' >> ~/.profile

$ echo 'eval "$(pyenv init -)"' >> ~/.bashrc
```

You need to reboot the computer.

You can check your python version using

```bash
$ python3 -V
```

To install a Python version with Pyenv, you need to select first the one you want, in
this example we will check for Python3.10

```bash
$ pyenv install --list | grep "3.10"
```

We will install the "last" version. In this case, 3.10.4.

```bash
$ pyenv install 3.10.4
```

To check the installed versions use

```bash
$ pyenv versions
```

Now, we need to select the version we installed as the "global" python

```bash
$ pyenv global 3.10.4
```

and reboot the computer.

### starship

starship is a minimal, blazing-fast, and infinitely customizable prompt for any shell.

To install starship use

```bash
$ sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```

### kitty

kitty is a fast, feature-rich, GPU based terminal emulator.

To install kitty use

```bash
$ curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

For a desktop integration on Linux, you need to install the `kitty.desktop` file.

First, create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in your PATH).
You may need to create the `bin` folder inside `.local`

```bash
$ ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
```

Place the kitty.desktop file somewhere it can be found by the OS

```bash
$ cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
```

Update the path to the kitty icon in the kitty.desktop file

```bash
$ sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
```

Then you need to reboot the computer.

## Activation of the super powers

First you need to clone this repository as

```bash
$ git clone https://github.com/juanhenao21/dotfiles.git ~/.dotfiles
```

go into the repository

```bash
$ cd ~/.dotfiles
```

then use stow to configure Neovim

```bash
$ mkdir -p ~/.config/nvim
$ stow nvim
```

To prevent conflicts, you need to disable the current `.zshrc`, if any. You can create a
backup file with

```bash
$ mv .zshrc .zshrc.back
```

Then, you need to run `stow` with every single folder name in the repository folder. One example
is

```bash
$ stow alacritty
```

Finally, run Neovim

```bash
$ nvim
```

and inside Neovim run

```vim
:PlugInstall
```

and

```vim
:PlugUpdate
```

Finally, you need to move `antigen.zsh` to a new folder using

```bash
$ mkdir .bin
$ mv antigen.zsh .bin/
```

then open the `.zshrc` and copy the following line and add the path to `.bin/`

```bash
[ -f $HOME/bin/antigen.zsh ] && source $HOME/bin/antigen.zsh
[ -f $HOME/.bin/antigen.zsh ] && source $HOME/.bin/antigen.zsh
```

And that is all! You can enjoy your new super terminal with all the powers of Neovim.
