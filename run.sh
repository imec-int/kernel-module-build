#!/bin/bash

OS_VERSION=$(echo "$BALENA_HOST_OS_VERSION" | cut -d " " -f 2)
echo "OS Version is $OS_VERSION"

cd output
# mod_dir="example_module_${BALENA_DEVICE_TYPE}_${OS_VERSION}*"
mod_dir="i2s_mic_module_${BALENA_DEVICE_TYPE}_${OS_VERSION}*"
for each in $mod_dir; do
	echo Loading module from "$each"
	# insmod "$each/hello.ko"
	insmod "$each/snd-i2smic-rpi.ko" rpi_platform_generation=2
	# lsmod | grep hello
	lsmod | grep snd-i2smic-rpi
	# rmmod hello
	# rmmod snd-i2smic-rpi
done

