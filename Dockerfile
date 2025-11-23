# Dockerfile
FROM ubuntu:24.04


ENV DEBIAN_FRONTEND=noninteractive

# Update and install in one step
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    unzip \
    wget \
    vim \
    git \
    g++ \
    libblas-dev \
    liblapack-dev \
    libboost-all-dev \
    libhdf5-dev \
    libmetis-dev \
    libopenmpi-dev \
    openmpi-bin \
    libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

# Used AI to generate this part
RUN wget https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-0.6.3.tar.gz -O yaml-cpp.tar.gz && \
    tar -xzf yaml-cpp.tar.gz && \
    cd yaml-cpp-yaml-cpp-0.6.3 && \
    mkdir build && cd build && \
    # CMake konfigurieren: Release Mode und Shared Libraries sind wichtig
    cmake .. -DCMAKE_BUILD_TYPE=Release -DYAML_BUILD_SHARED_LIBS=ON && \
    # Bauen (mit allen Kernen) und Installieren
    make -j$(nproc) && \
    make install && \
    # Aufräumen (Source-Dateien löschen, um Image klein zu halten)
    cd /tmp && rm -rf yaml-cpp*

WORKDIR /mnt/hst

RUN git clone https://github.com/the-mr-dave/cmake-exercise.git .

# CMD ["./build_and_run.sh"]
