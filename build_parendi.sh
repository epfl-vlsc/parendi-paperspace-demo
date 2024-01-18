#!/bin/bash
apt-get update
# Install prereqs
apt-get install -y git help2man perl python3 make ninja-build cmake autoconf g++ flex bison ccache
apt-get install -y libgoogle-perftools-dev numactl perl-doc libboost-all-dev
apt-get install -y g++-10 gcc-10 # needed on Ubuntu 20.04


# Clone the repository
echo "Cloning Parendi"
git clone https://github.com/epfl-vlsc/parendi.git
cd parendi
git submodule update --init --recursive
mkdir -p build
cd build
unset VERILATOR_ROOT # PARENDI does not rely on it
cmake .. -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DCMAKE_C_COMPILER:FILEPATH=/usr/bin/gcc-10 -DCMAKE_CXX_COMPILER:FILEPATH=/usr/bin/g++-10 -G Ninja
cmake --build  . --parallel 8 --config Release


