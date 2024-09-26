FROM osrf/ros:noetic-desktop-full
# FROM pachyderm/opencv

# YOU should replace your_os_user with your actual system user
ARG USER_UID=1000
ARG USER_GID=1000
ARG USER=your_os_user
ARG DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

RUN groupadd --gid $USER_GID $USER \
    && useradd --uid $USER_UID --gid $USER_GID -m $USER \
    && echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN apt-get update && apt-get install -y \
    git \
    sudo \
    python3-pip \
    build-essential \
    cmake \
    pkg-config \
    libjpeg-dev \
    libtiff5-dev \
    libpng-dev \
    make \
    ros-noetic-moveit \
    ros-noetic-ros-controllers \
    ros-noetic-gazebo-ros-control \
    ros-noetic-rosserial \
    ros-noetic-rosserial-arduino \
    ros-noetic-roboticsgroup-upatras-gazebo-plugins \
    ros-noetic-actionlib-tools \
    && rm -rf /var/lib/apt/lists/*
    
# BASE END CONFIG
WORKDIR /home/${USER}

ENTRYPOINT ["/bin/bash"]
