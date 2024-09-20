
## Docker install
Docker install instructions in https://linuxiac.com/how-to-install-docker-on-ubuntu-24-04-lts/

At end there is enable for not-root users to run docker. Set it and reboot.

## Dockerfile tuning
Previous dockerfile used Ubuntu 20.04 but Ubuntu 22.04 is newest officially supported and tested then
old machine building is tuned for newest. Potentially newest Yocto releases could have use for it.
"apt-get install" installs all recommendations. Makes bigger image but it will be nearer normal install.

## Login to running container
```
ssh -p 2222 localhost
```
or
```
ssh -o StrictHostKeyChecking=no -p 2222 juha@localhost
```
Where juha is user-id in machine. 

Target is to have same user ID in container and in host machine. Host machine user has also owner ship to files in mounted directory. Check parameters for "-v" in "docker run ..." command (called in kayntiin.sh).

If image is created with command "RUN echo 'juha:juha' | chpasswd" then use that password. Or check what is written to end of used dockerfile.

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

