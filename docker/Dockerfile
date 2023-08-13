FROM ros:melodic-ros-base
# FROM ros:noetic-ros-base

ARG DEBIAN_FRONTEND=noninteractive

# Install basic apt tools
RUN apt update && apt upgrade -y && apt install -y \
    # Replace python-rosdep with python3-rosdep if running noetic
    vim wget zsh git python-pip python-catkin-tools python-tk \
    # install latex for plotting
    texlive-latex-base texlive-fonts-extra texlive-latex-extra texlive-fonts-recommended && \
    # create catkin_ws
    mkdir -p /root/catkin_ws/src

# Install oh-my-zsh (if don't want can remove this code block and subsequent sourcing of ros .setup for .zshrc)
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -t ys \
    -p git \
	-p z \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-syntax-highlighting


RUN . /opt/ros/${ROS_DISTRO}/setup.sh && \
    echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc && \
    echo "source /opt/ros/${ROS_DISTRO}/setup.zsh" >> ~/.zshrc

# Install python packages
RUN pip install numpy matplotlib colorama ruamel.yaml==0.15.99 PyYAML==5.3.1

# Clone catkin_simple
RUN cd /root/catkin_ws/src && \
    git clone https://github.com/catkin/catkin_simple.git

# Set up entrypoint
WORKDIR /root
COPY entrypoint.sh /entrypoint.sh
RUN sudo chmod +x /entrypoint.sh
# Set the default command to zsh
ENTRYPOINT [ "/entrypoint.sh" ] 
CMD zsh

