sudo apt-get update
sudo apt-get install --assume-yes vim unzip brotli libomp-dev ccache tmux python nginx bc binutils-arm-linux-gnueabi binutils-aarch64-linux-gnu bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
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
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
mkdir meme
cd meme ; git clone https://github.com/XiaomiFirmwareUpdater/xiaomi-flashable-firmware-creator.py memefirm
git clone https://github.com/LineageOS/android_vendor_lineage vendor/lineage;
git clone https://github.com/mesziman/proprietary_vendor_xiaomi-4 vendor/xiaomi;
git clone https://github.com/LineageOS/android_prebuilts_tools-lineage prebuilts/tools-lineage;
git clone --depth 1 --single-branch https://github.com/AndroidDumps/xiaomi_cepheus_dump/ -b cepheus-user-10-QKQ1.190825.002-V11.0.8.0.QFAEUXM-release-keys miui
cd /root/;
mkdir aex
cd aex
repo init -u git://github.com/AospExtended/manifest.git -b 10.x
mkdir -p .repo/local_manifests
wget https://mesziman.github.io/aex.xml -O .repo/local_manifests/aex_manifest.xml
echo "export USE_CCACHE=1" >> ~/.bashrc
echo "export CCACHE_EXEC=/usr/bin/ccache" >>  ~/.bashrc
wget https://mesziman.github.io/buildoms.sh
echo 'repo sync -c -j$( nproc --all ) --force-sync --no-clone-bundle --no-tags;
set -e;
source build/envsetup.sh;
ccache -M 100G;
git clone https://github.com/LineageOS/android_external_libnfc-nci external/libnfc-nci
git clone https://github.com/LineageOS/android_external_libnfc-nxp external/libnfc-nxp
rm -rf packages/apps/Nfc ;git clone https://github.com/LineageOS/android_packages_apps_Nfc packages/apps/Nfc
cd /root/aex
repopick -g https://review.lineageos.org/ 271778;
repopick -g https://review.lineageos.org/ 256596;
repopick -t ten-aosp-wfd
repopick -t lock_styles
repopick -t themes
#repopick -t smart_pixels
repopick 1241 1303 1301 643
cd device/xiaomi/cepheus;git remote add demon https://github.com/Demon000/device_xiaomi_sm8150-common; git fetch demon;
git remote add eco https://github.com/EcrosoftXiao/device_xiaomi_cepheus/ ; git fetch eco; 
cd /root/aex
' >> cacheset
chmod +x cacheset

tmux new -s base
