include(FetchContent)

set(PACKAGE_NAME vcpkg)

FetchContent_Declare(
        ${PACKAGE_NAME}
        GIT_REPOSITORY "https://${URL_BASE}/microsoft/vcpkg.git"
        GIT_TAG "2026.01.16"
        SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/deps/src/${PACKAGE_NAME}
)

FetchContent_MakeAvailable(${PACKAGE_NAME})

set(CMAKE_TOOLCHAIN_FILE "${vcpkg_SOURCE_DIR}/scripts/buildsystems/vcpkg.cmake" CACHE STRING "Vcpkg toolchain file")

unset(PACKAGE_NAME)