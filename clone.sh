# Clone the repository
echo "Cloning Parendi"
git clone https://github.com/epfl-vlsc/parendi.git
git submodule update --init --recursive
cd parendi
mkdir -p build
cd build
unset VERILATOR_ROOT # PARENDI does not rely on it
cmake .. -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DCMAKE_C_COMPILER:FILEPATH=/usr/bin/gcc-10 -DCMAKE_CXX_COMPILER:FILEPATH=/usr/bin/g++-10 -G Ninja
cmake --build  . --parallel 8 --config Release


