function! dashboard#leaderf#find_file() abort
	LeaderfFile .
endfunction

function! dashboard#leaderf#find_history() abort
	LeaderfMru
endfunction

function! dashboard#leaderf#change_config() abort
	if has('nvim')
		edit ~/.config/nvim/init.vim
	else
		edit ~/.vimrc
	endif
endfunction

function! dashboard#leaderf#find_word() abort
	Leaderf rg -i
endfunction

function! dashboard#leaderf#quit() abort
	execute ':qa'
endfunction

