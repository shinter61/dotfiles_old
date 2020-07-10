#!/bin/bash

set -u
DOT_DIRECTORY="${HOME}/ghq/github.com/shinter-pres/dotfiles"

echo "link home directory dotfiles"
cd ${DOT_DIRECTORY}
for f in .??*
do
    #無視したいファイルやディレクトリ
    [ "$f" = ".git" ] && continue
    echo ${f}
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

echo "linked dotfiles complete!"
