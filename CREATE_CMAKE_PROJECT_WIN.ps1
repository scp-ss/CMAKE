$project_name = Read-Host -Prompt "Enter the project name"
New-Item -ItemType Directory -Path $project_name\include
New-Item -ItemType Directory -Path $project_name\src
New-Item -ItemType Directory -Path $project_name\test
New-Item -ItemType Directory -Path $project_name\build
New-Item -ItemType File -Path $project_name\src\main.cpp
New-Item -ItemType File -Path $project_name\src\$project_name.cpp
New-Item -ItemType File -Path $project_name\include\$project_name.hpp
New-Item -ItemType File -Path $project_name\CMakeLists.txt
New-Item -ItemType File -Path $project_name\Abt.txt
@"
cmake_minimum_required(VERSION 3.10)
project($project_name)
set(CMAKE_CXX_STANDARD 17)
include_directories(`$PROJECT_SOURCE_DIR/include)
set(SOURCES
    src/main.cpp
    src/$project_name.cpp
)
add_executable(`$PROJECT_NAME `$SOURCES)
"@ > $project_name\CMakeLists.txt
@"
#include <iostream>
int main() {
    std::cout << "HI" << std::endl;
    return 0;
}
"@ > $project_name\src\main.cpp
cd $project_name\build
cmake ..
make
