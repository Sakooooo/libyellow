CMAKE_MINIMUM_REQUIRED(VERSION 3.29.6)

project(yellow)

if(PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
  message(
    FATAL_ERROR
      "build in your build directory idiot"
  )
endif()

add_subdirectory(src)
add_subdirectory(examples)
