# My personal dotfile repo

To manage dotfile repositories like this one, I use
[dogit](https://github.com/marbu/dogit), a simple git wrapper script I wrote
for this purpose.

That said you don't need any tool to make sense of it as format of this
repository is quite simple. Working tree of the repo represents a home
directory, so no additional file transformations are needed with an exception
of removing this README file.

## Submodules

This repository contains few [git
submodules](https://www.kernel.org/pub/software/scm/git/docs/gitsubmodules.html)
with plugins or color schemes.

To list the submodules, run:

```
$ dogit submodule
-5b488629671479ce3294f1f5d738c96aba0c74e2 .config/alacritty/themes
 54e5676988e6eeaa05b41730b6b056026ad0ef13 .vim/pack/marbu/start/vim-commentary (v1.3-10-g54e5676)
```

To add a new submodule (eg. for a neovim plugin):

```
$ cd
$ dogit submodule add https://github.com/Shatur/neovim-ayu.git .config/nvim/pack/marbu/start/neovim-ayu
$ dogit commit -m 'neovim: add neovim-ayu plugin'
```

To update a submodule:

```
$ cd
$ dogit submodule update --remote .vim/pack/marbu/opt/vim-commentary
$ dogit commit -m "vim: update vim-commentary module"
```

To remove a submodule:

```
$ cd
$ dogit submodule deinit ~/.vim/pack/marbu/start/tagbar
$ dogit rm ~/.vim/pack/marbu/start/tagbar
$ dogit commit -m "vim: drop tagbar plugin submodule"
```
