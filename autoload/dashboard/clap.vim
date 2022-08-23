function! dashboard#clap#find_file() abort
	LeaderfFile .
endfunction

function! dashboard#clap#find_history() abort
	LeaderfMru
endfunction

function! dashboard#clap#change_colorscheme() abort
	LeaderfColorscheme
endfunction

function! dashboard#clap#find_word() abort
	Leaderf rg -i
endfunction

function! dashboard#clap#book_marks() abort
	execute ':q'
endfunction

