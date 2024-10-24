#!/bin/bash
read -p "Enter the project name: " project_name
mkdir -p ${project_name}/include ${project_name}/src ${project_name}/test ${project_name}/build
touch ${project_name}/src/main.cpp
touch ${project_name}/src/${project_name}.cpp
touch ${project_name}/include/${project_name}.hpp
touch ${project_name}/CMakeLists.txt
touch ${project_name}/Abt.txt
cat <<EOL > ${project_name}/CMakeLists.txt
cmake_minimum_required(VERSION 3.10)
project(${project_name})
set(CMAKE_CXX_STANDARD 17)
include_directories(\${PROJECT_SOURCE_DIR}/include)
set(SOURCES
    src/main.cpp
    src/${project_name}.cpp
)
add_executable(\${PROJECT_NAME} \${SOURCES})
EOL
cat <<EOL > ${project_name}/src/main.cpp
#include <iostream>
int main() {
    std::cout << "HI" << std::endl;
    return 0;
}
EOL
cd ${project_name}/build
cmake ..
make

