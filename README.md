# docker-ros-tensroflow-gpu

this images is based on [this container](https://github.com/tiger0421/docker-ros-gpu-gazebo.git).

## Version
- ubuntu 18.04
- ROS melodic

- Python      2.7
- Tensorflow  2.1.0

## User account
User named "docker" is already created and this user is beloged to sudoers.  
So, you can use `sudo` command.  
For example  
`$ sudo apt update`  
password is `ubuntu`.

## How to running
```
$ docker run --rm -it --gpus all tiger0421/ros-tensorflow-gpu bash
```

If you want to use some devices(web-camera, IMU, etc.) or share network with host, add the option like `-v /dev:/dev` or `--net ***`.

