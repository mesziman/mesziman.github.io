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
echo '
# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
'  >> ~/.bashrc
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
git clone --depth 1 --single-branch -b new20 https://github.com/mesziman/proprietary_vendor_xiaomi-4 vendor/xiaomi/cepheus;
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
cd /root/aex;
cd build/core/;
git remote add -f syb https://github.com/syberia-project/platform_build;
git cherry-pick 412eb35b4  91b6cb2cad ee22994ebf; 
#11e8a967d
git revert 2b63a858 --no-edit;
cd /root/aex;
git clone https://github.com/LineagaeOS/android_external_libnfc-nci external/libnfc-nci
git clone https://github.com/LineageOS/android_external_libnfc-nxp external/libnfc-nxp
rm -rf packages/apps/Nfc ;git clone https://github.com/LineageOS/android_packages_apps_Nfc packages/apps/Nfc
cd /root/aex;
cd build/core; git fetch "http://gerrit.syberiaos.com/syberia-project/platform_build" refs/changes/26/4126/1 && git cherry-pick FETCH_HEAD
cd /root/aex;
repopick -g https://review.lineageos.org/ 271778;
cd /root/aex/frameworks/base; git fetch "https://github.com/LineageOS/android_frameworks_base" refs/changes/96/256596/5 && git cherry-pick FETCH_HEAD;
git revert d92a9b158e8a --no-edit;
git fetch "https://github.com/LineageOS/android_frameworks_base" refs/changes/03/272303/7 && git cherry-pick FETCH_HEAD;
cd /root/aex;

repopick -t ten-aosp-wfd
#repopick -t lock_styles
#repopick -t themes
#repopick -t smart_pixels
repopick 1241 
repopick 1301
#repopick 643
cd device/xiaomi/cepheus;git remote add demon https://github.com/Demon000/device_xiaomi_sm8150-common; git fetch demon;
git remote add eco https://github.com/EcrosoftXiao/device_xiaomi_cepheus/ ; git fetch eco; 
cd /root/aex
cd frameworks/av ; git remote add -f syb https://github.com/syberia-project/platform_frameworks_av ; git cherry-pick fc31fde5df903f5ffa24deaddb4efccaa60d355e 52546307659c7526a4da5112d6d03a1dbe9f1401
cd /root/aex
cd kernel/xiaomi/cepheus; git remote add dark -f https://github.com/DarkDampSquib/kernel_xiaomi_cepheus;
cd /root/aex;
cd vendor/aosp;
git remote add -f syb https://github.com/syberia-project/platform_vendor_syberia;
git cherry-pick 6079a840c0 81ee30e7df10;
cd /root/aex;
sed -i "s/march=armv8.2a/march=armv8.2a+crypto/g" build/soong/cc/config/arm64_device.go;
sed -i "s/march=armv8.2-a/march=armv8.2-a+crypto/g" build/soong/cc/config/arm_device.go;
' >> cacheset;
chmod +x cacheset

tmux new -s base
