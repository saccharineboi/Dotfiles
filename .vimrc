" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" custom stuff
set number relativenumber
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set hidden

" comment line for source code
abbr dd ////////////////////////////////////////

" view man pages in another panel
runtime! ftplugin/man.vim

" tags file for C/C++ programa
set tags=~/.tags

" theme
packadd! dracula
syntax enable
colorscheme dracula
set bg=dark
hi Normal guibg=NONE ctermbg=NONE
set cursorline
hi CursorLine ctermfg=None ctermbg=Black cterm=bold
hi CursorLineNr ctermfg=None ctermbg=Black cterm=bold
hi StatusLine ctermfg=White ctermbg=Black cterm=bold

" switch buffers using shift and tab
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" close the current buffer without closing window
command! Bd bp|bd #
