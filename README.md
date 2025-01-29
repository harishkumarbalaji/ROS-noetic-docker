# ROS Noetic Docker

This repository helps in running ROS Noetic on non-supported devices. It has been tested on Ubuntu 22 and 24. It has not been tested on Windows and Mac.

## Prerequisites

- Docker installed. Follow the instructions [here](https://docs.docker.com/get-docker/).
- On Linux, make sure to follow the Docker post-install steps [here](https://docs.docker.com/engine/install/linux-postinstall/).

## Building the Docker Image

### With NVIDIA GPU (Linux only)

If you have an NVIDIA GPU, ensure you have the correct drivers installed and test them:

```bash
nvidia-smi
```

If `nvidia-smi` is not found, install the NVIDIA drivers. Follow the instructions [here](https://ubuntu.com/server/docs/nvidia-drivers-installation).

Next, install NVIDIA Container Toolkit and configure the runtime. Follow the instructions [here](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

### Building the Image

Use Docker Compose to build the image:

```bash
docker-compose build
```

## Running the Container

>Note: If you are using without NVIDIA GPU check the comments in the [Dockerfile](./Dockerfile) and make the corresponding changes before you start the container.

Start the container using Docker Compose:

```bash
docker-compose up -d
```

## Accessing the Container

To execute into the container in another terminal:

```bash
docker exec -it ros-noetic-container bash
```

## Running RViz

To check if the GUI is working from the container, run:

```bash
source /opt/ros/noetic/setup.bash
rviz
```
>Note: Make sure to run rosmaster using `roscore` in another terminal before you run rviz or any nodes.
 
This should open the RViz GUI.
