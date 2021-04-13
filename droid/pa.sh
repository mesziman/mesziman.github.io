sudo apt-get update
sudo apt-get install --assume-yes git-lfs vim unzip brotli libomp-dev ccache tmux python nginx bc binutils-arm-linux-gnueabi binutils-aarch64-linux-gnu bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-gtk3-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
wget mesziman.github.io/tmux.conf -O ~/.tmux.conf
sudo sed -i 's/location \/.*/location \/ \{\n autoindex on;/g' /etc/nginx/sites-enabled/default
sudo rm /var/www/html/index.nginx-debian.html
sudo systemctl restart nginx
git config --global color.ui true
git config --global user.name "Gabor Meszaros"
git config --global user.email "meszaros.gabor.10k@gmail.com"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

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
echo '
mkdir miui;cd miui ; 
wget https://bigota.d.miui.com/21.4.7/miui_CEPHEUS_21.4.7_345b9722bd_11.0.zip; cd ..
git clone https://github.com/LineageOS/android_prebuilts_extract-tools prebuilts/extract-tools
git clone https://github.com/LineageOS/android_prebuilts_tools-lineage prebuilts/tools-lineage
git clone https://github.com/LineageOS/android_tools_extract-utils tools/extract-utils
git --depth=1 clone https://github.com/LineageOS/android_vendor_lineage vendor/lineage' >> meme/blob.sh;
chmod +x meme/blob.sh;
cd /root/;
mkdir pa
cd pa
repo init --depth=1 -u https://github.com/AOSPA/manifest -b ruby
mkdir -p .repo/local_manifests
wget https://mesziman.github.io/droid/aospa.xml -O .repo/local_manifests/roomservice.xml
echo "export USE_CCACHE=1" >> ~/.bashrc
echo "export CCACHE_EXEC=/usr/bin/ccache" >>  ~/.bashrc
wget https://mesziman.github.io/buildoms.sh 
echo 'repo sync -c -j$( nproc --all ) --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune;
set -e;
source build/envsetup.sh;
mkdir out;
mount /dev/sdb out;
ccache -M 150G;
ln -s /usr/lib/x86_64-linux-gnu/libncurses.so.6 /usr/lib/libncurses.so.5;
ln -s /usr/lib/x86_64-linux-gnu/libtinfo.so.6 /usr/lib/libtinfo.so.5;
echo "11.0.0" > prebuilts/clang/host/linux-x86/clang-11/AndroidVersion.txt
cd /root/syb;
sed -i "s/march=armv8.2a/march=armv8.2a+dotprod/g" build/soong/cc/config/arm64_device.go;
rm -rf device/google
rm -rf hardware/google/pixel/health
rm -rf hardware/google/pixel/power-libperfmgr
rm -rf vendor/qcom/opensouce/commonsys-intf/display;
git clone https://github.com/lineageos/android_vendor_qcom_opensource_display-commonsys-intf vendor/qcom/opensouce/commonsys-intf/display;
find vendor/qcom/opensource/audio-hal/primary-hal -iname "*.mk" -exec perl -pi.bak -e's/$\(call project-path-for,qcom-audio\)/vendor\/qcom\/opensource\/audio-hal\/primary-hal/g' {} \;
find hardware/qcom/media  -iname "*.mk" -exec perl -pi.bak -e's/$\(call project-path-for,qcom-media\)/hardware\/qcom\/media/g' {} \;
find hardware/qcom/display  -iname "*.mk" -exec perl -pi.bak -e's/$\(call project-path-for,qcom-display\)/hardware\/qcom\/display/g' {} \;
' >> cacheset
chmod +x cacheset

tmux new -s base
