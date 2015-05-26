#!/usr/bin/env bash

if [ -d build ]; then
  rm -rf build;
fi

mkdir build
cd build

export CC=clang
export CXX=clang++
export LINK=clang++

export LDFLAGS="-L/usr/local/llvm33/lib -lkvm"
#export LDFLAGS="-lexecinfo -lkvm"
#export CXXFLAGS="-lexecinfo -lkvm"

cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_EXE_LINKER_FLAGS="-L/usr/local/llvm33/lib -lkvm" \
    -DUSE_VALGRIND=OFF \
    -DTOKU_DEBUG_PARANOID=OFF \
    -DBUILD_TESTING=OFF \
    -DUSE_CTAGS=OFF \
    -DUSE_ETAGS=OFF \
    -DUSE_GTAGS=OFF \
    -DUSE_CSCOPE=OFF \
    -DCMAKE_INSTALL_PREFIX=$PWD/install \
    ..

gmake install

echo "remember to copy build/install/include/ftcxx & *.h to /usr/local/include"
echo "remember to copy *.a at build/install/lib to /usr/local/lib"