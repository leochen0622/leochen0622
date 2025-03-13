"=============================================================================
" vimrc --- Entry file for vim
" Copyright (c) 2016-2022 Shidong Wang & Contributors
" Author: Shidong Wang < wsdjeg@outlook.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

" Use XDG paths if available
if !empty($XDG_CONFIG_HOME) && !empty($XDG_DATA_HOME) && !empty($XDG_STATE_HOME)
    set runtimepath^=$XDG_CONFIG_HOME/vim
    set runtimepath+=$XDG_DATA_HOME/vim
    set runtimepath+=$XDG_CONFIG_HOME/vim/after

    if exists('&packpath')
      set packpath^=$XDG_DATA_HOME/vim,$XDG_CONFIG_HOME/vim
      set packpath+=$XDG_CONFIG_HOME/vim/after,$XDG_DATA_HOME/vim/after
    endif

    let g:netrw_home = $XDG_DATA_HOME."/vim"
    if !isdirectory($XDG_DATA_HOME."/vim")
      call mkdir($XDG_DATA_HOME."/vim", 'p')
    endif
    call mkdir($XDG_DATA_HOME."/vim/spell", 'p')

    set backupdir=$XDG_STATE_HOME/vim/backup | call mkdir(&backupdir, 'p')
    set directory=$XDG_STATE_HOME/vim/swap   | call mkdir(&directory, 'p')
    set undodir=$XDG_STATE_HOME/vim/undo     | call mkdir(&undodir,   'p')
    set viewdir=$XDG_STATE_HOME/vim/view     | call mkdir(&viewdir,   'p')

    if !has('nvim') | set viminfofile=$XDG_STATE_HOME/vim/viminfo | endif
endif

" Note: Skip initialization for vim-tiny or vim-small.
if 1
    let g:_spacevim_if_lua = 0
    if has('lua')
        " add ~/.SpaceVim/lua to lua package path
        if has('win16') || has('win32') || has('win64')
            let s:plugin_dir = fnamemodify(expand('<sfile>'), ':h').'\lua'
            let s:str = s:plugin_dir . '\?.lua;' . s:plugin_dir . '\?\init.lua;'
        else
            let s:plugin_dir = fnamemodify(expand('<sfile>'), ':h').'/lua'
            let s:str = s:plugin_dir . '/?.lua;' . s:plugin_dir . '/?/init.lua;'
        endif
        silent! lua package.path=vim.eval("s:str") .. package.path
        if empty(v:errmsg)
            let g:_spacevim_if_lua = 1
        endif
    endif
    execute 'source' fnamemodify(expand('<sfile>'), ':h').'/init.vim'
endif

" LEO START
let g:tagbar_position = 'botright vertical'
let g:tagbar_width = 35
let g:table_mode_always_active = 1
highlight DiffDelete guifg=#870000 guibg=#2f1010
highlight DiffAdd guibg=#003f10
highlight DiffChange ctermfg=NONE guifg=NONE guibg=#273007
highlight DiffText guibg=#405017
highlight QuickFixLine guibg=#003000
set ttymouse=xterm2
set updatetime=500
nnoremap <C-Left> 4zh
nnoremap <C-Right> 4zl
nnoremap <C-Down> <C-e>
nnoremap <C-Up> <C-y>

function! Add_current_position_to_tag_stack()
	let pos = getcurpos()
	let newtag = [{'tagname' : '_', 'from' : pos}]
	call settagstack(win_getid(), {'items' : newtag}, 'a')
endfunction
nnoremap <C-\> :call Add_current_position_to_tag_stack()<CR>

function! ToggleQuickfix()
	if empty(filter(getwininfo(), 'v:val.quickfix'))
		copen
	else
		cclose
	endif
endfunction
map <F4> :call ToggleQuickfix()<CR>
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,n :n <C-R>=expand("%:p:h") . "/" <CR>

"set sidescrolloff=5  " this is default
"nmap <F8> :TagbarToggle<CR><CR>  " spacevim used F2 instead
"match ExtraWhitespace /\s\+$/  " spacevim enabled it by default
" LEO END
