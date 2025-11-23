cmake_minimum_required(VERSION "3.12")

project("cmake-exercise")

# C++ Standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find deal.II
find_package(deal.II 9.0 REQUIRED CONFIG
  HINTS ${DEAL_II_DIR} $ENV{DEAL_II_DIR}
)
# Find boost
find_package(Boost REQUIRED COMPONENTS container filesystem)

# Find yaml-cpp
find_package(yaml-cpp REQUIRED)


add_executable(main main.cpp fem/fem.cpp flatset/flatset.cpp filesystem/filesystem.cpp yamlParser/yamlParser.cpp)

# Link deal.II
target_link_libraries(main PRIVATE ${DEAL_II_LIBRARIES})
target_include_directories(main PRIVATE ${DEAL_II_INCLUDE_DIRS})
target_compile_definitions(main PRIVATE ${DEAL_II_DEFINITIONS})

# Link boost
target_link_libraries(main PRIVATE Boost::container Boost::filesystem)

# Link yaml-cpp
target_link_libraries(main PRIVATE yaml-cpp)
