#!/usr/bin/env bash
PWD=$(pwd)
export HOME

# bundler
ln -sf $PWD/.gemrc $HOME/.gemrc

# git
ln -sf $PWD/.gitconfig $HOME/.gitconfig
ln -sf $PWD/.gitignore_global $HOME/.gitignore_global

# jshint
ln -sf $PWD/.jshintrc $HOME/.jshintrc

# vim
ln -sf $PWD/.vimrc $HOME/.vimrc
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir -p $HOME/.vim/bundle
cd $HOME/.vim/bundle && git clone git://github.com/altercation/vim-colors-solarized.git

# fish
mkdir -p ~/.config/fish
ln -sf $PWD/config.fish $HOME/.config/fish/config.fish 
