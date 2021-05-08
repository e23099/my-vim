# my-vim

My vim config for setting up new environment.

## Dependency

For `vimspector` to work, vim version should be 8.2 or higher.

For debian user, downloading vim8.2 may need install from testing repository:

(see this stack_exchange [post](https://serverfault.com/questions/550855/how-to-add-debian-testing-repository-to-apt-get))

```
sudo vim /etc/apt/sources.list
```
to add this line into the sources list:
```
deb http://http.us.debian.org/debian/ testing non-free contrib main
```
save it, and run
```
sudo apt-get update
```
Finally, remove vim and reinstall it, it should be of ver.8.2.



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

## java syntax support with coc

First, 
```
:CocInstall coc-java
```
to install coc-java support.

Secondly, use 
```
:CocConfig
```
to open up config for coc, then put the path of your **JDK** like:

```
{
    "java.home": "path/to/jdk"
}
```

To see where is your jdk on Debain:
```
update-alternatives --list java
```

## debugging with vimspector

### Global settings

Copy `vimspector-configurations` to bundle path.
```
cp -r vimspector-configurations ~/.vim/bundle/vimspector/configurations/<your_machine_os_name, ex:linux>/
```

### installation

Open up vim and
```
:VimspectorInstall dubugpy vscode-cpptools vscode-java-debug
```
for debugging python, cpp/c, and java codes.

cpp/c requires gdb installed on the machine, with it's path (ex: /usr/bin/gdb) set inside the global settings json file `vimspector/configurations/<os_name>/cpp/cpp.json`.

Java debugging is not properly configured yet, so it's not recommended using vimspector to debug java codes for now.
