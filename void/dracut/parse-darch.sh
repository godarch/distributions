#!/usr/bin/env bash

info "running parse commands"

[ -z "$darch_dir" ] && darch_dir=$(getarg darch_dir=)

darch_dir_device=`echo $darch_dir | sed 's/:.*//'`

root=live:$darch_dir_device

warn "new root is $root"