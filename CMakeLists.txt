cmake_minimum_required(VERSION 3.12)

# C++ Standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 1. Deal.II suchen
find_package(deal.II 9.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
)

# 2. Variablen initialisieren (Wichtig!)
deal_ii_initialize_cached_variables()

project(main)

# 3. Deine ZUSÄTZLICHEN Abhängigkeiten finden (die nicht zu deal.II gehören)
find_package(Boost REQUIRED COMPONENTS container filesystem)
find_package(yaml-cpp REQUIRED)

# 4. Dein Executable mit allen Source-Files
add_executable(main 
    main.cpp 
    fem/fem.cpp 
    flatset/flatset.cpp 
    filesystem/filesystem.cpp 
    yamlParser/yamlParser.cpp
)

# 5. DER MAGISCHE BEFEHL
# Das verlinkt automatisch MPI, Kokkos, Trilinos, OpenMP, etc.
deal_ii_setup_target(main)

# 6. Nur noch deine eigenen Zusatz-Libs linken
target_link_libraries(main Boost::container Boost::filesystem)
target_link_libraries(main yaml-cpp)
