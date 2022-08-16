KVM Setup

You should then be able to list your domains, that is virtual machines managed by libvirt:
# virsh list --all

To avoid having to use the --connect flag on every command, the URI string can be set in the LIBVIRT_DEFAULT_URI environment variable.
#  export LIBVIRT_DEFAULT_URI='qemu:///system'


Between VM host and guests
Libvirt default network
If you use libvirt to manage your VMs, libvirt provides a NATed bridged network named "default" that allows the host to communicate with the guests. This network is available only for the system domains (that is VMs created by root or using the qemu:///system connection URI). VMs using this network end up in 192.168.122.1/24 and DHCP is provided to them via dnsmasq. This network is not automatically started. To start it use:


 virsh --connect=qemu:///system net-start default
To make the default network start automatically use:


 virsh --connect=qemu:///system net-autostart default


 Converting virtualbox vm to KVM
Convert VDI Directly to QCOW2
https://docs.openstack.org/image-guide/convert-images.html
https://kifarunix.com/use-virtualbox-vms-on-kvm/
qemu-img convert -f vmdk -O qcow2 Win11-disk001.vmdk win11.qcow2