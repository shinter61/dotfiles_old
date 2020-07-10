"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/shinter-pres/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/shinter-pres/.cache/dein')
  call dein#begin('/Users/shinter-pres/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/shinter-pres/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " neovimを起動した時ロードされる
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"Start basic settings--------------------------
set ruler " ファイル内でのカーソルの位置表示を行う
set number " ファイル内で行番号表示
set title " タイトルを表示
set laststatus=2 " ステータスラインを常に表示
set mouse=a " ターミナルでマウス操作を可能にする
set visualbell t_vb= " ビープ音を空文字表示に置き換える
set noerrorbells " エラーメッセージ表示の際にビープ音を鳴らさない
highlight CursorLineNr cterm=bold ctermbg=4 ctermfg=0
set cursorline " カーソルのある行がハイライトされる
set smartindent " 改行時に前の行に合わせてインデントを増減する
set shiftwidth=2 " 自動インデントでずれる幅
set softtabstop=2 " 連続する空白でタブキー、バックスペースでカーソルが動く幅
set tabstop=2 " 画面上でタブ文字が占める幅
set expandtab " タブ入力を複数の空白入力に置き換える
set smarttab " shiftwidthを有効にする
set wildmenu " ファイル名補完有効化
set wildmode=list:longest,full " マッチするものをリスト表示しつつ最大限補完する
set wrap " 行がターミナルに収まらなくなった時に折り返して表示する
set whichwrap=b,s,h,l,<,>,~,[,] " 左右のカーソル移動で行移動できるように(行末⇆行頭)
set display=lastline " 長い行を全て表示するようにする
set incsearch " インクリメンタルサーチ
set hlsearch " 検索結果をハイライト
set ignorecase " 大文字小文字を無視
set smartcase " ignorecaseと合わせることで，小文字入力の時のみ大文字小文字を無視
set wrapscan " 検索がファイル末尾まで行くとファイル先頭から検索するようにする
set gdefault " 置換の時 g オプションをデフォルトで有効にする
set splitright " 新しいファイルは右に開く
set splitbelow " 新しいファイルは下に開く
set list " 不可視文字を表示する
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:% " 不可視文字を可視化するリスト
set showcmd " 入力時のコマンドを表示する
set backspace=indent,eol,start " ノーマルモードでバックスペースを使えるようにする
set nrformats= " 数を10進数として扱うようにする（デフォルトは8進数）
set pumheight=10 " 補完の候補で一度に表示する数
set showmatch " 対応する括弧を強調表示
set matchtime=1 " 対応括弧の表示秒数
set hidden " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set ttyfast " 高速ターミナル接続
set lazyredraw " 不要な再描画をしない
set nobackup " バックアップファイルを作成しない
set nowritebackup " バックアップファイルを作成しない
set backupdir=$HOME/.vim/backup " バックアップファイルが作成されるディレクトリ
set noundofile " undoファイルを作成しない
set undodir=$HOME/.vim/backup " undoファイルが作成されるディレクトリ
set noswapfile " スワップファイルを作成しない
set directory=$HOME/.vim/backup " スワップファイルが作成されるディレクトリ
colorscheme iceberg
" ビジュアルモードでインデントしてビジュアルモードを抜けないようにする
vnoremap < <gv
vnoremap > >gv
"End basic settings--------------------------
