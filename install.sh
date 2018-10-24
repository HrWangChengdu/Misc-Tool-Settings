#!/bin/bash
cd ..
echo "Download Personal Vim Setting"
cp vim-whr/.vimrc ~/.vimrc
git clone https://github.com/HrWangChengdu/vim-whr.git

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

if command -v ctag &> /dev/null; then
    echo "Setup ctag"
    if command -v apt-get &> /dev/null; then
        sudo apt-get install ctags
    elif command -v yum &> /dev/null; then
        sudo yum install ctags
    fi
fi
