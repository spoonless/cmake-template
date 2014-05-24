include(ExternalProject)
###############################################
# Download and compile gtest
# Note: pthread support is disabled for cross
# compilation
###############################################

if(CMAKE_CROSSCOMPILING AND CMAKE_TOOLCHAIN_FILE)
  get_filename_component(FULLPATH_CMAKE_TOOLCHAIN_FILE ${CMAKE_TOOLCHAIN_FILE} REALPATH)
  message(${FULLPATH_CMAKE_TOOLCHAIN_FILE})
  set(GTEST_ADDITIONAL_CMAKE_ARGS -DCMAKE_TOOLCHAIN_FILE=${FULLPATH_CMAKE_TOOLCHAIN_FILE})
endif()

ExternalProject_Add(
  project_gtest
  URL http://googletest.googlecode.com/files/gtest-1.7.0.zip
  URL_MD5 2d6ec8ccdf5c46b05ba54a9fd1d130d7
  PREFIX "${CMAKE_CURRENT_BINARY_DIR}/gtest"
  CMAKE_ARGS -Dgtest_disable_pthreads=ON ${GTEST_ADDITIONAL_CMAKE_ARGS}
  INSTALL_COMMAND ""
)

ExternalProject_Get_Property(project_gtest SOURCE_DIR)
ExternalProject_Get_Property(project_gtest BINARY_DIR)

add_library(gtest STATIC IMPORTED)
set_property(TARGET gtest PROPERTY IMPORTED_LOCATION "${BINARY_DIR}/libgtest.a")
add_dependencies(gtest project_gtest)

set(GTEST_INCLUDE_DIR "${SOURCE_DIR}/include")
set(GTEST_LIBRARY gtest)
