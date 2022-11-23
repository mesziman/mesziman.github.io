sudo apt-get update
sudo apt-get install --assume-yes git-lfs vim unzip brotli libomp-dev ccache tmux libncurses5 python-is-python3 nginx bc binutils-arm-linux-gnueabi binutils-aarch64-linux-gnu bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-gtk3-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
#sudo apt-get install --assume-yes git-lfs vim nginx tmux python-is-python3 git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig
wget https://github.com/gpakosz/.tmux/raw/master/.tmux.conf -O ~/.tmux.conf
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
repo init --depth=1 -u https://github.com/AOSPA/manifest -b topaz
mkdir -p .repo/local_manifests
wget https://mesziman.github.io/droid/topaz.xml -O .repo/local_manifests/roomservice.xml
echo "export USE_CCACHE=1" >> ~/.bashrc
echo "export CCACHE_EXEC=/usr/bin/ccache" >>  ~/.bashrc
wget https://mesziman.github.io/buildoms.sh 
echo 'repo sync -c -j$( nproc --all ) --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune;
set -e;
source build/envsetup.sh;
ccache -M 50G;
cd /root/pa;
cd vendor/aospa; 
git fetch https://github.com/mesziman/android_vendor_aospa/ de3154edbe640af0a829652cebbae3c9de06e972 && git cherry-pick FETCH_HEAD;
cd /root/pa;
repopick 23210 23528 23778 23779 23814 24190 24256 24443 25108 25118 25119 25127 25132 25140 25147 25149 25153 25263 25264 25265
' >> cacheset
chmod +x cacheset

tmux new -s base
