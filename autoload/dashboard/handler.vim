" change bu chenxuan
function! dashboard#handler#new_file()
  if &laststatus == 0
      set laststatus=2
    endif
  execute 'enew'
endfunction

function! dashboard#handler#last_session()
  SessionLoad
endfunction

function! dashboard#handler#find_file() abort
  call dashboard#{g:dashboard_executive}#find_file()
endfunction

function! dashboard#handler#find_history() abort
  call dashboard#{g:dashboard_executive}#find_history()
endfunction

function! dashboard#handler#change_config() abort
  call dashboard#{g:dashboard_executive}#change_config()
endfunction

function! dashboard#handler#find_word() abort
  call dashboard#{g:dashboard_executive}#find_word()
endfunction

function! dashboard#handler#quit() abort
  call dashboard#{g:dashboard_executive}#quit()
endfunction
