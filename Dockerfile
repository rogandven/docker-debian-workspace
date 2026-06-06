FROM debian:latest
USER root
RUN echo 'root:${ROOT_PASSWORD}' | chpasswd
RUN useradd -m user
RUN echo 'user:${USER_PASSWORD}' | chpasswd

RUN apt update && apt upgrade -y && apt autoremove -y
RUN apt install systemd ssh openssh-client openssh-server openssh-sftp-server bash -y
RUN /sbin/init

USER user
CMD ["/bin/bash"]
ENTRYPOINT ["/bin/bash"]