# CMake Toolchain file to use zig for the C and C++
# Compiler

# Use
# cmake -B build -DCMAKE_TOOLCHAIN_FILE=zig-toolchain.cmake

set(CMAKE_C_COMPILER "zig cc")
set(CMAKE_CXX_COMPILER "zig c++")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -target x86_64-windows-gnu")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -target x86_64-windows-gnu")
