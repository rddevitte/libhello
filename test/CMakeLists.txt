cmake_minimum_required(VERSION 3.16)

project(hello_test)

set(CMAKE_CXX_STANDARD 11)

enable_testing()
find_package(GTest REQUIRED)

find_library(LIBHELLO hello PATHS ../)

add_executable(hello_test hello_test.cc)

target_include_directories(hello_test PUBLIC ../)

target_link_libraries(hello_test PRIVATE GTest::GTest ${LIBHELLO})

include(GoogleTest)
gtest_discover_tests(hello_test)
