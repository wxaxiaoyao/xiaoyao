

#!/bin/bash

apt install unzip

export LIB_ROOT_DIR=/root/program
export INSTALL_DIR=${LIB_ROOT_DIR}
export SOURCE_DIR=${LIB_ROOT_DIR}
export BUILD_DIR=${LIB_ROOT_DIR}

LIB_VERSION=3.9.0
LIB_NAME=luarocks-${LIB_VERSION}
LIB_SRC_TAR_GZ=${SOURCE_DIR}/${LIB_NAME}.tar.gz 
LIB_SRC_DIR=${SOURCE_DIR}/${LIB_NAME}
LIB_BUILD_DIR=${BUILD_DIR}/${LIB_NAME}
LIB_INSTALL_DIR=${INSTALL_DIR}/${LIB_NAME}/install


LUA_ROOT=${LIB_ROOT_DIR}/lua-5.4.4/install

# 安装目录不存在则进行安装
if [ ! -d ${LIB_INSTALL_DIR} ]; then
    if [ ! -d ${LIB_SRC_DIR} ]; then
        if [ -f ${LIB_SRC_TAR_GZ} ]; then
            tar -vxf ${LIB_SRC_TAR_GZ} -C ${SOURCE_DIR}
        else
            wget  https://luarocks.org/releases/${LIB_NAME}.tar.gz -O ${LIB_SRC_TAR_GZ}
            tar -vxf ${LIB_SRC_TAR_GZ} -C ${SOURCE_DIR}
        fi
    fi

    cd ${LIB_SRC_DIR}

	./configure --with-lua=${LUA_ROOT}
	make 
	make install
	cd -
fi

