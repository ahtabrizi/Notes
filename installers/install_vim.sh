# Installing vim full features + lua support from source
# from https://gist.github.com/techgaun/2fe3dd3d004d7320a68d

echo "Installing VIM"

sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common
sudo apt-get build-dep vim-gnome
sudo apt-get install build-essential liblua5.3-0 liblua5.3-dev python-dev ruby-dev libperl-dev libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev
sudo rm -rf /usr/local/share/vim /usr/bin/vim /usr/local/bin/vim
sudo mkdir /usr/include/lua5.3/{include,lib}
sudo cp /usr/include/lua5.3/*.h /usr/include/lua5.3/include/
sudo ln -sf /usr/lib/x86_64-linux-gnu/liblua5.3.so /usr/include/lua5.3/lib/liblua.so
sudo ln -sf /usr/lib/x86_64-linux-gnu/liblua5.3.a /usr/include/lua5.3/lib/liblua.a

#install powerline fonts
sudo apt-get install fonts-powerline

cd /tmp
git clone https://github.com/vim/vim.git
cd vim
make distclean

./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-largefile \
            --disable-netbeans \
            --enable-python3interp \
            --with-python-config-dir=$(python3-config --configdir) \
						--enable-pythoninterp \
						--with-python-config-dir=$(python-config --configdir) \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=auto \
            --enable-fail-if-missing \
            --with-lua-prefix=/usr/include/lua5.3 \
            --enable-cscope \
            --enable-multibyte

make
sudo make install


# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

