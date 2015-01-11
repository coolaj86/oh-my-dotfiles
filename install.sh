#!/usr/bin/env bash
cwd=$(pwd)
export HOME

# bundler
ln -sf $cwd/.gemrc $HOME/.gemrc

# git
ln -sf $cwd/.gitconfig $HOME/.gitconfig
ln -sf $cwd/.gitignore_global $HOME/.gitignore_global

# vim
ln -sf $cwd/.vimrc $HOME/.vimrc
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir -p $HOME/.vim/bundle
./git.sh git://github.com/altercation/vim-colors-solarized.git $HOME/.vim/bundle/vim-colors-solarized
./git.sh https://github.com/kien/ctrlp.vim.git $HOME/.vim/bundle/ctrlp.vim

# fish
mkdir -p $HOME/.config/fish
ln -sf $cwd/config.fish $HOME/.config/fish/config.fish 
