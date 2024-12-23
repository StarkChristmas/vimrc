#!/bin/bash

cd
git clone https://github.com/StarkChristmas/vimrc
cd

if [ -e oldvim ]
then
	rm -Rf oldvim
fi

if [ -e .vim ]
then
	#if .vim exist, check if .vimrc exists
	if [ -e .vimrc ]
	#if both exist, create a dir and move both
	then
		mkdir -p oldvim
		mv .vim oldvim/.vim
		mv .vimrc oldvim/.vimrc
	#if only .vim exists
	else
		mkdir -p oldvim
		mv .vim oldvim/.vim
	fi
else
	#if only .vimrc exists
	if [ -e .vimrc ]
	then
		mkdir -p oldvim
		mv .vimrc oldvim/.vimrc
	fi
fi

cd
cd vimrc1
mv -f .vimrc ..
cd
rm -Rf vimrc
mkdir -p .vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo '\n' | vim +PluginInstall +qall
