function! dashboard#leaderf#find_file() abort
	LeaderfFile .
endfunction

function! dashboard#leaderf#find_history() abort
	LeaderfMru
endfunction

function! dashboard#leaderf#change_colorscheme() abort
	LeaderfColorscheme
endfunction

function! dashboard#leaderf#find_word() abort
	Leaderf rg -i
endfunction

function! dashboard#leaderf#book_marks() abort
	execute ':q'
endfunction

