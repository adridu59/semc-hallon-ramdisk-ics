#!/sbin/sh

# shardul_seth: my modules install script

if [ ! -e /data/local.prop ] || [ x$(cat /data/local.prop | grep 'shardul') == "x" ] ; then 
	echo 'shardul.module.intellidemand=1' >> /data/local.prop
	echo 'shardul.module.ondemandx=0' >> /data/local.prop
	echo 'shardul.module.smartassV2=0' >> /data/local.prop
	echo 'shardul.module.sio=0' >> /data/local.prop
	echo 'shardul.module.tun=0' >> /data/local.prop
	echo 'shardul.module.usbstorage=1' >> /data/local.prop
	echo 'shardul.module.isofs=0' >> /data/local.prop
	echo 'shardul.module.ntfs=0' >> /data/local.prop
	echo 'shardul.module.hid_apple=0' >> /data/local.prop
	echo 'shardul.module.hid_microsoft=0' >> /data/local.prop
fi

if [ x$(getprop shardul.module.intellidemand) == "x1" ]; then
	insmod /res/modules/shardul_intellidemand.ko
fi

if [ x$(getprop shardul.module.ondemandx) == "x1" ]; then
	insmod /res/modules/shardul_ondemandx.ko
fi

if [ x$(getprop shardul.module.smartassV2) == "x1" ]; then
	shardul_address=0x$(cat /proc/kallsyms | grep ' kallsyms_lookup_name' | sed 's_ T.*__')
	insmod /res/modules/shardul_smartass2.ko lookup_address=$shardul_address
	unset shardul_address
fi

if [ x$(getprop shardul.module.tun) == "x1" ]; then
	insmod /res/modules/tun.ko
fi

if [ x$(getprop shardul.module.sio) == "x1" ]; then
	insmod /res/modules/sio-iosched.ko
fi

if [ x$(getprop shardul.module.usbstorage) == "x1" ]; then
	insmod /res/modules/usb-storage.ko
fi

if [ x$(getprop shardul.module.isofs) == "x1" ]; then
	insmod /res/modules/isofs.ko
fi

if [ x$(getprop shardul.module.ntfs) == "x1" ]; then
	insmod /res/modules/ntfs.ko
fi

if [ x$(getprop shardul.module.hid_apple) == "x1" ]; then
	insmod /res/modules/hid-apple.ko
fi

if [ x$(getprop shardul.module.hid_microsoft) == "x1" ]; then
	insmod /res/modules/hid-microsoft.ko
fi

