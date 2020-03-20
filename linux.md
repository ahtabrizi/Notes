# Linux Notes

## Install dependencies for linux
```shell
sudo sh linux_dep.sh
```

## Git
when the local folder changes directory, 
this command prevents git to count it as a chage in file.
(Due to files changed privilages???)

```shell
git config core.filemode false
```

## Windows Partition FIX
```shell
sudo ntfsfix /dev/sdaX
```

## Install openssl
Below are the instructions to follow:

- Open a terminal (Ctrl+Alt+t).
- Fetch the tarball: wget https://www.openssl.org/source/openssl-1.1.1a.tar.gz
- Unpack the tarball with tar -zxf openssl-1.1.1a.tar.gz && cd openssl-1.1.1a
- Issue the command ./config.
- Issue the command make (You may need to run sudo apt install make gcc before running this command successfully).
- Run make test to check for possible errors.
- Backup current openssl binary: sudo mv /usr/bin/openssl ~/tmp
- Issue the command sudo make install.
- Create symbolic link from newly install binary to the default location:
   	sudo ln -s /usr/local/bin/openssl /usr/bin/openssl
- Run the command sudo ldconfig to update symlinks and rebuild the library cache.

## Qt
Make Qt and it's dependencies, need to do this before make:

- git clone https://address (NOTE: only the https link is working)d
- cd folder
- git checkout v5.13.0 or git chceckout origin/5.13.0
- add the library to LD: export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/ali/Qt5.13.0/5.13.0/gcc_64/lib 
- use Qt's own qmake : ~/Qt5.13.0/5.13.0/gcc_64/bin/qmake
- make
- make install
- sudo ldconfig
----------------------------
to install qtivi: (source: https://github.com/ivovandongen/qtivi-test  +++ https://github.com/tomoyuki-nakabayashi/QtIviPlayground/issues/1)

* Build and install dlt-daemon
- clone repo from https://github.com/GENIVI/dlt-daemon
- Install according to: https://github.com/GENIVI/dlt-daemon/blob/master/INSTALL
* Build and install qt-ivi
- clone repo from: git clone --recursive https://github.com/qt/qtivi.git  (recursive part is important)
- Build and install mkdir build && cd build && qmake .. && make install
