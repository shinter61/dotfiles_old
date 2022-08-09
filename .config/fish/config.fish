alias vi="nvim"

# fish-ghqの設定
# https://github.com/decors/fish-ghq
set GHQ_SELECTOR fzf

# jethrokuan/fzfの設定
# https://github.com/jethrokuan/fzf
set -U FZF_LEGACY_KEYBINDINGS 0

# ghq + fzf
# https://public-constructor.com/fish-ghq
function ghq_fzf_repo -d 'Repository search'
  ghq list --full-path | fzf --reverse --height=100% | read select
  [ -n "$select" ]; and cd "$select"
  echo " $select "
  commandline -f repaint
end

function fish_user_key_bindings
  bind \cg ghq_fzf_repo
end

# docuiの設定
# https://github.com/skanehira/docui
set LC_CTYPE en_US.UTF-8
set TERM xterm-256color

# anyenvの設定
# https://github.com/anyenv/anyenv
set -x PATH $HOME/.anyenv/bin $PATH
status --is-interactive; and source (anyenv init -|psub)

# android studioの設定
# set -x ANDROID_HOME $HOME/Library/Android/sdk
# set -x PATH $PATH:$ANDROID_HOME/emulator
# set -x PATH $PATH:$ANDROID_HOME/tools
# set -x PATH $PATH:$ANDROID_HOME/tools/bin
# set -x PATH $PATH:$ANDROID_HOME/platform-tools
# set -x PATH $PATH:/Applications/"Android Studio.app"/Contents/jre/jdk/Contents/Home/bin
# set -x JAVA_HOME /Applications/"Android Studio.app"/Contents/jre/jdk/Contents/Home

# pyenvの設定
pyenv init - | source

# GOPATHの設定
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/shinter-pres/.pyenv/versions/anaconda3-2020.11/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# Atcoder-Libraryの設定
set -x CPLUS_INCLUDE_PATH ~/Custom/competitive/
