" change bu chenxuan
let s:empty_lines = ['']
let s:Section = {}
let s:dashboard_shortcut={}
let s:dashboard_shortcut_icon={}

if exists('g:dashboard_custom_shortcut')
  call extend(s:dashboard_shortcut, g:dashboard_custom_shortcut)
else
  let s:dashboard_shortcut['find_file'] = '[1]    '
  let s:dashboard_shortcut['find_history'] = '[2]    '
  let s:dashboard_shortcut['find_word'] = '[3]    '
  let s:dashboard_shortcut['last_session'] = '[4]    '
  let s:dashboard_shortcut['new_file'] = '[5]    '
  let s:dashboard_shortcut['change_config'] = '[0]   '
  let s:dashboard_shortcut['book_marks'] = '[q]    '
endif

let s:dashboard_shortcut_icon['last_session'] = ' '
let s:dashboard_shortcut_icon['find_history'] = ' '
let s:dashboard_shortcut_icon['find_file'] = ' '
let s:dashboard_shortcut_icon['new_file'] = ' '
let s:dashboard_shortcut_icon['change_config'] = ' ' " ' '
let s:dashboard_shortcut_icon['find_word'] = ' '
let s:dashboard_shortcut_icon['book_marks'] = ' '

if exists('g:dashboard_custom_shortcut_icon')
  call extend(s:dashboard_shortcut_icon, g:dashboard_custom_shortcut_icon,'force')
endif

if exists('g:dashboard_custom_section')
  call extend(s:Section, g:dashboard_custom_section)
else
  " q to exit
  let s:Section = {
    \ 'find_word'            :{
          \ 'description': [s:dashboard_shortcut_icon['find_word'].'Find word                             '.s:dashboard_shortcut['find_word']],
          \ 'command': function('dashboard#handler#find_word'),
          \ 'func_name': 'dashboard#handler#find_word()',
          \ 'key': '3'},
    \ 'find_history'         :{
          \ 'description': [s:dashboard_shortcut_icon['find_history'].'Recently opened files                 '.s:dashboard_shortcut['find_history']],
          \ 'command':function('dashboard#handler#find_history'),
          \ 'func_name': 'dashboard#handler#find_history()',
          \ 'key': '2'},
    \ 'new_file'             :{
          \ 'description': [s:dashboard_shortcut_icon['new_file'].'New file                              '.s:dashboard_shortcut['new_file']],
          \ 'command':function('dashboard#handler#new_file'),
          \ 'func_name': 'dashboard#handler#new_file()',
          \ 'key': '5'},
    \ 'change_config'   :{
          \ 'description': [s:dashboard_shortcut_icon['change_config'].'Open vim config                       '.s:dashboard_shortcut['change_config']],
          \ 'command':function('dashboard#handler#change_config'),
          \ 'func_name': 'dashboard#handler#change_config()',
          \ 'key': '0'},
    \ 'quit'                 :{
          \ 'description': [s:dashboard_shortcut_icon['book_marks'].'Quit                                  '.s:dashboard_shortcut['book_marks']],
          \ 'command':function('dashboard#handler#quit'),
          \ 'func_name': 'dashboard#handler#quit()',
          \ 'key': 'q'},
    \ 'last_session'         :{
          \ 'description': [s:dashboard_shortcut_icon['last_session'].'Open last session                     '.s:dashboard_shortcut['last_session']],
          \ 'command':function('dashboard#handler#last_session'),
          \ 'func_name': 'dashboard#handler#last_session()',
          \ 'key': '4'},
    \ 'find_file'            :{
          \ 'description': [s:dashboard_shortcut_icon['find_file'].'Find file                             '.s:dashboard_shortcut['find_file']],
          \ 'command':function('dashboard#handler#find_file'),
          \ 'func_name': 'dashboard#handler#find_file()',
          \ 'key': '1'},
    \ }
endif

function! dashboard#section#height()
  return len(s:Section)+(len(s:Section)-1)
endfunction

function! dashboard#section#instance()
  call s:set_section()
endfunction

function! s:set_section()
  let l:sorted = []
  for key in keys(s:Section)
    call add(l:sorted,key)
  endfor

  for key in sort(l:sorted)
    let dashboard_{key} = g:dashboard#utils#set_custom_section(g:dashboard#utils#draw_center(s:Section[key]["description"]))
    call append('$',dashboard_{key})
    call dashboard#register(line('$'), key, s:Section[key]["command"])
    call append('$', s:empty_lines)
	execute "nnoremap<buffer><silent> ".s:Section[key]['key']." :call ".s:Section[key]["func_name"]." <cr>"
  endfor
endfunction
