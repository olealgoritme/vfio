CREATE TASK:
SCHTASKS /Create /TN "Looking Glass" /SC  ONLOGON /RL HIGHEST /TR C:\tools\looking-glass-host-nvfbc.exe
----------


DOWNLOAD IVSHMEM DRIVER
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/upstream-virtio/
DEVICE MANAGER -> Update driver for "PCI standard RAM Controller" under "System Devices" with IVSHMEM Driver
-----------


DOWNLOAD VIRTIO ISO
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/
Use drivers for virtio devices (storage, network ++)
-----------


INSTALL SPICE TOOLS
Install everything inside "spice" folder
-----------

