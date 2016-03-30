sudo yum install -y vim
sudo yum install -y gcc-c++
sudo yum install -y gdb
sudo yum install -y clang
sudo yum install -y lynx

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

ln -sf ~/dotfile/bashrc ~/.bashrc
ln -sf ~/dotfile/vimrc ~/.vimrc
