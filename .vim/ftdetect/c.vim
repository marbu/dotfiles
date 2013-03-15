" F8 jump to next error
autocmd BufRead,BufNewFile *.c map <F7> :cnext<CR>
autocmd BufRead,BufNewFile *.c imap <F7> :cnext<CR>
" F7 jump to prev error
autocmd BufRead,BufNewFile *.c map <F6> :cprevious<CR>
autocmd BufRead,BufNewFile *.c imap <F6> :cprevious<CR>
