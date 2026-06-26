cmake_minimum_required(VERSION 3.24)

project(MarvisKit VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.9 REQUIRED COMPONENTS Quick QuickControls2)
qt_standard_project_setup(REQUIRES 6.9)

option(MARVIS_KIT_BUILD_EXAMPLES "Build MarvisKit example applications" ON)

add_subdirectory(src/MarvisKit)

if(MARVIS_KIT_BUILD_EXAMPLES)
    add_subdirectory(examples/gallery)
endif()
