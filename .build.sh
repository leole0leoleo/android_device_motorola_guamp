#!/bin/bash
export PATH=$HOME/bin:$PATH
export ALLOW_MISSING_DEPENDENCIES=true
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
sudo apt update && sudo apt install -y bc bison build-essential ccache curl \
flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev \
lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev \
libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool \
squashfs-tools xsltproc zip zlib1g-dev iputils-ping && \
cd ~/ && \
git clone https://github.com/akhilnarang/scripts && \
cd scripts && \
bash setup/android_build_env.sh && \
mkdir -p ~/bin && \
mkdir -p ~/android/lineage && \
mkdir -p ~/android/lineage/.repo/local_manifests && \
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && \
chmod a+x ~/bin/repo && \
git config --global user.email "snjy4@protonmail.com" && \
git config --global user.name "snjy4" && \
ccache -M 50G && \
ccache -o compression=true && \
cd ~/android/lineage && \
yes "" | repo init -c --no-repo-verify --no-clone-bundle --depth=1 --partial-clone --clone-filter=blob:limit=10M -u \
https://github.com/LineageOS/android.git -b lineage-18.1 -g default,-notdefault,-device,-darwin,-x86,-mips && \
curl https://raw.githubusercontent.com/snjy4/android_device_motorola_guamp/main/.guamp.xml -o .repo/local_manifests/guamp.xml && \
repo sync -j$(nproc --all) -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune && \
cd ~/android/lineage && \
source build/envsetup.sh && \
lunch lineage_guamp-userdebug && \
export TZ=Asia/Kolkata
m -j$(nproc --all) droid
