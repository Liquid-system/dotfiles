#!/bin/sh

# pedagdbのインスト―ル
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit

dotfiles_root=$(cd $(dirname $0)/.. && pwd)

# dotfilesディレクトリの中身のリンクをホームディレクトリ直下に作成
cd ${dotfiles_root}/dotfiles
for file in .*; do
    ln -s ${PWD}/${file} ${HOME}
done
