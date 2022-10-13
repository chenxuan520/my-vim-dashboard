

# 声明

## **该仓库所有大部分代码均来自于[dashboard-nvim](https://github.com/glepnir/dashboard-nvim)** 本人只是添加一些个人的修改

- 将clap改为leaderf

## **该仓库添加了[Vim-slash](https://github.com/junegunn/vim-slash),并添加了一些功能**

- 添加了选中查找功能,删除gd映射防止冲突

## **该仓库添加了[tokyonight.vim]()的autoload部分,并对其进行了修改**

- 修改配色

---

### 自定义头部

- 获取图案表示[Spring Boot banner在线生成工具](https://www.bootschool.net/ascii),选择类型为`ANSI Shadow`

- 获取Vim形式[vim-dashboard-header-make](https://chenxuan520.gitee.io/chenxuanweb/header.html)(花了一点自己时间做的,因为不怎么写前端,画面比较差)

- 将得到的结果复制到.vimrc中

---

## 原readme

## Install

- vim-plug

  ```vim
  Plug 'chenxuan520/my-vim-dashboard'
  ```
- dein

  ```vim
  call dein#add('chenxuan520/my-vim-dashboard')
  ```

  ## Options
- Config your excute tool by `g:dashboard_default_executive`,This option mean what fuzzy
  search plugins that you used leaderf

  ```viml
  " Default value is clap
  let g:dashboard_default_executive ='leaderf'
  ```
- the dashboard commands execute tool depends on what plugin you used
  - - ```viml
      eg : "SPC mean the leaderkey
      let g:dashboard_custom_shortcut={
        \ 'last_session'       : 'SPC s l',
        \ 'find_history'       : 'SPC f h',
        \ 'find_file'          : 'SPC f f',
        \ 'new_file'           : 'SPC c n',
        \ 'change_colorscheme' : 'SPC t c',
        \ 'find_word'          : 'SPC f a',
        \ 'book_marks'         : 'SPC f b',
        \ }
      ```
- `g:dashboard_custom_shortcut_icon` custom the shortcut icon.like this

  ```
  let g:dashboard_custom_shortcut_icon['last_session'] = ' '
  let g:dashboard_custom_shortcut_icon['find_history'] = 'ﭯ '
  let g:dashboard_custom_shortcut_icon['find_file'] = ' '
  let g:dashboard_custom_shortcut_icon['new_file'] = ' '
  let g:dashboard_custom_shortcut_icon['change_colorscheme'] = ' '
  let g:dashboard_custom_shortcut_icon['find_word'] = ' '
  let g:dashboard_custom_shortcut_icon['book_marks'] = ' '
  ```
- what does the shortcut do? just a tip like `whichkey`,on dashboard you just
  move the cursor and press `enter`
- `g:dashboard_custom_header` custom the dashboard header (same as startify)
  check [wiki](https://github.com/glepnir/dashboard-nvim/wiki/Ascii-Header-Text)
  to find more Ascii Text Header collection.
- `g:dashboard_custom_footer` custom the dashboard footer (same as startify)
- Dashboard provide session support with `SessionLoad` and `SessionSave`
  commands you can define keymap like this .

  ```viml
  nmap <Leader>ss :<C-u>SessionSave<CR>
  nmap <Leader>sl :<C-u>SessionLoad<CR>
  ```

  set the `dashboard_session_directory` to change the session folder
  default is `~/.cache/vim/session`
- Highlight group

  ```VimL
  DashboardHeader
  DashboardCenter
  DashboardShortcut
  DashboardFooter
  ```
- Autocmd `Dashboard` `DashboardReady` same as vim-startify
- `g:dashboard_custom_section` custom section, it's a dict type,key is your section component name,
  It will be used to sort. every component is a dict and must have `description` and `command`,
  `description` is a list that show in Dashboard buffer,`command` is string or funcref type.

  ```viml
  let g:dashboard_custom_section={
    \ 'buffer_list': {
        \ 'description': [' Recently lase session                 SPC b b'],
        \ 'command': 'Some Command' or function('your funciton name') }
    \ }
  ```
- some options for fzf `g:dashboard_fzf_float` default is 1, `g:dashboard_fzf_engine` default is `rg` other value is `ag`
- `dashboard_preview_command`  a command that can normal output in neovim built-in terminal.like
  `cat` etc
- `dashboard_preview_pipeline` pipeline command
- `dashboard_preview_file` your preview file path string.
- `dashboard_preview_file_height` preview file height.
- `dashboard_preview_file_width` preview file width.

  ## Minial vimrc

  you can replace the vim-clap or fzf.vim commands by dashboard commands

  ```viml
  Plug 'glepnir/dashboard-nvim'
  Plug 'liuchengxu/vim-clap' or Plug 'junegunn/fzf.vim' or Plug 'nvim-lua/telescope.nvim'
  let g:mapleader="\<Space>"
  let g:dashboard_default_executive ='clap' or 'fzf' or 'telescope'
  nmap <Leader>ss :<C-u>SessionSave<CR>
  nmap <Leader>sl :<C-u>SessionLoad<CR>
  nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
  nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
  nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
  nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
  nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
  nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
  ```

  ## FAQ
- What is it different from vim-startify ?
  dashbaord is inspired by doom-emacs, startify provides a list of many files,
  Mru oldfile, etc., but do we really need this list, we will only open one file,
  and the file list takes up a lot of space, the dashboard uses fuzzy search plugin
  pop-up menu, it saves a lot of space, and provides more functions.
- How to work with indentline plugin ?

  ```vim
  let g:indentLine_fileTypeExclude = ['dashboard']
  ```
- How to disable tabline in dashboard buffer?

  ```vim
  autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
  ```

  ## LICENSE
- MIT
