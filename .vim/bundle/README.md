# Bundled vim plugins

This directory (`~/.vim/bundle/`) contains git submodules of vim plugins.
Submodules are integrated using [vim pathogen](http://www.vim.org/scripts/script.php?script_id=2332).

## Usage

Following examples use my helper script `dotfile` (from scriptpile repo).

Plugin installation:

~~~
cd
dotfile submodule add https://github.com/terryma/vim-multiple-cursors.git .vim/bundle/vim-multiple-cursors
~~~

Plugin installation (with another submodule inside):

~~~
$ cd
$ dotfile submodule add https://github.com/davidhalter/jedi-vim.git .vim/bundle/jedi-vim
$ cd ~/.vim/bundle/jedi-vim
$ git submodule update
~~~

Submodule update (after cloning):

~~~
$ cd
$ dotfile submodule update --init ~/.vim/bundle/vim-pandoc
~~~
