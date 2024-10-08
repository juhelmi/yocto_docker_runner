# https://www.ezurio.com/resources/software-announcements/using-docker-containers-for-reproducible-yocto-builds
#
# Docker Focal image to build Yocto 3.3
#
FROM ubuntu:20.04

# Keep the dependency list as short as reasonable
RUN apt-get update && \
apt-get install -y bc bison bsdmainutils build-essential curl locales \
flex g++-multilib gcc-multilib git gnupg gperf lib32ncurses5-dev \
lib32z1-dev libncurses5-dev git-lfs \
libsdl1.2-dev libxkbcommon-x11-0 libwayland-cursor0 libxml2-utils lzop \
openjdk-8-jdk lzop wget git-core unzip \
genisoimage sudo socat xterm gawk cpio texinfo \
gettext vim diffstat chrpath rsync lz4 zstd \
python-mako python-is-python3 libusb-1.0-0-dev exuberant-ctags \
pngcrush schedtool xsltproc zip zlib1g-dev libswitch-perl && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD https://commondatastorage.googleapis.com/git-repo-downloads/repo /usr/local/bin/
RUN chmod 755 /usr/local/bin/*

# ===== create user/setup environment =====
# Replace 1000 with your user/group id
RUN export uid=1000 gid=1000 user=jenkins && \
mkdir -p /home/${user} && \
echo "${user}:x:${uid}:${gid}:${user},,,:/home/${user}:/bin/bash" >> /etc/passwd && \
echo "${user}:x:${uid}:" >> /etc/group && \
echo "${user} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${user} && \
chmod 0440 /etc/sudoers.d/${user} && \
chown ${uid}:${gid} -R /home/${user}

# Improve rebuild performance by enabling compiler cache
ENV USE_CCACHE 1
ENV CCACHE_DIR /home/jenkins/.ccache

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

ENV HOME /home/jenkins
ENV USER jenkins
USER jenkins

