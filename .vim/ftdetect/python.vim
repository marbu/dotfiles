autocmd BufRead,BufNewFile *.py set number
autocmd BufRead,BufNewFile *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead,BufNewFile *.py set tabstop=4
autocmd BufRead,BufNewFile *.py set shiftwidth=4
autocmd BufRead,BufNewFile *.py set smarttab
autocmd BufRead,BufNewFile *.py set expandtab
autocmd BufRead,BufNewFile *.py set softtabstop=4
autocmd BufRead,BufNewFile *.py set autoindent
autocmd BufRead,BufNewFile *.py highlight BadWhitespace ctermbg=red guibg=red
autocmd BufRead,BufNewFile *.py match BadWhitespace /^\t\+/
autocmd BufRead,BufNewFile *.py match BadWhitespace /\s\+$/
autocmd BufWritePre *.py normal m':%s/\s\+$//e '
autocmd BufRead,BufNewFile *.py set syntax=python
autocmd BufRead,BufNewFile *.py set commentstring=#\ %s
