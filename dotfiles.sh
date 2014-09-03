#!/bin/sh

targets=".vimrc .tmux.conf"

for target in ${targets}; do
	echo ${target}
	cp ~/${target} ./
done

