#!/usr/bin/env bash
set -e

cwd=$(pwd)
export HOME

HANDLE=${1}
if [ -z "${HANDLE}" ]; then
  echo "copying files for the dummy user"
  echo "you should create your own"
  HANDLE="dummy"
fi

if [ -z "${HANDLE}" ]; then
  echo "no '${HANDLE}' directory found"
  exit 1
fi

hwd=${cwd}/${HANDLE}

omd_bashrc() {
  rm -f .bashrc_omd
  touch .bashrc_omd
  for file in ${HANDLE}/shell-addins/all/*.partial; do
    cat $file >> .bashrc_omd
  done
  for file in ${HANDLE}/shell-addins/bash/*.partial; do
    cat $file >> .bashrc_omd
  done

  ln -sf $hwd/.bashrc_omd $HOME/.bashrc_omd
  if ! grep -qe "^. ~/.bashrc_omd$" "$HOME/.bashrc"; then
    echo ". ~/.bashrc_omd" >> $HOME/.bashrc
  fi
}

omd_fishconfig() {
  mkdir -p .config/fish/
  rm -f .config/fish/config.fish
  touch .config/fish/config.fish
  for file in ${HANDLE}/shell-addins/all/*.partial; do
    cat $file >> .config/fish/config.fish
  done
  for file in ${HANDLE}/shell-addins/fish/*.partial; do
    cat $file >> .config/fish/config.fish
  done
}

omd_link() {
  OMD_FILE="${1}"

  if [ -f "$HOME/${OMD_FILE}" ] && [ ! -h "$HOME/${OMD_FILE}" ]; then
    mkdir -p ${HANDLE}/$(dirname ${OMD_FILE})
    mv $HOME/${OMD_FILE} ${HANDLE}/${OMD_FILE}.$(date '+%F')
  fi

  if [ -f "$HOME/${OMD_FILE}" ]; then
    mkdir -p $HOME/$(dirname ${OMD_FILE})
  fi

  ln -sf $hwd/${OMD_FILE} $HOME/${OMD_FILE}
}

omd_git() {
  REPOSITORY=$1
  DIRECTORY=$2

  if [ ! -d "$DIRECTORY" ]; then
    git clone $REPOSITORY $DIRECTORY >/dev/null
  else
    pushd $DIRECTORY
    git fetch >/dev/null && git pull >/dev/null
    popd
  fi
}

omd_vim() {
  mkdir -p $HOME/.vim/autoload
  curl -LSs https://tpo.pe/pathogen.vim -o                    $HOME/.vim/autoload/pathogen.vim 

  mkdir -p $HOME/.vim/bundle
  omd_git https://github.com/altercation/vim-colors-solarized $HOME/.vim/bundle/vim-colors-solarized
  omd_git https://github.com/kien/ctrlp.vim                   $HOME/.vim/bundle/ctrlp.vim
  omd_git https://github.com/Lokaltog/vim-easymotion          $HOME/.vim/bundle/vim-easymotion
  omd_git https://github.com/slim-template/vim-slim           $HOME/.vim/bundle/vim-slim
  omd_git https://github.com/scrooloose/syntastic.git         $HOME/.vim/bundle/syntastic
}

omd_link '.jshintrc'
omd_link '.gemrc'
omd_link '.gitconfig'
omd_link '.gitconfig_global'
omd_link '.vimrc'
omd_vim

# bash
omd_bashrc
omd_link '.bashrc_omd'

# fish
omd_fishconfig
omd_link '.config/fish/config.fish'
