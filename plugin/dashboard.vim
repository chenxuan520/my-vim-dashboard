if exists('g:loaded_dashboard') || &cp
  finish
endif

let g:loaded_dashboard = 1

if !get(g:, 'dashboard_disable_at_vimenter') && (!has('nvim') || has('nvim-0.3.5'))
  " Only for Nvim v0.3.5+: https://github.com/neovim/neovim/issues/9885
  set shortmess+=I
endif

let s:home_dir = getenv('HOME')

" Options
let g:dashboard_auto_delete_session = get(g:,'dashboard_auto_delete_session',0)
let g:dashboard_executive = get(g:,'dashboard_default_executive','leaderf')
let g:dashboard_fzf_window =get(g:,'dashboard_fzf_window',1)
let g:dashboard_fzf_engine = get(g:,'dashboard_fzf_engine','rg')
let g:session_directory = get(g:, 'dashboard_session_directory','root')
let g:session_enable = get(g:,'dashboard_enable_session',1)
let g:dashboard_command = get(g:,'dashboard_preview_command','')
let g:preview_file_path = get(g:,'dashboard_preview_file','')
let g:preview_file_height = get(g:,'dashboard_preview_file_height',0)
let g:preview_file_width = get(g:,'dashboard_preview_file_width',0)
let g:preview_pipeline_command = get(g:,'dashboard_preview_pipeline','')
let s:disable_statusline = get(g:,'dashboard_disable_statusline',0)

augroup dashboard
  autocmd!
  autocmd VimEnter * nested call s:loaded_dashboard()
  if s:disable_statusline
    autocmd FileType dashboard ++once set laststatus=0|set showtabline=0|set noruler
    autocmd bufleave <buffer> ++once set laststatus=2|set showtabline=2|set noruler
  endif
  " autocmd BufReadPost * call dashboard#change_to_dir(expand("%:p"))
augroup END

function! s:loaded_dashboard() abort
  if !argc() && line2byte('$') == -1
    if !get(g:, 'dashboard_disable_at_vimenter')
      call dashboard#instance(1)
    endif
  endif
  autocmd! dashboard VimEnter
endfunction

if g:session_enable
  " Save and persist session
  command! -nargs=? -complete=customlist,sessions#session#session_list SessionSave
    \ call sessions#session#session_save(<q-args>)

  " Load and persist session
  command! -nargs=? -complete=customlist,sessions#session#session_list SessionLoad
    \ call sessions#session#session_load(<q-args>)

  " delete the session
  command! -nargs=? -complete=customlist,sessions#session#session_list SessionRemove
    \ call sessions#session#session_remove(<q-args>)

  " Save session on quit if one is loaded
  " augroup plugin_sessions
  "   autocmd!
    " If session is loaded, write session file on quit
    " autocmd VimLeavePre *
    "   \ if ! empty(v:this_session) && ! exists('g:SessionLoad')
    "   \ |   execute 'mksession! ' . fnameescape(v:this_session)
    "   \ | endif
  " augroup END
endif

command! -nargs=0 -bar Dashboard call dashboard#instance(0)

command! -nargs=0 -bar DashboardNewFile           call dashboard#handler#new_file()
command! -nargs=0 -bar DashboardFindFile          call dashboard#handler#find_file()
command! -nargs=0 -bar DashboardFindHistory       call dashboard#handler#find_history()
command! -nargs=0 -bar DashboardChangeConfig      call dashboard#handler#change_config()
command! -nargs=0 -bar DashboardFindWord          call dashboard#handler#find_word()

" vim: et sw=2 sts=2
