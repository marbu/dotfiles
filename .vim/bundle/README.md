list of vim plugins:

 * <https://github.com/davidhalter/jedi-vim.git>
 * <https://github.com/majutsushi/tagbar.git>
 * <https://github.com/vim-pandoc/vim-pandoc.git>
 * <https://github.com/jceb/vim-orgmode.git>
 * <https://github.com/airblade/vim-gitgutter.git>
 * <https://github.com/tpope/vim-commentary.git>

example of pluing installation (with another submodule inside):

~~~
$ cd
$ dotfile submodule add -f https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim
$ cd ~/.vim/bundle/jedi-vim
$ git submodule update
~~~
