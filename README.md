# my-vim

My vim config for setting up new environment.


## Installation

### Clone the .vimrc file in this repository
```
git clone https://github.com/e23099/my-vim
```

Copy the .vimrc file into your home directory.

### Clone Vundle for managing plugins
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
### Install Plugins via Vundle

Open up .vimrc with vim, and type:
```
:PluginInstall
```

And that's it.

### Encoding Problem

This `_vimrc` is written in windows, so if you are using it in an unix environment, you may encounter the "carat M" problem.
To solve it, vim into the `_vimrc` file, and do:
```
:w ++ff=unix
```
to deal with those carat M.
