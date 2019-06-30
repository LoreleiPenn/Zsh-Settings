#!/bin/sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ZHOME='~/.zsh'
if [ ! -d $ZHOME ]; then
    mkdir $ZHOME
fi
rm ~/.zshrc
cd $ZHOME
git clone https://github.com/LoreleiLVNH/Zsh-Settings.git .
cd $HOME
echo "Linking $ZHOME/zshrc -> ~/.zshrc"
ln $ZHOME/zshrc ~/.zshrc
echo "Linking (symlink) $ZHOME/zkdb -> ~/.zkbd"
ln -s $ZHOME/zkbd ~/.zkbd


