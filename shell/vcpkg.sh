
#!/bin/bash

VCPKG_ROOT=/root/program/vcpkg

apt-get install -y curl zip unzip tar

if [ ! -d ${VCPKG_ROOT} ]; then
	git clone https://github.com/microsoft/vcpkg.git ${VCPKG_ROOT}
fi

cd ${VCPKG_ROOT}

git pull 


source ~/.profile
if [ ! -x "$(command -v vcpkg)" ]; then
	./bootstrap-vcpkg.sh

	cat >> ~/.profile <<EOF
VCPKG_ROOT=${VCPKG_ROOT}
PATH=\${VCPKG_ROOT}:\$PATH
EOF

fi
