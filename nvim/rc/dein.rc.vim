" 2019/11/04 kamato02 deinのrcファイルTOMLファイルからロードする
" 設定ファイルやキャッシュファイルの場所指定にシェルコマンドの環境変数使用

if &compatible
    set nocompatible
endif

" ランタイムパスの指定
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = expand('$XDG_CACHE_HOME/dein/')
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

" 遅延なしロードこのファイルのみ
    call dein#load_toml('$XDG_CONFIG_HOME/nvim/toml/dein.toml', {'lazy': 0})

" 遅延ありロード、ファイル形式等で分ける
    call dein#load_toml('$XDG_CONFIG_HOME/nvim/toml/dein_lazy.toml', {'lazy': 1})
    call dein#load_toml('$XDG_CONFIG_HOME/nvim/toml/dein_toml.toml', {'lazy': 1})
    call dein#load_toml('$XDG_CONFIG_HOME/nvim/toml/dein_python.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

if !has('vim_starting') && dein#check_install()
    call dein#install()
endif
