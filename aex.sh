sudo apt-get update
sudo apt-get install --assume-yes libomp-dev tmux python nginx bc binutils-arm-linux-gnueabi binutils-aarch64-linux-gnu bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
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
wget https://bigota.d.miui.com/V11.0.5.0.QFAEUXM/miui_CEPHEUSEEAGlobal_V11.0.5.0.QFAEUXM_b75c33b811_10.0.zip
cd ..;
mkdir aex
cd aex
repo init -u git://github.com/AospExtended/manifest.git -b 9.x
mkdir -p .repo/local_manifests
wget https://mesziman.github.io/aex.xml -O .repo/local_manifests/aex_manifest.xml
echo "export USE_CCACHE=1" >> ~/.bashrc
wget https://mesziman.github.io/buildoms.sh
echo 'repo sync -c -j$( nproc --all ) --force-sync --no-clone-bundle --no-tags ' >> cacheset
chmod +x cacheset
echo '
export lofasz=$PWD
wget https://gist.github.com/cmorlok/2e024297ece2399804576e681c371748/raw/3fc0f69832b71cdde8af858542b5dafc7e4d8189/system.core.0001-dnm-disable-pstore.patch;
wget https://gist.github.com/cmorlok/2e024297ece2399804576e681c371748/raw/3fc0f69832b71cdde8af858542b5dafc7e4d8189/system.sepolicy.0001-dnm-remove-devices-virtual-block-from-genfs_contexts.patch;
set -e;
source build/envsetup.sh;
wget https://gist.githubusercontent.com/mikeNG/4c74a16b14e15abf442c422e9251c7bd/raw/d3381caf6f9680127c2028b4e7040c9b0a4f6c64/updates.shh
chmod +x updates.sh
cd $lofasz/system/core; git am $lofasz/system.core.0001-dnm-disable-pstore.patch; 
cd $lofasz/system/sepolicy; git am $lofasz/system.sepolicy.0001-dnm-remove-devices-virtual-block-from-genfs_contexts.patch; 
cd $lofasz
ccache -M 100G;
' > syncsome
chmod +x syncsome

tmux new -s base
