#!/usr/bin/env bash

sed -i '/std=/d' libhdfs3/CMake/Options.cmake

mkdir build
git checkout concat # temporary testing
cd build
# export LIBHDFS3_HOME=`pwd`
export CXXFLAGS="${CXXFLAGS} -std=c++17"
export LDFLAGS="${LDFLAGS} -labsl_log_internal_message"
if [[ "$OSTYPE" == "darwin"* ]]; then
    ../libhdfs3/bootstrap --prefix=$PREFIX --dependency=$PREFIX --enable-libc++
else
    ../libhdfs3/bootstrap --prefix=$PREFIX --dependency=$PREFIX 
fi
make
make install
rm $PREFIX/lib/libhdfs3.a  # don't need static
