apt-get update -y # Update the list of packages
apt-get remove -y x264 libx264-dev # Remove the older version of libx264-dev and x264

apt-get install -y build-essential checkinstall cmake pkg-config yasm
apt-get install -y git gfortran
add-apt-repository -y "deb http://security.ubuntu.com/ubuntu xenial-security main"
apt-get install -y libjpeg8-dev libjasper-dev libpng12-dev
apt-get install -y libtiff5-dev
apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
apt-get install -y libxine2-dev libv4l-dev
apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
apt-get install -y qt5-default libgtk2.0-dev libtbb-dev

apt-get install -y libatlas-base-dev
apt-get install -y libfaac-dev libmp3lame-dev libtheora-dev
apt-get install -y libvorbis-dev libxvidcore-dev
apt-get install -y libopencore-amrnb-dev libopencore-amrwb-dev
apt-get install -y x264 v4l-utils
apt-get install -y libprotobuf-dev protobuf-compiler
apt-get install -y libgoogle-glog-dev libgflags-dev
apt-get install -y libgphoto2-dev libeigen3-dev libhdf5-dev doxygen



# python 
apt-get install -y python-dev python-pip python3-dev python3-pip
sudo -H pip2 install -U pip numpy scipy matplotlib scikit-image scikit-learn ipython
sudo -H pip3 install -U pip numpy scipy matplotlib scikit-image scikit-learn ipython
