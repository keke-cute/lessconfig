#!/bin/sh
exec qemu-system-x86_64 -enable-kvm \
     -cpu host \
     -drive file=$HOME/Downloads/d25vpc2gm0k486a1icng294sr27rypzv-hurd-barebones.qcow2,if=virtio \
     -m 1G \
#     -display curses \
     -device e1000,netdev=net0 \
     -netdev user,id=net0,hostfwd=tcp::5555-:22 \
     -name "Test" \
     "$@"
