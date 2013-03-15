" marbu's ~/.vimrc 
" inspired by: http://mislav.uniqpath.com/2011/12/vim-revisited/

"
" core configuration
"

set nocompatible                   " just say no to the legacy vi craziness
set encoding=utf-8                 " vim internal encoding (interface)
set fileencodings=utf-8,iso8859-2  " expected encodings of files to open
filetype plugin indent on          " load filetype plugins and indentations

"
" basic interface
"

syntax on                          " use syntax highlighting by default
set showcmd                        " display incomplete commands (command mode)
set ruler                          " show cursor position all the time
set background=dark                " expect dark terminal emulator theme
set tabstop=4                      " default tab size
set shiftwidth=4                   " default (auto)indent size
set backspace=indent,eol,start     " backspace through everything (insert mode)

"
" searching
"

set hlsearch     " highlight matches
set incsearch    " incremental searching
set ignorecase   " case insensitive searches ...
set smartcase    " unless string to find contains at least one capital letter
noremap ,f :noh<CR> " my shortcut: un-highligt search results

"
" text navigation
"

set wrap             " wrap lines by default
set colorcolumn=80   " show vertical line on char 80

" hjkl navigation on virtual lines (command mode)
"noremap k gk
"noremap j gj
" similar hack for insert mode
"inoremap <up> <Esc>g<up>a
"inoremap <down> <Esc>g<down>a

"
" temp files
"

set backupdir=$HOME/.vim/backup " store backup files in predefined directory
set backup                      " enable backup by default

"
" http://www.fi.muni.cz/~kas/blog/index.cgi/computers/spell-checking-vim.html
"

set spelllang=cs,en,csa  " set default spell language
set nospell              " turn it off by default

"
" filetype specific tweaks
"

" no syntax for xml files (since I need to edit _large_ xml files)
"autocmd BufRead *.xml set syntax=off

" limit max size of line for plaintext like files
autocmd BufRead,BufNewFile *.txt      set textwidth=79
autocmd BufRead,BufNewFile *.tex      set textwidth=79
autocmd BufRead,BufNewFile *.md       set textwidth=79
autocmd BufRead,BufNewFile *.markdown set textwidth=79

" show linenumbers for these source files
autocmd BufRead,BufNewFile *.c    set number
autocmd BufRead,BufNewFile *.sh   set number
autocmd BufRead,BufNewFile *.py   set number
autocmd BufRead,BufNewFile *.hs   set number
autocmd BufRead,BufNewFile *.js   set number
autocmd BufRead,BufNewFile *.java set number

"
" new file skeleton templates
"

autocmd BufNewFile *.[a-zA-Z0-9]\+ silent! 0read $HOME/.vim/skeleton/skeleton.<amatch>:t:e

"
" others
"

" shortcut: F9 runs make
map <F9> :make<CR>
imap <F9> :make<CR>

" automaticke doplnovani ze vsech includovanych veci
set completeopt=longest,menuone

"
" pathogen integration
"
 
execute pathogen#infect()

" pandoc: don't use folding
let g:pandoc_no_folding = 1

" tagbar toggle
nmap <F8> :TagbarToggle<CR>
