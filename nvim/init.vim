"2019/11/1 kamato02 initファイル、主にrcファイルの呼び出し 

" source_rcにrcファイルを追加
function! s:source_rc(path, ...) abort "{{{
    let use_global = get(a:000, 0, !has('vim_starting'))
    let abspath = resolve(expand('$XDG_CONFIG_HOME/nvim/rc/' . a:path))
    if !use_global
        execute 'source' fnameescape(abspath)
    return
    endif

" 全ての"set"を"setglobal"に置き換える
    let content = map(readfile(abspath),
        \ 'substitute(v:val, "^\\W*\\zsset\\ze\\W", "setglobal", "")')

" "tempfile"を作成、それと"tempfile"をソースする
    let tempfile = tempname()
    try
        call writefile(content, tempfile)
        execute 'source' fnameescape(tempfile)
    finally
        if filereadable(tempfile)
            call delete(tempfile)
        endif
    endtry
endfunction"}}}

if !isdirectory(expand($CACHE))
    call mkdir(expand($CACHE), 'p')
endif

" pythonをロード
let g:python_hosts_prog = $PYENV_PATH . '/version/neovim2/bin/python'
let g:python3_hosts_prog = $PYENV_PATH . '/version/neovim3/bin/python'

" rcファイルを呼び出し
call s:source_rc('dein.rc.vim')
call s:source_rc('general.rc.vim')
call s:source_rc('keymap.rc.vim')
