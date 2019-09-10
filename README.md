# Ming's dotfiles
Organized into a nice little tidbit of here and there scripts

## Instalation on bash
```
cd ~
git clone https://github.com/minghz/dotfiles.git
mv .bashrc .bashrc.bk # backing up your existing bashrc
ln -s dotfiles/.bashrc .
```

## Instalation on zsh
```
cd ~
git clone https://github.com/minghz/dotfiles.git
mv .zshrc .zshrc.bk # backing up your existing zshrc
ln -s dotfiles/.zshrc .
```

## Instalation on .oh-my-zsh
```
cd ~
git clone https://github.com/minghz/dotfiles.git
cd ~/.oh-my-zsh/custom/
ln -s ~/dotfiles/.zshrc custom_zshrc.zsh
```
