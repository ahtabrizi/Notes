# OpenCV Notes 

## Installation 
### Python - Easy Install 
```shell
sudo pip3 install opencv-python opencv-contrib-python
```
### Build from source( C++ and Python)
 - install the dependenies:
 ```shell
 sudo sh opencv_dep.sh
 ```
 - Download the zip files of `opencv` and matching version of `opencv-contrib` (they can be cloned from their github repo)
 - extract them 
 - make sure you have atleast 13Gb of free space (Don't worry after installation you can delete the files!)
 - create and go to a `build` directory inside opencv folder that you just extracted.
 ```shell
 mkdir build 
 cd build
 ```
 - Genreated files required for making using `cmake`  
 ```shell
  cmake -D CMAKE_BUILD_TYPE=RELEASE \
   -D INSTALL_C_EXAMPLES=ON \
   -D INSTALL_PYTHON_EXAMPLES=ON \
   -D WITH_TBB=ON \
   -D WITH_V4L=ON \
   -D WITH_QT=ON \
   -D WITH_OPENGL=ON \
   -D CMAKE_INSTALL_PREFIX=/usr/local \
   -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.1.1/modules/ \
   -D BUILD_EXAMPLES=ON \
   -D OPENCV_GENERATE_PKGCONFIG=YES \
   -D OPENCV_ENABLE_NONFREE=ON ..
 ```
 change the opencv_contrib version according to your version(actually it is the name of the extracted folder of `opencv-contrib`)
 
 If installing to virtual env of python add following flags:
 ```shell
 -D python_executable=~/venvs-py3/cv/bin/python3 
 -D opencv_python3_install_path=~/venvs-py3/cv/lib/python3.5/site-packages/ 
 ```
 where `venvs-py3` is where your venvs live and `cv` is your venv's name
 - build opencv with all cores your cpu has (mine has 8):
 ```shell
 make -j8
 ```
 - Install the library
 ```shell
  sudo make install
  sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
  sudo ldconfig
 ```
 - Modify `opnecv4.pc` -- this is only required for opencv version 4 to be able to compile opencv with your c++ programs
 ```shell 
  cd ~/Desktop/opencv/build/unix-install/
  vi opencv4.pc
 ```
 - change the line `includedir_old=${prefix}/include/opencv4/opencv` to `includedir_old=${prefix}/include/opencv4/opencv2`.
 - copy the modified file to `/usr/local/lib/pkgconfig/`
 ```shell
 sudo cp opencv4.pc /usr/local/lib/pkgconfig/
 ```
 - Add the location to the variable PKG_CONFIG_PATH by editing the .bashrc file.
 ```shell
# Open .bashrc file
sudo vi ~/.bashrc
 
 # Copy the following lines at the end of .bashrc file.
 PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
 export PKG_CONFIG_PATH
 ```
 - save and exit the `.bashrc` and open a new terminal or run:
 ```shell
 source ~/.bashrc
  
  # You can verify that the path is added or not by executing the following command
  echo $PKG_CONFIG_PATH
 ```


That's it!!!!!

## Compile C++ files with opencv dependencies
put the following code in `test.cc`
```c++
#include "opencv.hpp"

using namespace cv;
using namespace std;

int main( int argc, char** argv )
{
  cout << "OpenCV version : " << CV_VERSION << endl;
  cout << "Major version : " << CV_MAJOR_VERSION << endl;
  cout << "Minor version : " << CV_MINOR_VERSION << endl;
  cout << "Subminor version : " << CV_SUBMINOR_VERSION << endl;
}
```
then run the compilation process using `pkg-config --libs --cflags opencv4`:
```shell
#Compile the program to generate the executable file
g++ -std=c++11 test.cpp `pkg-config --libs --cflags opencv4` -o result
 
#Execute the program.
./result
```
