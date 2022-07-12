
#!/bin/bash

CMAKE_VERSION=3.23.0
CMAKE_ROOT=/root/program/cmake-${CMAKE_VERSION}
mkdir -p ${CMAKE_ROOT}
cd ${CMAKE_ROOT}

wget https://ghproxy.com/https://github.com/Kitware/CMake/releases/download/v$CMAKE_VERSION/cmake-$CMAKE_VERSION-Linux-x86_64.sh
chmod +x ./cmake-$CMAKE_VERSION-Linux-x86_64.sh
./cmake-$CMAKE_VERSION-Linux-x86_64.sh --skip-license > /dev/null
update-alternatives --install /usr/bin/cmake cmake $(pwd)/bin/cmake 1000 --force

cd -
