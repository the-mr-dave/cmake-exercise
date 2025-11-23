cmake_minimum_required(VERSION 3.12)

# C++ Standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Deal.II suchen
find_package(deal.II 9.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
)


deal_ii_initialize_cached_variables()

project(main)


find_package(Boost REQUIRED COMPONENTS container filesystem)
find_package(yaml-cpp REQUIRED)


add_executable(main 
    main.cpp 
    fem/fem.cpp 
    flatset/flatset.cpp 
    filesystem/filesystem.cpp 
    yamlParser/yamlParser.cpp
)


deal_ii_setup_target(main)


target_link_libraries(main Boost::container Boost::filesystem)
target_link_libraries(main yaml-cpp)
