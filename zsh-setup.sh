#!/bin/sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"
sleep 1s

echo "Installing my setup..."
ZHOME=${HOME}/.zsh
if [ ! -d $ZHOME ]; then
    mkdir $ZHOME
fi
rm ~/.zshrc
cd $ZHOME
git clone https://github.com/LoreleiLVNH/Zsh-Settings.git .
cd $HOME
echo "Linking $ZHOME/zshrc -> ~/.zshrc"
ln ${ZHOME}/zshrc ~/.zshrc
echo "Linking (symlink) $ZHOME/zkdb -> ~/.zkbd"
ln -s ${ZHOME}/zkbd ~/.zkbd

echo "Installing Zplug..."
[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug

echo "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

PECO_URL='https://github.com/peco/peco/releases/download'
PECO_VER='v0.5.3'
PECO_ARQ=$([ "x86_64" == `uname -m` ] && echo 'amd64' || echo '386')
PECO_PKG=peco_linux_${PECO_ARQ}.tar.gz
PECO_DWL=${PECO_URL}/${PECO_VER}/${PECO_PKG}
PECO_DIR=$HOME/.zplug/repos/peco/peco
echo "Installing PECO (${PECO_VER})..."
[ ! -d $PECO_DIR ] && mkdir -p $PECO_DIR
curl -fsSL ${PECO_DWL} |tar -C $PECO_DIR -zxf - peco_linux_${PECO_ARQ}/peco --strip-components 1

echo "Setup finished. Run Zsh to finish installing everything else."
echo "You can now register Zsh with chsh to make it your default shell."
