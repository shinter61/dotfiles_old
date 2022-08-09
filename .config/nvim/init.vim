call plug#begin('~/.config/nvim/plugged')

Plug 'cocopon/iceberg.vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
Plug 'qpkorr/vim-bufkill'
Plug 'cohama/lexima.vim'
Plug 'APZelos/blamer.nvim'
Plug 'mhinz/vim-signify'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme iceberg

" 引数なしでvimを開いたらNERDTreeを起動、
" 引数ありならNERDTreeは起動せず、引数で渡されたファイルを開く。
" autocmd vimenter * if !argc() | NERDTree | endif

" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 隠しファイルを表示
let g:NERDTreeShowHidden=1

" 非表示ファイル
let g:NERDTreeIgnore=['\.git$']

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
	\ '0': '0 ',
	\ '1': '1 ',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 '
	\}
let g:airline_theme = 'wombat'
let g:airline_powerline_fonts = 1
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

nnoremap <Space>e :NERDTreeFind<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number -g !node_modules/ --no-heading --color=always --smart-case'.shellescape(<q-args>), 1
  \   fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['-i']}, <bang>0)
nmap <Space>f :Files<CR>
nmap <Space>r :Rg<CR>
nmap <Space>g :Rg <C-r>=expand("<cword>")<CR><CR>

let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1

" ASCII ARTを真ん中寄せする
" :h startifyを参照
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

let g:startify_custom_header = s:filter_header([
        \'           __    _       __            ________',
        \'     _____/ /_  (_)___  / /____  _____/ ___<  /',
        \'    / ___/ __ \/ / __ \/ __/ _ \/ ___/ __ \/ / ',
        \'   (__  ) / / / / / / / /_/  __/ /  / /_/ / /  ',
        \'  /____/_/ /_/_/_/ /_/\__/\___/_/   \____/_/   ',
        \ ''
        \])
let g:startify_enable_special = 1
let g:startify_skiplist = [
        \ '^/tmp',
        \ '.tmp$',
        \ ]
let g:startify_update_oldfiles = 1

"Nerdtreeと同時に開く
autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                \ |   NERDTree
                \ |   wincmd w
                \ | endif

map <C-c> :BD<CR>

let g:coc_global_extensions = [
  'coc-tsserver',
  'coc-eslint8',
  'coc-prettier',
  'coc-json',
  'coc-solargraph'
]

nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! s:coc_typescript_settings() abort
  nnoremap <silent> <buffer> [dev]f :<C-u>CocCommand eslint.executeAutofix<CR>:CocCommand prettier.formatFile<CR>
endfunction

augroup coc_ts
  autocmd!
  autocmd! FileType typescript, typescriptreact call <SID>coc_typescript_settings()
augroup END

let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_show_in_visual_mode = 0
let g:blamer_show_in_insert_mode = 0
let g:blamer_date_format = '%y/%m/%d %H:%M'

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
