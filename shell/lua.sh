

#!/bin/bash

export LIB_ROOT_DIR=/root/program
export INSTALL_DIR=${LIB_ROOT_DIR}
export SOURCE_DIR=${LIB_ROOT_DIR}
export BUILD_DIR=${LIB_ROOT_DIR}

LIB_VERSION=5.4.4
LIB_NAME=lua-${LIB_VERSION}
LIB_SRC_TAR_GZ=${SOURCE_DIR}/${LIB_NAME}.tar.gz 
LIB_SRC_DIR=${SOURCE_DIR}/${LIB_NAME}
LIB_BUILD_DIR=${BUILD_DIR}/${LIB_NAME}
LIB_INSTALL_DIR=${INSTALL_DIR}/${LIB_NAME}/install

# 安装目录不存在则进行安装
if [ ! -d ${LIB_INSTALL_DIR} ]; then
    if [ ! -d ${LIB_SRC_DIR} ]; then
        if [ -f ${LIB_SRC_TAR_GZ} ]; then
            tar -vxf ${LIB_SRC_TAR_GZ} -C ${SOURCE_DIR}
        else
            wget http://www.lua.org/ftp/${LIB_NAME}.tar.gz -O ${LIB_SRC_TAR_GZ}
            tar -vxf ${LIB_SRC_TAR_GZ} -C ${SOURCE_DIR}
        fi
    fi

    cd ${LIB_SRC_DIR}

	make clean
    make 
    make local 
    cd -
fi

