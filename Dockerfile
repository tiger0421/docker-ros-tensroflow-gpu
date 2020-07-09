FROM tensorflow/tensorflow:2.0.0-gpu

ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i 's#http://tw.archive.ubuntu.com/#http://archive.ubuntu.com/#' /etc/apt/sources.list && \
    apt update && \
    apt install -y \
        dpkg \
        software-properties-common \
        git \
        curl \
        wget \
        lsb-release \
        python3-argcomplete \
        gnupg2 \
        dirmngr \
        g++ \
        fluid \
        build-essential \
        vim \
        tmux \
    && \
    echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list && \
    wget http://packages.ros.org/ros.key -O - | apt-key add - \
    && \
    apt update && \
    apt install -y --no-install-recommends \
        ros-melodic-desktop-full \
        python-catkin-tools \
        python-rosdep \
        python-rosinstall-generator \
        python-wstool \
        python-rosinstall && \
    sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/gazebo-stable.list' && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D2486D2DD83DB69272AFE98867170598AF249743 && \
    apt update && \
    apt upgrade -y && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python

ARG DOCKER_UID=1000
ARG DOCKER_USER=docker
ARG DOCKER_PASSWORD=docker
RUN useradd -m --uid ${DOCKER_UID} --groups sudo ${DOCKER_USER} \
  && echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd

USER ${DOCKER_USER}
WORKDIR /home/${DOCKER_USER}

CMD ["/bin/bash"]
