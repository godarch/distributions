FROM scratch

ADD root.tar.gz /
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update

ADD /keyboard /etc/default/keyboard
ADD /console-setup /etc/default/console-setup

RUN apt-get install -y linux-image-generic