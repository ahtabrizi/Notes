# Vim Stuff 

## Install Vim full features + lua support 
**TODO** : call it within `linux_dep.sh`
```shell
sh install_vim.sh
```

## Install dependencies
### YCM (YouCompleteMe)

couldn't install clang 9 --> broken packages


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
