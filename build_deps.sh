#!/bin/bash

set -x

install_deps_ubuntu() {
	sudo apt update

	# Dependencies for Geant4 & ROOT
	sudo apt install -y libx11-dev libxpm-dev libxft-dev libxext-dev cmake libpng-dev libjpeg-dev qtbase5-dev libxmu-dev libmotif-dev cmake

	sudo apt install -y git dpkg-dev cmake g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev
	sudo apt install -y gfortran libssl-dev libpcre3-dev xlibmesa-glu-dev libglew1.5-dev libftgl-dev libmysqlclient-dev libfftw3-dev libcfitsio-dev \
		graphviz-dev libavahi-compat-libdnssd-dev libldap2-dev python-dev libxml2-dev libkrb5-dev libgsl0-dev libqt4-dev libxerces-c-dev
}

install_deps_centos() {
        sudo yum update
        # GCC 7
        sudo yum -y install centos-release-scl
        sudo yum -y install devtoolset-7-gcc* devtoolset-7-gcc-c++
        #scl enable devtoolset-7 bash
        source /opt/rh/devtoolset-7/enable
        # dependencies for Geant4 & Root
        sudo yum -y install git cmake3 binutils libX11-devel libXpm-devel libXft-devel libXext-devel wget \
        gcc-gfortran openssl-devel pcre-devel \
        mesa-libGL-devel mesa-libGLU-devel glew-devel ftgl-devel mysql-devel \
        fftw-devel cfitsio-devel graphviz-devel \
        avahi-compat-libdns_sd-devel libldap-dev python-devel \
        libxml2-devel gsl-static xerces-c-devel motif-devel libpng-devel qt5-qtbase-devel
}

if [ -n "$(uname -a | grep Ubuntu)" ]; then
        install_deps_ubuntu
else
        install_deps_centos
        sudo ln -s /usr/bin/cmake3 /usr/bin/cmake
fi
# Eigen
wget -O eigen.tar.gz http://bitbucket.org/eigen/eigen/get/3.3.7.tar.gz
tar zvxf eigen.tar.gz
cd eigen-eigen-323c052e1731
mkdir build_release
cd build_release
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j $(($(nproc)+1))
sudo make install
cd
# Root
wget -O root.tar.gz https://root.cern/download/root_v6.16.00.source.tar.gz
tar zvxf root.tar.gz
cd root-6.08.06
mkdir build_release
cd build_release
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j $(($(nproc)+1))
sudo make install
cd

# Geant4
wget -O geant4.tar.gz http://cern.ch/geant4-data/releases/geant4.10.05.p01.tar.gz
tar zvxf geant4.tar.gz
cd geant4.10.05.p01
mkdir build_release
cd build_release
cmake -DGEANT4_INSTALL_DATA=ON -DGEANT4_USE_GDML=ON  -DGEANT4_USE_QT=ON  -DGEANT4_USE_XM=ON -DGEANT4_USE_OPENGL_X11=ON  -DGEANT4_USE_SYSTEM_CLHEP=OFF \
  -DGEANT4_BUILD_MULTITHREADED=ON -DGEANT4_BUILD_TLS_MODEL=global-dynamic -DCMAKE_BUILD_TYPE=Release ..
make -j $(($(nproc)+1))
sudo make install
cd

