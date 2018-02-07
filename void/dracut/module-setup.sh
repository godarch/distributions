#!/bin/bash

# called by dracut
check() {
    echo "checking..."
    return 0
}

depends() {
    return 0
}

installkernel() {
    instmods squashfs overlay
}

install() {
    echo "installing darch"
    inst_script "$moddir/live-darch.sh" "/sbin/live-darch"

    echo "rd.shell" > ${initdir}/etc/cmdline.d/00-darch.conf
    echo "rd.debug" >> ${initdir}/etc/cmdline.d/00-darch.conf
}