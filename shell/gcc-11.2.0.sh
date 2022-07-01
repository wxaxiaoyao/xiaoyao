
#!/bin/bash

PROGRAM_ROOT_DIRECTORY=/root/program
mkdir -p ${PROGRAM_ROOT_DIRECTORY}
SOURCE_DIR=${PROGRAM_ROOT_DIRECTORY}
LIB_VERSION=11.2.0
LIB_NAME=gcc-${LIB_VERSION}
LIB_SRC_TAR_GZ=${SOURCE_DIR}/${LIB_NAME}.tar.gz
LIB_SRC_DIR=${SOURCE_DIR}/${LIB_NAME}
# 安装目录不存在则进行安装
if [ ! -d ${LIB_SRC_DIR} ]; then
	if [ -f ${LIB_SRC_TAR_GZ} ]; then
		tar -vxf ${LIB_SRC_TAR_GZ} -C ${SOURCE_DIR}
	else
		https://mirrors.aliyun.com/gnu/gcc/${LIB_NAME}/${LIB_NAME}.tar.gz -O ${LIB_SRC_TAR_GZ}
		tar -vxf ${LIB_SRC_TAR_GZ} -C ${SOURCE_DIR}
	fi
fi

cd ${LIB_SRC_DIR}
./contrib/download_prerequisites
mkdir build && cd build && ../configure --disable-multilib
make
make install

#cat >> ~/.profile <<EOF
## gcc-11.2.0 config
#export CC=/usr/local/bin/gcc
#export CXX=/usr/local/bin/g++
#export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH
#EOF

