function! dashboard#leaderf#find_file() abort
	LeaderfFile .
endfunction

function! dashboard#leaderf#find_history() abort
	LeaderfMru
endfunction

function! dashboard#leaderf#change_config() abort
	edit ~/.vimrc
endfunction

function! dashboard#leaderf#find_word() abort
	Leaderf rg -i
endfunction

function! dashboard#leaderf#quit() abort
	execute ':q'
endfunction

