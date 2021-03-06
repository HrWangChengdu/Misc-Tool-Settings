#!/bin/bash
cd ..
echo "Download Personal Vim Setting"
git clone https://github.com/HrWangChengdu/vim-whr.git
cp vim-whr/.vimrc ~/.vimrc

echo "Download Vim Bundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Copy Vim Color Schemes"
mkdir -p ~/.vim/colors
cp -r vim-whr/colors/* ~/.vim/colors/

echo "Install Plugin"
vim +PluginInstall +qall

cd Misc-Tool-Settings
cp .tmux.conf ~/

echo "Setup Github Username & Email"
git config --global user.name "hrwangchengdu"
git config --global user.email "hrwangchengdu@hotmail.com"

if command -v apt-get &> /dev/null; then
    pkg_installer=apt-get
elif command -v yum &> /dev/null; then
    pkg_installer=yum
fi

sudo $pkg_installer update
if ! command -v ctags &> /dev/null; then
    echo "Install ctag"
    sudo $pkg_installer install -y ctags
fi

if ! command -v tmux &> /dev/null; then
    echo "Install tmux"
    sudo $pkg_installer install -y tmux
fi
