# ROS Noetic Docker with GUI

This repository helps in running ROS Noetic on non-supported devices. It has been tested on Ubuntu 22 and 24. It has not been tested on Windows and Mac.

## Prerequisites

- Docker installed. Follow the instructions [here](https://docs.docker.com/get-docker/).
- On Linux, make sure to follow the Docker post-install steps [here](https://docs.docker.com/engine/install/linux-postinstall/).

## Cloning the Repository

First, clone the repository and navigate to the directory:

```bash
git clone https://github.com/harishkumarbalaji/ROS-noetic-docker.git
cd ROS-noetic-docker
```

## Building the Docker Image

### With NVIDIA GPU (Linux only)

If you have an NVIDIA GPU, ensure you have the correct drivers installed and test them:

```bash
nvidia-smi
```

If `nvidia-smi` is not found, install the NVIDIA drivers. Follow the instructions [here](https://ubuntu.com/server/docs/nvidia-drivers-installation).

Next, install NVIDIA Container Toolkit and configure the runtime. Follow the instructions [here](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html).

### Building the Image

Use Docker Compose to build the image:

```bash
docker-compose build
```

## Running the Container

> **Note:** If you are using without NVIDIA GPU, check the comments in the [Docker Compose](./docker-compose.yaml) file and make the corresponding changes before you start the container.

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

> **Note:** Make sure to run `roscore` in another terminal before you run RViz or any nodes.

This should open the RViz GUI.

## Usage Tips and Instructions

### Using Host Volume

You can use the host volume under the container's home directory inside the `username` folder. This allows you to build and run files that are on the host machine. For example, if you have a file on the host machine at `/home/username/project`, you can access it inside the container at `/home/username/host/project`.

### Using Dev Containers Extension in VSCode

To have a good developer environment inside the Docker container, you can use the Dev Containers extension in VSCode. Follow these steps:

1. Install the Dev Containers extension in VSCode.
2. Open the cloned repository in VSCode.
3. Press `ctrl+shift+p`(or select the remote explorer icon from the left bar) and select `Dev-Containers: Attach to Running Container...`.
4. Select the container name `ros-noetic-container`.
5. Once attached, Select `File->Open Folder...`.
6. Select the folder/workspace you want to open in the container.

This will set up the development environment inside the Docker container, allowing you to use VSCode features seamlessly.

