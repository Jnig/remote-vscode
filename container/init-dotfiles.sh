#!/bin/bash
cd /root
git clone https://github.com/Jnig/.dotfiles.git --depth 1
ln -s .dotfiles/zshrc .zshrc
ln -s .dotfiles/p10k.zsh .p10k.zsh
chsh -s /usr/bin/zsh root
zsh
