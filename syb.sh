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
mkdir meme
cd meme ; git clone https://github.com/XiaomiFirmwareUpdater/xiaomi-flashable-firmware-creator.py memefirm
git clone https://github.com/LineageOS/android_vendor_lineage vendor/lineage;
git clone https://github.com/LineageOS/android_prebuilts_tools-lineage prebuilts/tools-lineage;
mkdir miui; cd miui
git clone https://github.com/AndroidDumps/xiaomi_cepheus_dump/ -b cepheus-user-10-QKQ1.190825.002-V11.0.7.0.QFAEUXM-release-keys miui
#wget https://bigota.d.miui.com/V11.0.5.0.QFAEUXM/miui_CEPHEUSEEAGlobal_V11.0.5.0.QFAEUXM_b75c33b811_10.0.zip;
#wget https://bigota.d.miui.com/V11.0.6.0.QFAEUXM/miui_CEPHEUSEEAGlobal_V11.0.6.0.QFAEUXM_1647340073_10.0.zip
#unzip miui_CEPHEUSEEAGlobal_V11.0.5.0.QFAEUXM_b75c33b811_10.0.zip
#brotli -d system.new.dat.br;
#brotli -d vendor.new.dat.br;
#python ..vendor/lineage/build/tools/sdat2img.py vendor.transfer.list vendor.new.dat;
#mv system.img vendor.img;
#python ..vendor/lineage/build/tools/sdat2img.py system.transfer.list system.new.dat
cd /root/;
git clone https://github.com/kdrag0n/arm-eabi-gcc;
git clone https://github.com/kdrag0n/aarch64-elf-gcc;
mkdir syb
cd syb
repo init -u https://github.com/syberia-project/manifest.git -b 10.0
mkdir -p .repo/local_manifests
wget https://mesziman.github.io/syb.xml -O  .repo/local_manifests/roomservice.xml
wget https://gist.githubusercontent.com/mikeNG/4c74a16b14e15abf442c422e9251c7bd/raw/d3381caf6f9680127c2028b4e7040c9b0a4f6c64/bringup.xml
echo "export USE_CCACHE=1" >> ~/.bashrc
echo "export CCACHE_EXEC=/usr/bin/ccache" >>  ~/.bashrc
wget https://mesziman.github.io/buildoms.sh
echo 'repo sync -c -j$( nproc --all ) --force-sync --no-clone-bundle --no-tags ' >> cacheset
chmod +x cacheset
echo '
export $lofasz=$PWD
wget https://gist.github.com/cmorlok/2e024297ece2399804576e681c371748/raw/3fc0f69832b71cdde8af858542b5dafc7e4d8189/system.core.0001-dnm-disable-pstore.patch;
wget https://gist.github.com/cmorlok/2e024297ece2399804576e681c371748/raw/3fc0f69832b71cdde8af858542b5dafc7e4d8189/system.sepolicy.0001-dnm-remove-devices-virtual-block-from-genfs_contexts.patch;
set -e;
source build/envsetup.sh;
wget https://mesziman.github.io/mikebringup.sh -O updates.sh
chmod +x updates.sh
sed -i "s/repopick/repopick -g https:\/\/review.lineageos.org/g"
cd $lofasz/system/core; git am $lofasz/system.core.0001-dnm-disable-pstore.patch; 
cd $lofasz/system/sepolicy; git am $lofasz/system.sepolicy.0001-dnm-remove-devices-virtual-block-from-genfs_contexts.patch; 
cd $lofasz
ccache -M 100G;
' > syncsome
chmod +x syncsome
echo '

ANDRCUCC=$PWD
cd external/skia ; git remote add aosp https://android.googlesource.com/platform/external/skia/ ; git fetch aosp ; git cherry-pick 9ba1c8b8a9e
cd $ANDRCUCC
cd external/llvm ; git remote add aosp https://android.googlesource.com/platform/external/llvm/ ; git fetch aosp ; git cherry-pick 1d7a9aa3e733
cd $ANDRCUCC
cd external/compiler-rt ; git remote add aosp https://android.googlesource.com/platform/external/compiler-rt ; git fetch aosp ; git cherry-pick 9454620fc
cd $ANDRCUCC
cd system/netd ; git remote add aosp https://android.googlesource.com/platform/system/netd/  ; git fetch aosp ; git cherry-pick b7fe2dba46b0 58fd6cf4c0ff8e
cd $ANDRCUCC
cd system/security ; git remote add aosp https://android.googlesource.com/platform/system/security/ ; git fetch aosp ; git cherry-pick 53b02f78bd
cd $ANDRCUCC
cd art ; git remote add aosp https://android.googlesource.com/platform/art/ ; git fetch aosp ; git cherry-pick ec3adef6e4a 1a727b090e7d
cd $ANDRCUCC
cd frameworks/rs ; git remote add aosp https://android.googlesource.com/platform/frameworks/rs ; git fetch aosp ; git cherry-pick ee700c98316e
cd $ANDRCUCC
cd frameworks/av ; git remote add aosp https://android.googlesource.com/platform/frameworks/av ; git fetch aosp ; git cherry-pick db19f572b941
cd $ANDRCUCC
cd frameworks/native ; git remote add aosp https://android.googlesource.com/platform/frameworks/native ; git fetch aosp ; git cherry-pick bcc6c92 9f2d531 904bf99 f43b02c 5ca1ea4 aaf6216 79e7f1b5f 87ad435 515f2d35
cd $ANDRCUCC
cd build/soong ; git remote add aosp https://android.googlesource.com/platform/build/soong/ ; git fetch aosp; 
git cherry-pick ae6ae1d880 8fec83a8b 3ede294 d7feb380c13 30485c920 c91ab9eb6 14b3cb0ab  53ed59e 538be1f 3567e62f a910d83a ;
cd $ANDRCUCC ; cd build/core ; git remote add mes https://github.com/mesziman/platform_build;
git cherry-pick 793908a46 ;
cd $ANDRCUCC ;
sed -i "s/misc_undefined.*/never: true,/g" frameworks/native/libs/binder/Android.bp
sed -i "s/misc_undefined.*/never: true,/g" system/libhwbinder/Android.bp
sed -i "s/misc_undefined.*/never: true,/g" system/core/base/Android.bp
sed -i "s/misc_undefined.*/never: true,/g" system/core/qemu_pipe/Android.bp
' > upstreamforclang8
chmod +x upstreamforclang8
tmux new -s base
