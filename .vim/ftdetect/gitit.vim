" set filetype of a gitit wikipage file (*.page) based on pandoc metadata in
" the file, see also http://vim.wikia.com/wiki/Filetype.vim
autocmd BufRead *.page call FTgititpage()
function! FTgititpage()
	if getline(1) =~ '^---$'
		if getline(2) =~ '^format: \?[mM]arkdown$'
			set filetype=markdown.pandoc
		elseif getline(2) =~ '^format: \?latex$'
			set filetype=tex
		elseif getline(2) =~ '^format: \?org$'
			set filetype=org
		elseif getline(2) =~ '^format: \?rst$'
			set filetype=rst
		endif
	else
		" default file type of gitit wikipage
		set filetype=markdown.pandoc
	endif
endfunction
