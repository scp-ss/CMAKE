@echo off
set /p project_name=Enter the project name: 
mkdir %project_name%\include
mkdir %project_name%\src
mkdir %project_name%\test
mkdir %project_name%\build
type nul > %project_name%\src\main.cpp
type nul > %project_name%\src\%project_name%.cpp
type nul > %project_name%\include\%project_name%.hpp
type nul > %project_name%\CMakeLists.txt
type nul > %project_name%\Abt.txt

echo cmake_minimum_required\(VERSION 3.10\) > %project_name%\CMakeLists.txt
echo project\(%project_name%\) >> %project_name%\CMakeLists.txt
echo set\(CMAKE_CXX_STANDARD 17\) >> %project_name%\CMakeLists.txt
echo include_directories\(\$\{PROJECT_SOURCE_DIR\}/include\) >> %project_name%\CMakeLists.txt
echo set\(SOURCES >> %project_name%\CMakeLists.txt
echo src/main.cpp >> %project_name%\CMakeLists.txt
echo src/%project_name%.cpp >> %project_name%\CMakeLists.txt
echo \) >> %project_name%\CMakeLists.txt
echo add_executable\(\$\{PROJECT_NAME\} \$\{SOURCES\}\) >> %project_name%\CMakeLists.txt

echo #include ^<iostream^> > %project_name%\src\main.cpp
echo int main\(\) ^{ >> %project_name%\src\main.cpp
echo     std::cout << "HI" << std::endl; >> %project_name%\src\main.cpp
echo     return 0; >> %project_name%\src\main.cpp
echo ^} >> %project_name%\src\main.cpp

cd %project_name%\build
cmake ..
make
