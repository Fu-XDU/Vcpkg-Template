cmake_minimum_required(VERSION 4.0)

set(CMAKE_CXX_STANDARD 20)

if (NOT DEFINED URL_BASE)
    set(URL_BASE "github.com")
endif ()

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

set(VERSION "0.0.1")
set(VERSION_SUFFIX "")

# vcpkg init
include(ProjectVcpkg)

project(vcpkg-template)

# vcpkg deps
# Note: vcpkg packages should be linked using find_package() and target_link_libraries()
# For manual linking, use target_include_directories and target_link_directories instead

add_executable(vcpkg-template main.cpp)

# If you need to manually link vcpkg libraries, use:
# target_include_directories(vcpkg-template PRIVATE ${VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/include)
# target_link_directories(vcpkg-template PRIVATE ${VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/lib)
