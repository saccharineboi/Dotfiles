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
set noautoindent
set nosmartindent

" comment line for source code
abbr dd ////////////////////////////////////////
abbr ee ////////////////////////////////////////////////////////////////////////////////////////////////////

" view man pages in another panel
runtime! ftplugin/man.vim

" tags file for C/C++ programa
set tags=~/.tags

" theme
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

" automatically make views
augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
augroup END

set ttyfast

" enable auto-completion
let g:ale_linters = {
\   'lua': ['lua-language-server'],
\   'python': ['pylsp'],
\   'javascript': ['tsserver'],
\   'typescript': ['tsserver'],
\   'c': ['gcc'],
\   'cpp': ['gcc'],
\}

" only run the manually specified linters
let g:ale_linters_explicit = 1

let g:LargeFile = 0.1

" additional arguments for gcc and g++
let g:ale_c_cc_options = '-std=c99' .
\ ' -Wall' .
\ ' -Wextra' .
\ ' -Wpedantic' .
\ ' -Wfloat-equal' .
\ ' -Wundef' .
\ ' -Wshadow' .
\ ' -Wpointer-arith' .
\ ' -Wcast-align' .
\ ' -Wwrite-strings' .
\ ' -Wswitch-enum' .
\ ' -Wcast-qual' .
\ ' -Wconversion' .
\ ' -Wduplicated-cond' .
\ ' -Wduplicated-branches' .
\ ' -Wformat-nonliteral' .
\ ' -Wformat-security' .
\ ' -Wformat-y2k' .
\ ' -Wformat=2' .
\ ' -Wno-unused-parameter' .
\ ' -Wunused' .
\ ' -Winvalid-pch' .
\ ' -Wlogical-op' .
\ ' -Wmissing-declarations' .
\ ' -Wmissing-field-initializers' .
\ ' -Wmissing-format-attribute' .
\ ' -Wmissing-include-dirs' .
\ ' -Wmissing-noreturn' .
\ ' -Wpacked' .
\ ' -Wredundant-decls' .
\ ' -Wstack-protector' .
\ ' -Wdisabled-optimization' .
\ ' -Wsign-conversion' .
\ ' -Wsign-promo' .
\ ' -Wstrict-aliasing=2' .
\ ' -Wstrict-overflow=2' .
\ ' -Wno-suggest-attribute=format'

let g:ale_cpp_cc_options = '-std=c++20' .
\ ' -Wall' .
\ ' -Wextra' .
\ ' -Wpedantic' .
\ ' -Wfloat-equal' .
\ ' -Wundef' .
\ ' -Wshadow' .
\ ' -Wpointer-arith' .
\ ' -Wcast-align' .
\ ' -Wwrite-strings' .
\ ' -Wswitch-enum' .
\ ' -Wcast-qual' .
\ ' -Wconversion' .
\ ' -Wduplicated-cond' .
\ ' -Wduplicated-branches' .
\ ' -Wnon-virtual-dtor' .
\ ' -Woverloaded-virtual' .
\ ' -Wold-style-cast' .
\ ' -Wformat-nonliteral' .
\ ' -Wformat-security' .
\ ' -Wformat-y2k' .
\ ' -Wformat=2' .
\ ' -Wno-unused-parameter' .
\ ' -Wunused' .
\ ' -Winvalid-pch' .
\ ' -Wlogical-op' .
\ ' -Wmissing-declarations' .
\ ' -Wmissing-field-initializers' .
\ ' -Wmissing-format-attribute' .
\ ' -Wmissing-include-dirs' .
\ ' -Wmissing-noreturn' .
\ ' -Wpacked' .
\ ' -Wredundant-decls' .
\ ' -Wstack-protector' .
\ ' -Wstrict-null-sentinel' .
\ ' -Wdisabled-optimization' .
\ ' -Wsign-conversion' .
\ ' -Wsign-promo' .
\ ' -Wstrict-aliasing=2' .
\ ' -Wstrict-overflow=2' .
\ ' -Wno-suggest-attribute=format'

let g:ale_disable_lsp = 1
let g:airline#extensions#ale#enabled = 1

" move between errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-css', 'coc-cmake', 'coc-docker', 'coc-eslint', 'coc-html', 'coc-lua', 'coc-lightbulb', 'coc-tsserver', 'coc-pyright', 'coc-sh', 'coc-markdownlint']
