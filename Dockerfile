FROM archlinux 

MAINTAINER "Marc Smith" <marc_smith@gmx.com>

WORKDIR /home/jenkins/agent/workspace/crond
COPY run.sh /run.sh
RUN chmod +x /run.sh
RUN pacman -Sy --noconfirm
RUN pacman -Sy --noconfirm cronie rclone vi vim openssh sshpass
RUN echo "root:root"|chpasswd
RUN echo "" > /etc/motd
CMD ["/run.sh"]

