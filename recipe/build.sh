#!/usr/bin/env bash
mkdir build
# git checkout concat # temporary testing
cd build
# export LIBHDFS3_HOME=`pwd`
if [[ "$OSTYPE" == "darwin"* ]]; then
    ../libhdfs3/bootstrap --prefix=$PREFIX --dependency=$PREFIX --enable-libc++
else
    ../libhdfs3/bootstrap --prefix=$PREFIX --dependency=$PREFIX 
fi
make
make install
rm $PREFIX/lib/libhdfs3.a  # don't need static
