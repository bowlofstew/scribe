set(SRC_ROOT ${CMAKE_SOURCE_DIR}/src)

file(GLOB SCRIBE_INCLUDES
     "${SRC_ROOT}/*.h"
)

file(GLOB SCRIBE_SOURCE
    "${SRC_ROOT}/*.cpp"
)

EXTERNALPROJECT_ADD(
  thrift
  GIT_REPOSITORY https://github.com/apache/thrift.git
  GIT_TAG f0438b8872f08554243a77bf8f5ead1bba6332f1
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../thirdparty/thrift
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
)

set(FB303_INCS ${CMAKE_SOURCE_DIR}/thirdparty/fb303/cpp)
message( STATUS "FB303_INCS:         " ${FB303_INCS} )
include_directories(${FB303_INCS})

# This was just hacked in; will move out after getting the build system in place.
include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
if(COMPILER_SUPPORTS_CXX11)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
elseif(COMPILER_SUPPORTS_CXX0X)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
else()
        message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
endif()

add_executable(scribe ${SCRIBE_SOURCE})