#!/usr/bin/env bash

# Load some common helper commands.
type getarg >/dev/null 2>&1 || . /lib/dracut-lib.sh
command -v unpack_archive >/dev/null || . /lib/img-lib.sh

[ -z "$darch_dir" ] && darch_dir=$(getarg darch_dir=)
darch_dir_path=`echo $darch_dir | sed 's/.*\://g'`

darch_hooks_dir="/run/initramfs/live${darch_dir_path}/hooks"

if [ -e "$darch_hooks_dir" ]; then
    for hook_dir in $darch_hooks_dir/*; do
        hook_name=`basename ${hook_dir}`
        export DARCH_ROOT_FS="/run/rootfsbase"
        export DARCH_HOOK_DIR="${darch_hooks_dir}/${hook_name}"

        /usr/bin/env sh -c ". $DARCH_HOOK_DIR/hook && run"
    done
fi

warn "Failed to mount overlay to /run/rootfsbase"
emergency_shell