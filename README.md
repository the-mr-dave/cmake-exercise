# Let's Fight With CMake, Docker, and Some Dependencies

Repository for the [CMake exercise](https://github.com/Simulation-Software-Engineering/Lecture-Material/blob/main/03_building_and_packaging/cmake_exercise.md).

The Repository with the solution can be found here: [enoghadd solution](https://github.com/the-mr-dave/cmake-exercise.git)

## 1. Build the Docker Image

To build the Docker image for this project, run the following command in your terminal from the directory containing the Dockerfile:

```bash
docker buildx build --no-cache -t <image-name> .
```

## 2. Run the Docker Container

To run the Docker container use the following command:

```bash
docker run --rm -it <image-name>
```

You will find yourself in a bash shell inside the container in the directory `/mnt/hst`, where the project has been cloned.

**Alternatively**

If you want to mount a local directory into the container, you can use the `-v` option. For example:

```bash
docker run --rm -it --mount type=bind,source="$(pwd)",target=/mnt/hst <image-name>
```

## 3. Build and Run the Project

Run in the container:

```bash
./build_and_run.sh
```

The script will create a build directory, run CMake to configure the project, compile it, and then execute the resulting binary with a sample configuration file.
The dockerfile has impplemented the bonus part, where the container uses [v0.6.3](https://github.com/jbeder/yaml-cpp/releases/tag/yaml-cpp-0.6.3) of yaml-cpp instead of the latest version.
