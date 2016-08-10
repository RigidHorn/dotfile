sudo yum -y install vim
sudo yum -y install gcc-c++
sudo yum -y install gdb
sudo yum -y install clang
sudo yum -y install tmux
sudo yum -y install lynx

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

ln -sf ~/dotfile/bashrc ~/.bashrc
ln -sf ~/dotfile/vimrc ~/.vimrc
