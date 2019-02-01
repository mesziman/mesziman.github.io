sudo apt-get update
sudo apt-get install --assume-yes libomp-dev tmux python nginx bc binutils-aarch64-linux-gnu bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
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
mkdir syb
cd syb
repo init -u git://github.com/AospExtended/manifest.git -b 9.x
mkdir -p .repo/local_manifests
wget https://mesziman.github.io/aex.xml -O .repo/local_manifests/roomservice.xml
echo "export USE_CCACHE=1" >> ~/.bashrc
wget https://mesziman.github.io/buildoms.sh
echo 'repo sync -c -j$( nproc --all ) --force-sync --no-clone-bundle --no-tags; ./prebuilts/misc/linux-x86/ccache/ccache -M 50G; cd ./prebuilts/misc/linux-x86/ccache/ && export PATH=$PATH:$PWD' >> cacheset
chmod +x cacheset
echo '
cd device/xiaomi/msm8996-common
git remote add s https://github.com/lineageos/android_device_xiaomi_msm8996-common
git fetch s
cd ../capricorn
git remote add s https://github.com/lineageos/android_device_xiaomi_capricorn
git fetch s
cd ../../../vendor/xiaomi
git remote add y https://github.com/SyberiaProject-Devices/proprietary_vendor_xiaomi
git remote add x https://github.com/TheMuppets/proprietary_vendor_xiaomi
git fetch x
git fetch y
cd ../../kernel/xiaomi/msm8996
git remote add up https://android.googlesource.com/kernel/common.git
git fetch up upstream-linux-3.18.y
git remote add clang https://github.com/nathanchance/android-kernel-clang
git fetch clang msm-3.18-pie
git remote add hlc https://github.com/Hlcpereira/kernel_xiaomi_msm8996
git fetch hlc
' > syncsome
tmux new -s base
