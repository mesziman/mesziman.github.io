sudo apt-get update
sudo apt-get install --assume-yes brotli libomp-dev ccache tmux python nginx bc binutils-arm-linux-gnueabi binutils-aarch64-linux-gnu bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
#sudo apt-get install --assume-yes tmux nginx binutils-aarch64-linux-gnu git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip
wget mesziman.github.io/tmux.conf -O ~/.tmux.conf
sudo sed -i 's/location \/.*/location \/ \{\n autoindex on;/g' /etc/nginx/sites-enabled/default
sudo rm /var/www/html/index.nginx-debian.html
sudo systemctl restart nginx
git config --global color.ui true
git config --global user.name "Gabor Meszaros"
git config --global user.email "meszaros.gabor.10k@gmail.com"
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d ~
mkdir ~/bin
echo 'if [ -d "$HOME/platform-tools" ] ; then' >> ~/.profile
echo '    PATH="$HOME/platform-tools:$PATH"' >> ~/.profile
echo 'fi' >> ~/.profile
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo 'if [ -d "$HOME/bin" ] ; then' >> ~/.profile
echo '    PATH="$HOME/bin:$PATH"' >> ~/.profile
echo 'fi' >> ~/.profile
source ~/.profile
#mkdir meme
#cd meme ; git clone https://github.com/XiaomiFirmwareUpdater/xiaomi-flashable-firmware-creator.py memefirm
#git clone https://github.com/LineageOS/android_vendor_lineage vendor/lineage;
#git clone https://github.com/mesziman/proprietary_vendor_xiaomi-4 vendor/xiaomi;
#git clone https://github.com/LineageOS/android_prebuilts_tools-lineage prebuilts/tools-lineage;
#git clone https://github.com/AndroidDumps/xiaomi_cepheus_dump/ -b cepheus-user-10-QKQ1.190825.002-V11.0.8.0.QFAEUXM-release-keys miui
cd /root/;
#git clone https://github.com/kdrag0n/arm-eabi-gcc;
#git clone https://github.com/kdrag0n/aarch64-elf-gcc;
mkdir cos
cd cos
wget https://github.com/mesziman/scripts-1/raw/master/merge-caf-tag.sh
chmod +x merge-caf-tag.sh
repo init -u https://github.com/mesziman/platform_manifest.git -b quasar-release
mkdir -p .repo/local_manifests
wget https://mesziman.github.io/cos.xml -O .repo/local_manifests/roomservice.xml
echo "export USE_CCACHE=1" >> ~/.bashrc
echo "export CCACHE_EXEC=/usr/bin/ccache" >>  ~/.bashrc
wget https://mesziman.github.io/buildoms.sh 
echo 'repo sync -c -j$( nproc --all ) --force-sync --no-clone-bundle --no-tags;
set -e;
source build/envsetup.sh;
ccache -M 150G;
#ln -s /usr/lib/x86_64-linux-gnu/libncurses.so.6 /usr/lib/libncurses.so.5;
#ln -s /usr/lib/x86_64-linux-gnu/libtinfo.so.6 /usr/lib/libtinfo.so.5;
#echo "11.0.0" > prebuilts/clang/host/linux-x86/clang-11/AndroidVersion.txt
cd /root/cos;
cd vendor/nxp/opensource/halimpl;
git fetch "https://github.com/LineageOS/android_vendor_nxp_opensource_halimpl" refs/changes/78/271778/3 && git cherry-pick FETCH_HEAD
cd /root/cos;
cd frameworks/base;
git fetch "https://github.com/LineageOS/android_frameworks_base" refs/changes/03/272303/7 && git cherry-pick FETCH_HEAD;
cd frameworks/base;
sed -i "s/march=armv8.2a/march=armv8.2a+crypto/g" build/soong/cc/config/arm64_device.go;
sed -i "s/march=armv8.2-a/march=armv8.2-a+crypto/g" build/soong/cc/config/arm_device.go;
' >> cacheset
chmod +x cacheset

tmux new -s base
