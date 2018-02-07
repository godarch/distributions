FROM scratch

ADD root.x86_64 /

RUN xbps-install -y -S -R http://repo.voidlinux.eu/current/musl
RUN xbps-install -y base-system
RUN xbps-install -y grub-x86_64-efi

ADD helpers/darch-extract /darch-extract
ADD helpers/darch-prepare /darch-prepare
ADD helpers/darch-runrecipe /darch-runrecipe
ADD helpers/darch-teardown /darch-teardown

ADD dracut/module-setup.sh /usr/lib/dracut/modules.d/99darch/module-setup.sh
ADD dracut/live-darch.sh /usr/lib/dracut/modules.d/99darch/live-darch.sh

RUN dracut --force /boot/initramfs-$(ls /usr/lib/modules).img $(ls /usr/lib/modules)