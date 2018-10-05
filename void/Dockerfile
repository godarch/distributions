FROM scratch

ADD root.tar.xz /

RUN echo "repository=http://alpha.us.repo.voidlinux.org/current" > /etc/xbps.d/00-repository-main.conf
RUN xbps-install -y -S -R http://alpha.us.repo.voidlinux.org/current
RUN xbps-install -y base-system
RUN xbps-install -y grub-x86_64-efi
RUN xbps-install -y lvm2

ADD helpers/darch-extract /darch-extract
ADD helpers/darch-prepare /darch-prepare
ADD helpers/darch-runrecipe /darch-runrecipe
ADD helpers/darch-teardown /darch-teardown

ADD dracut/module-setup.sh /usr/lib/dracut/modules.d/99darch/module-setup.sh
ADD dracut/live-darch.sh /usr/lib/dracut/modules.d/99darch/live-darch.sh
ADD dracut/parse-darch.sh /usr/lib/dracut/modules.d/99darch/parse-darch.sh
ADD dracut/run-darch-hooks.sh /usr/lib/dracut/modules.d/99darch/run-darch-hooks.sh

RUN dracut --force /boot/initramfs-$(ls /usr/lib/modules).img $(ls /usr/lib/modules)

RUN xbps-remove -O