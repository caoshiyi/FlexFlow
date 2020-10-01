find_package(MPI)
if(MPI_FOUND)  
  set(GASNet_THREADING par)
  set(GASNet_PREFERRED_CONDUITS aries gemini ibv)
  list(APPEND CMAKE_PREFIX_PATH ${GASNET_ROOT})
  find_package(GASNet REQUIRED)
  if(NOT GASNet_THREADING STREQUAL "par")
    message(FATAL_ERROR "GASNet threading mode \"${GASNet_THREADING}\" is not currently supported by Legion")
  endif()
else()
  message( WARNING "MPI package not found")
endif()
