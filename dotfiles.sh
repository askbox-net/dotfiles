#!/bin/sh

targets=".vimrc .tmux.conf .config/nvim/init.vim"

for target in ${targets}; do
	echo ${target}
	cp ~/${target} ./
done

