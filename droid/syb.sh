sudo apt-get update
sudo apt-get install --assume-yes vim unzip brotli libomp-dev ccache tmux python nginx bc binutils-arm-linux-gnueabi binutils-aarch64-linux-gnu bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-gtk3-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
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
#git clone https://github.com/mesziman/vendor_xiaomi_cepheus-5 -b ten vendor/xiaomi;
#git clone https://github.com/LineageOS/android_prebuilts_tools-lineage prebuilts/tools-lineage;
#mkdir miui;cd miui ; wget  https://bigota.d.miui.com/V12.0.2.0.QFAEUXM/miui_CEPHEUSEEAGlobal_V12.0.2.0.QFAEUXM_44dcb66933_10.0.zip
cd /root/;
mkdir syb
cd syb
repo init --depth=1 -u https://github.com/syberia-project/manifest.git -b 11.0
mkdir -p .repo/local_manifests
wget https://mesziman.github.io/droid/syb.xml -O .repo/local_manifests/roomservice.xml
echo "export USE_CCACHE=1" >> ~/.bashrc
echo "export CCACHE_EXEC=/usr/bin/ccache" >>  ~/.bashrc
wget https://mesziman.github.io/buildoms.sh 
echo 'repo sync -c -j$( nproc --all ) --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune;
set -e;
source build/envsetup.sh;
ccache -M 150G;
ln -s /usr/lib/x86_64-linux-gnu/libncurses.so.6 /usr/lib/libncurses.so.5;
ln -s /usr/lib/x86_64-linux-gnu/libtinfo.so.6 /usr/lib/libtinfo.so.5;
echo "11.0.0" > prebuilts/clang/host/linux-x86/clang-11/AndroidVersion.txt
cd /root/syb;
sed -i "s/march=armv8.2a/march=armv8.2a+crypto/g" build/soong/cc/config/arm64_device.go;
sed -i "s/march=armv8.2-a/march=armv8.2-a+crypto/g" build/soong/cc/config/arm_device.go;
rm -rf device/google
rm -rf hardware/google/pixel/health
rm -rf hardware/google/pixel/power-libperfmgr
#repopick -t eleven-fod
#repopick 6286

' >> cacheset
chmod +x cacheset

tmux new -s base
