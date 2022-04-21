cmake_minimum_required(VERSION 3.16)

project(hello_test)

set(CMAKE_CXX_STANDARD 11)

enable_testing()
find_package(GTest REQUIRED)

add_library(hello SHARED ../hello.c)

add_executable(hello_test hello_test.cc)

target_include_directories(hello PUBLIC ../)

target_link_libraries(hello_test PRIVATE GTest::GTest hello)

include(GoogleTest)
gtest_discover_tests(hello_test)
