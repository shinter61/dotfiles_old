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
