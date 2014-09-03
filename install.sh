#!/bin/sh

now=`date +"%Y%m%d_%H%M%S"`
path="./backup${now}"

mkdir -p $path

targets=".vimrc .tmux.conf"
for target in ${targets}; do
	echo $target
	cp ~/${target} ${path}
	cp ${target} ~/
done	
#echo $path
#cp ~/.vimrc $path 
#cp ~/.tmux.conf $path
#
#cp .vimrc ~/
#cp .tmux.conf ~/

