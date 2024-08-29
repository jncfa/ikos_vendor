cmake_minimum_required(VERSION 3.10)
project(ikos_vendor CXX)

find_package(ament_cmake REQUIRED)
find_package(ament_cmake_vendor_package REQUIRED)

find_package(ikos 3.3 QUIET)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  set(CMAKE_CXX_FLAGS "-Wno-deprecated-declarations ${CMAKE_CXX_FLAGS}")
endif()

ament_vendor(ikos_vendor
  SATISFIED ${ikos_FOUND}
  VCS_URL https://github.com/NASA-SW-VnV/ikos.git
  VCS_VERSION v3.3
  CMAKE_ARGS
    "-DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}"
)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  list(APPEND AMENT_LINT_AUTO_EXCLUDE
    ament_cmake_cppcheck
  )
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
