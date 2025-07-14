FROM ubuntu:22.04

##############################
# initialize
##############################
WORKDIR /app

LABEL maintainer="gnom878@gmail.com" \
      version="1.0" \
      description="Ubuntu dev container with common tools"

ENV DEBIAN_FRONTEND=noninteractive

##############################
# Install Common CLI tools
##############################
RUN apt update && \
    apt -y upgrade && \
    apt install -y vim curl wget git iputils-ping net-tools sudo && \
    apt clean

##############################
# alias
##############################
RUN echo 'alias ll="ls -al"' >> /root/.bashrc && \
    echo 'alias p3="python3"' >> /root/.bashrc

##############################
# CMD
##############################
CMD ["/bin/bash"]