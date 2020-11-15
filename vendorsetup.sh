. "$(gettop)/vendor/bliss/build/envsetup.sh"

bliss_device_combos

# autopatch.sh: script to manage patches on top of repo
# Copyright (C) 2019 Intel Corporation. All rights reserved.
# Author: sgnanase <sundar.gnanasekaran@intel.com>
# Author: Sun, Yi J <yi.j.sun@intel.com>
#
# SPDX-License-Identifier: BSD-3-Clause

# save the official lunch command to aosp_lunch() and source it
rompath=$(pwd)


function get-cros-files-x86
{
	echo "Setting up Proprietary environment for: $1"
	lunch android_x86-userdebug
	echo "Building proprietary tools... This might take a little..."
	echo "Be prepared to enter root password in order to mount the cros images and unpack things"
	cd vendor/google/chromeos-x86
	./extract-files.sh
	cd ..
	cd ..
	cd ..
}

function get-cros-files-x86_64
{
	echo "Setting up Proprietary environment for: $1"
	lunch android_x86_64-userdebug
	echo "Building proprietary tools... This might take a little..."
	echo "Be prepared to enter root password in order to mount the cros images and unpack things"
	cd vendor/google/chromeos-x86
	./extract-files.sh
	cd ..
	cd ..
	cd ..
}

function build-x86()
{
	bash build/make/core/x86/build-x86.sh $1 $2 $3 $4
}


function run-pc-build
{
	if [ -d $rompath/out/target/product/x86 ]; then
		OUT=$rompath/out/target/product/x86
	else
		OUT=$rompath/out/target/product/x86_64
	fi
	echo "$OUT"
	mkdir -p $OUT/data
	sudo qemu-system-x86_64 -enable-kvm \
        -kernel $OUT/kernel -append "root=/dev/ram0 vmalloc=192M console=ttyS0 video=1280x800 DPI=160 VIRT_WIFI=0" \
        -initrd $OUT/initrd.img \
        -m 2048 -smp 2 -cpu host \
        -soundhw ac97 \
        -usb -device usb-tablet,bus=usb-bus.0 \
        -serial mon:stdio \
        -drive index=0,if=virtio,id=system,file=$OUT/system.sfs,format=raw,readonly \
        -netdev user,id=mynet,hostfwd=tcp::$port-:5555 -device virtio-net-pci,netdev=mynet \
        -virtfs local,id=data,path=$OUT/data,security_model=passthrough,mount_tag=data -append "DATA=$OUT/data" \
        -device virtio-vga \
        -vga qxl -display sdl
        #~ -device virtio-vga,virgl=on \
        #~ -vga virtio -display sdl,gl=on 
        #~ -display gtk,gl=on,zoom-to-fit=off
        #~ -device virtio-vga \
        #~ -vga virtio std qxl
        #~ -display sdl
}
