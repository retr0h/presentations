#!/usr/bin/env bash

for dir in $(ls -d ~/git/dotfiles/*/); do
	program=$(basename ${dir})
	echo $program
	stow -d ~/git/dotfiles -t ~/ ${program}
done
