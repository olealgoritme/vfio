#!/bin/bash
# Pass-thru GPUs
# virtio-win ISO + win10 qcow2 image

qemu-system-x86_64 \
    -machine q35,accel=kvm \
    -cpu host,kvm=off,topoext=on,hv_vendor_id=sugkuk \
    -enable-kvm \
    -m 8192 \
    -device vfio-pci,host=4e:00.0,bus=pcie.0,multifunction=on,x-vga=on \
    -device vfio-pci,host=4e:00.1,bus=pcie.0 \
    -device vfio-pci,host=4e:00.2,bus=pcie.0 \
    -device vfio-pci,host=4e:00.3,bus=pcie.0 \
    -device vfio-pci,host=49:00.0,bus=pcie.0 \
    -rtc base=localtime,clock=host,driftfix=slew \
    -smp 16,sockets=1,cores=16,threads=1 \
    -drive if=pflash,format=raw,readonly,file="OVMF_CODE.fd" \
    -drive if=pflash,format=raw,file="OVMF_VARS.fd" \
    -drive id=win10,if=none,format=qcow2,file=/opt/vms/win10.qcow2 \
    -device ide-hd,drive=win10 \
    -cdrom "/home/xuw/ISO/virtio-win-0.1.171.iso" \
    -device ivshmem-plain,memdev=ivshmem,bus=pcie.0 \
    -object memory-backend-file,id=ivshmem,share=on,mem-path=/dev/shm/looking-glass,size=64M \
    -spice port=5900,disable-ticketing \
    -vga qxl \
