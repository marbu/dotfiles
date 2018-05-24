# Vim plugins

Directories `~/.vim/pack/marbu/{start,opt}` contain Vim plugins which are
bundled as [git
submodules](http://www.kernel.org/pub/software/scm/git/docs/gitsubmodules.html).

The plugins are integrated using **Vim Packages** feature, which is availabe
since Vim 8, see [`:h packages`](http://vimhelp.appspot.com/repeat.txt.html#packages)
for related Vim documentation.

## Usage

Following examples uses [`dogit`](https://github.com/marbu/dogit), my git
wrapper script for dotfiles management.

### Adding new plugin

~~~
$ cd
$ dogit submodule add https://github.com/tpope/vim-commentary.git .vim/pack/marbu/start/vim-commentary
$ dogit commit -m "vim: add vim-commentary module"
~~~

When a plugin has another submodule inside:

~~~
$ cd
$ dogit submodule add https://github.com/davidhalter/jedi-vim.git .vim/pack/marbu/opt/jedi-vim
$ cd ~/.vim/pack/marbu/opt/jedi-vim
$ git submodule init
$ git submodule update
$ git submodule
 bd7c65d9639c2d451d44c6d135b4f6043a918950 pythonx/jedi (v0.12.0)
 579146b5010ae22aa0a32c6098413189baa4367d pythonx/parso (v0.2.0)
$ dogit commit -m "vim: add jedi-vim module"
~~~

### Updating a plugin

When you add a plugin and then want to use it on another machine, on which you
have cloned the dotfiles repo (in other words, you see the plugin in output
of `dogit submodule` and the plugin directory is empty):

~~~
$ cd
$ dogit submodule update --init ~/.vim/pack/marbu/opt/vim-commentary
~~~

When you have plugin already initialized, but want to update it (using latest
commits):

~~~
$ cd
$ dogit submodule update --remote .vim/pack/marbu/opt/vim-commentary
$ dogit commit -m "vim: update vim-commentary module"
~~~

### Removing a plugin

~~~
$ cd
$ dogit submodule deinit .vim/pack/marbu/opt/vim-pandoc
~~~

Note that deinit removes the files of the git submodule, but the submodule
is still tracked in the repository:

~~~
$ ls -l .vim/pack/marbu/opt/vim-pandoc
total 0
$ dogit submodule status .vim/pack/marbu/opt/vim-pandoc
-c9bb110bfa00e0c824bc14fc9819d6c269367a54 .vim/pack/marbu/opt/vim-pandoc
~~~
