# Vim Stuff 

## Install Vim full features + lua support 
**TODO** : call it within `linux_dep.sh`
```shell
sh install_vim.sh
```

## Install dependencies
**TODO** automate the followings and `vimrc` copying
### YCM (YouCompleteMe)

* Add `Plugin 'ycm-core/YouCompleteMe'` to `.vimrc` and install it
* Download clang binaries from `Pre built binaries` section of [LLVM Download Page](http://llvm.org/releases/download.html) manually
* Make the download directory:
```shell
mkdir -p ~/.vim/bundle/YouCompleteMe/third_party/ycmd/clang_archives
```  
* copy the downloaded file as it is into that directory
* compile you complete me 
```shell
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer -all 
```

### color_coded
For syntax highlighting.
After installing using Plugin manager, to compule the reset :
```shell 
cd ~/.vim/bundle/color_coded
rm -f CMakeCache.txt
mkdir build && cd build
cmake ..
make && make install # Compiling with GCC is preferred, ironically
# Clang works on OS X, but has mixed success on Linux and the BSDs

# Cleanup afterward; frees several hundred megabytes
make clean && make clean_clang
```
