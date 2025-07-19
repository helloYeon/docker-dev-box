FROM rockylinux:9.3.20231119

##############################
# Initialize
##############################
WORKDIR /app

ENV TZ=Asia/Tokyo

LABEL maintainer="gnom878@gmail.com" \
      version="1.0" \
      description="Rocky Linux dev container with common tools"

RUN dnf -y update


##############################
# alias
##############################
RUN echo 'alias ll="ls -al"' >> ~/.bashrc
RUN echo 'alias p3="python3"' >> ~/.bashrc


##############################
# Install Common CLI tools
##############################
RUN dnf install -y \
        iputils  \
        which  \
        nmap  \
        bind-utils \
        iproute && \
    dnf clean all


##############################
# Install Python
##############################
RUN dnf -y update && \
    dnf -y install python3 python3-pip && \
    dnf clean all


RUN dnf clean all

##############################
# CMD
##############################
# CMD ["tail", "-f", "/dev/null"]
CMD ["/bin/bash"]
