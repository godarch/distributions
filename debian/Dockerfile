FROM scratch

ADD root.x86_64 /

ADD helpers/darch-extract /darch-extract
ADD helpers/darch-prepare /darch-prepare
ADD helpers/darch-runrecipe /darch-runrecipe
ADD helpers/darch-teardown /darch-teardown
ADD hooks/darch /etc/initramfs-tools/hooks/darch

# Update packages
RUN apt-get update

# Install the kernel and initramfs
RUN apt-get -y --allow-unauthenticated install linux-image-amd64

# Clean up
RUN apt-get clean