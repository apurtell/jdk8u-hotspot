#!/bin/bash
set -ex
export LANG=C
unset JAVA_HOME
unset CLASSPATH
unset LD_LIBRARY_PATH
configopts="$configopts --enable-unlimited-crypto"
configopts="$configopts --with-boot-jdk=/usr/java/jdk1.8.0_45"
configopts="$configopts --with-update-version=00"
configopts="$configopts --with-build-number=b14"
configopts="$configopts --with-user-release-suffix=apurtell"
configopts="$configopts --with-milestone=fcs"
#configopts="$configopts --disable-debug-symbols"
#configopts="$configopts --enable-debug"
rm -f build.log
bash ./configure $configopts | tee -a build.log 2>&1
make clean $makeopts $@ | tee -a build.log 2>&1
make all $makeopts $@ | tee -a build.log 2>&1
