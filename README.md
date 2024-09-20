
## Docker install
Docker install instructions in https://linuxiac.com/how-to-install-docker-on-ubuntu-24-04-lts/

At end there is enable for not-root users to run docker. Set it and reboot.

## Notes for Yocto project setup

Source: https://medium.com/nerd-for-tech/build-your-own-linux-image-for-the-raspberry-pi-f61adb799652

git clone git://git.yoctoproject.org/poky -b kirkstone

cd poky

git clone git://git.yoctoproject.org/meta-raspberrypi -b kirkstone
git clone https://git.openembedded.org/meta-openembedded -b kirkstone

source oe-init-build-env ../build-rpi

bitbake-layers add-layer ../poky/meta-raspberrypi/
bitbake-layers add-layer ../poky/meta-openembedded/meta-oe/
bitbake-layers add-layer ../poky/meta-openembedded/meta-python/
bitbake-layers add-layer ../poky/meta-openembedded/meta-networking/
bitbake-layers add-layer ../poky/meta-openembedded/meta-multimedia/

 bitbake -c menuconfig virtual/kernel

echo "MACHINE = \"raspberrypi4\"" >> conf/local.conf
echo "ENABLE_UART = \"1\"" >> conf/local.conf
ENABLE_I2C = "1"
echo "ENABLE_I2C = \"1\"" >> conf/local.conf

time bitbake core-image-base
time bitbake core-image-full-cmdline
time bitbake rpi-test-image

Source: https://itspavan.dev/yocto-build-rt-kernel-patch-beaglebone-guide
 RT layers

mkdir meta-mylayer
mkdir meta-mylayer/conf
mkdir meta-mylayer/recipes-kernel
mkdir meta-mylayer/recipes-kernel/linux
mkdir meta-mylayer/recipes-kernel/linux/linux-yocto

