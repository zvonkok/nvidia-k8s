#!/bin/bash -x

if [ -e /opt/nvidia ]; then
	rm -rf /opt/nvidia
fi

atomic pull --storage ostree docker.io/zvonkok/redhat:nvidia-384.81
atomic install --system --system-package=no docker.io/zvonkok/redhat:nvidia-384.81

# fix symlinks, something bogus going on
ln -s /opt/nvidia/lib/libcuda.so.384.81 /opt/nvidia/lib/libcuda.so.1
ln -s /opt/nvidia/lib/libnvidia-cfg.384.81 /opt/nvidia/lib/libnvidia-cfg.so.1
ln -s /opt/nvidia/lib/libnvidia-ml.so.384.81 /opt/nvidia/lib/libnvidia-ml.so.1
ln -s /opt/nvidia/lib/libnvidia-opencl.so.384.81 /opt/nvidia/lib/libnvidia-opencl.so.1
ln -s /opt/nvidia/lib/libnvidia-ptxjitcompiler.so.384.81 /opt/nvidia/lib/libnvidia-ptxjitcompiler.so.1

# copy extra files to host system
cp /usr/libexec/oci/hooks.d/oci-nvidia-container-runtime /host/usr/libexec/oci/hooks.d/oci-nvidia-container-runtime
cp /etc/dracut.conf.d/nvidia.conf /host/etc/dracut.conf.d/nvidia.conf
cp /etc/ld.so.conf.d/nvidia.conf /host/etc/ld.so.conf.d/nvidia.conf
cp /etc/modprobe.d/nouveau.conf /host/etc/modprobe.d/nouveau.conf
cp /etc/profile.d/nvidia.sh /host/etc/profile.d/nvidia.sh

. /etc/profile.d/nvidia.sh

chroot /host ldconfig

chcon -t svirt_sandbox_file_t /dev/nvidia*

nvidia-smi

