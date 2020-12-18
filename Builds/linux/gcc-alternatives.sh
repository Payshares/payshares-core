#!/usr/bin/env sh

# Remove all existing alternatives
sudo update-alternatives --remove-all gcc

# exit on first error
set -e

# To install gcc toolchain versions 5/6/7.
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt update 
sudo apt install -y gcc-5 g++-5 gfortran-5 cpp-5
sudo apt install -y gcc-6 g++-6 gfortran-6 cpp-6
sudo apt install -y gcc-7 g++-7 gfortran-7 cpp-7

# GCC 7.x
sudo update-alternatives \
      --install /usr/bin/gcc   gcc   /usr/bin/gcc-7     30 \
      --slave   /usr/bin/g++ g++ /usr/bin/g++-7  \
      --slave   /usr/bin/cpp cpp /usr/bin/cpp-7  \
      --slave   /usr/bin/gfortran gfortran /usr/bin/gfortran-7  \
      --slave   /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-7  \
      --slave   /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-7  \
      --slave   /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-7  \
      --slave   /usr/bin/gcov gcov /usr/bin/gcov-7  \
      --slave   /usr/bin/gcov-dump gcov-dump /usr/bin/gcov-dump-7  \
      --slave   /usr/bin/gcov-tool gcov-tool /usr/bin/gcov-tool-7

# GCC 6.x
sudo update-alternatives \
      --install /usr/bin/gcc   gcc   /usr/bin/gcc-6     20 \
      --slave   /usr/bin/g++ g++ /usr/bin/g++-6  \
      --slave   /usr/bin/cpp cpp /usr/bin/cpp-6  \
      --slave   /usr/bin/gfortran gfortran /usr/bin/gfortran-6  \
      --slave   /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-6  \
      --slave   /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-6  \
      --slave   /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-6  \
      --slave   /usr/bin/gcov gcov /usr/bin/gcov-6  \
      --slave   /usr/bin/gcov-dump gcov-dump /usr/bin/gcov-dump-6  \
      --slave   /usr/bin/gcov-tool gcov-tool /usr/bin/gcov-tool-6

# GCC 5.x
sudo update-alternatives \
      --install /usr/bin/gcc   gcc   /usr/bin/gcc-5     10 \
      --slave   /usr/bin/g++ g++ /usr/bin/g++-5  \
      --slave   /usr/bin/cpp cpp /usr/bin/cpp-5  \
      --slave   /usr/bin/gfortran gfortran /usr/bin/gfortran-5  \
      --slave   /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-5  \
      --slave   /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-5  \
      --slave   /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-5  \
      --slave   /usr/bin/gcov gcov /usr/bin/gcov-5  \
      --slave   /usr/bin/gcov-dump gcov-dump /usr/bin/gcov-dump-5  \
      --slave   /usr/bin/gcov-tool gcov-tool /usr/bin/gcov-tool-5
