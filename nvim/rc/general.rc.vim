" 2019/11/5 kamato02 neoVimの基本設定

" エンコード設定
set encoding=utf-8
scriptencoding utf-8

" 行番号表示
set number
set backspace=indent,eol,start

" カーソル行をハイライト
set cursorline
hi CursorLine ctermbg=darkgrey

" カーソル列をハイライト
set cursorcolumn

" タブを空白文字に
set expandtab

" タブを空白４文字分に
set tabstop=4

" オートインデント
set autoindent

" スマートインデント
set smartindent
set shiftwidth=4

" powerlineの設定
let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'
let g:airline#extensions#virtualenv#enabled = 1
set laststatus=2

" 括弧の補完
inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
