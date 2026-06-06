FROM alnoda/ubuntu-workspace:latest
USER root
RUN echo 'root:${ROOT_PASSWORD}' | chpasswd
RUN useradd -m user
RUN echo 'user:${USER_PASSWORD}' | chpasswd

RUN apt update && apt upgrade -y && apt autoremove -y
RUN apt install systemd htop ssh openssh-client openssh-server openssh-sftp-server bash -y

USER user
CMD ["sh", "-c", "tail -f /dev/null"]
ENTRYPOINT ["sh", "-c", "tail -f /dev/null"]