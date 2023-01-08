
func! s:FindRoot()
	let s:gitdir=getcwd()."/"
	while strridx(s:gitdir,"/")!=-1
		let s:gitdir=strpart(s:gitdir,0,strridx(s:gitdir,"/"))
		if isdirectory(s:gitdir . "/.git")
			break
		endif
	endwhile
	if strridx(s:gitdir,"/")==-1
		return ""
	endif
	return s:gitdir
endfunc

function! sessions#session#session_save(name)
  if ! isdirectory(g:session_directory)
    call mkdir(g:session_directory, 'p')
  endif
  let file_name = empty(a:name) ? '.session' : a:name

  if g:session_directory=='root'
    if s:FindRoot()!=""
      let g:session_directory=s:FindRoot()
    else
      let g:session_directory="."
    endif
  endif

  let file_path = g:session_directory.'/'.file_name.'.vim'
  execute 'mksession! '.fnameescape(file_path)
  let v:this_session = file_path

  echohl MoreMsg
  echo 'Session `'.file_name.'` is now saved'
  echohl None
endfunction

function! sessions#session#session_load(name)
  let file_name = empty(a:name) ? '.session' : a:name

  if g:session_directory=='root'
    if s:FindRoot()!=""
      let g:session_directory=s:FindRoot()
    else
      let g:session_directory="."
    endif
  endif
  let file_path = g:session_directory.'/'.file_name.'.vim'

  if ! empty(v:this_session) && ! exists('g:SessionLoad')
    \ |   execute 'mksession! '.fnameescape(v:this_session)
    \ | endif

  if filereadable(file_path)
    noautocmd silent! %bwipeout!
    execute 'silent! source '.file_path
    if &laststatus == 0
      set laststatus=2
    endif
	if g:dashboard_auto_delete_session
		echomsg 'Load and auto delete '.file_path
		call sessions#session#session_remove('session')
	endif
  else
    echohl ErrorMsg
    echomsg 'The session "'.file_path.'" doesn''t exist'
    echohl None
  endif
endfunction

function! sessions#session#session_remove(name)
  let file_name = empty(a:name) ? '.session' : a:name

  if g:session_directory=='root'
    if s:FindRoot()!=""
      let g:session_directory=s:FindRoot()
    else
      let g:session_directory="."
    endif
  endif
  let file_path = g:session_directory.'/'.file_name.'.vim'

  if filereadable(file_path)
	  silent call delete(file_path)
      echo 'session remove success'
  else
	  echomsg 'the session '.file_path.' not found'
  endif

endfunction

function! sessions#session#session_list(A, C, P)
  return map(
    \ split(glob(g:session_directory.'/*.vim'), '\n'),
    \ "fnamemodify(v:val, ':t:r')"
    \ )
endfunction


" vim: et sw=2 sts=2
