FROM scratch

ADD root.x86_64.tar.gz /

# The --with-new-pkgs will also update the kernel as well.
RUN apt-get update && apt-get --with-new-pkgs upgrade -y

# Some common packages
RUN apt-get -y install lvm2

ADD helpers/darch-extract /darch-extract
ADD helpers/darch-prepare /darch-prepare
ADD helpers/darch-runrecipe /darch-runrecipe
ADD helpers/darch-teardown /darch-teardown

# Add the Darch repo for initramfs tools.
RUN apt-get -y install curl gnupg software-properties-common
RUN curl -L https://raw.githubusercontent.com/godarch/debian-repo/master/key.pub | apt-key add -
RUN add-apt-repository 'deb https://raw.githubusercontent.com/godarch/debian-repo/master/darch testing main'
RUN apt-get update
RUN apt-get -y install darch-initramfs-tools
RUN update-initramfs -u

# Clean up
RUN apt-get clean
