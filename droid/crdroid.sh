sudo apt-get update
#sudo apt-get install --assume-yes git-lfs vim unzip brotli libomp-dev ccache tmux python nginx bc binutils-arm-linux-gnueabi binutils-aarch64-linux-gnu bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32readline-dev lib32z1-dev liblz4-toollibsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
sudo apt-get install --assume-yes vim tmux nginx jq curl git-lfs bc ccache git-core gnupg flex bison build-essential zip curl zlib1g-dev libc6-dev-i386 x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig imagemagick bc binutils-arm-linux-gnueabi binutils-aarch64-linux-gnu bison build-essential curl flex openssl  libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev g++-multilib gcc-multilib git gnupg gperf imagemagick lib32readline-dev lib32z1-dev
#wget https://github.com/gpakosz/.tmux/raw/master/.tmux.conf -O ~/.tmux.conf
wget mesziman.github.io/droid/.tmux.conf -O ~/.tmux.conf
sudo sed -i 's/location \/.*/location \/ \{\n autoindex on;/g' /etc/nginx/sites-enabled/default
sudo rm /var/www/html/index.nginx-debian.html
sudo systemctl restart nginx
git config --global color.ui true
git config --global user.name "Gabor Meszaros"
git config --global user.email "meszaros.gabor.10k@gmail.com"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

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
cd /root/;
mkdir crd
cd crd
repo init  --depth=1 -u https://github.com/crdroidandroid/android.git -b 15.0 --git-lfs
mkdir -p .repo/local_manifests
wget https://mesziman.github.io/droid/crdroid.xml -O .repo/local_manifests/roomservice.xml
mkdir ~/.ccache
echo "export USE_CCACHE=1" >> ~/.bashrc
echo "export CCACHE_EXEC=/usr/bin/ccache" >>  ~/.bashrc
echo "export CCACHE_DIR=~/.ccache" >>  ~/.bashrc

echo 'repo sync -c -j2 --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune;
set -e;
source build/envsetup.sh;
ccache -M 100G;
cd /root/crd;
cd /root/crd/vendor/xiaomi/sm8250-common ; 
git fetch https://github.com/mesziman/android_vendor_xiaomi_sm8250-common/ b279af2cf63479fbbf594f6326e8bc0d7c80ef00 ; git cherry-pick FETCH_HEAD
git fetch https://github.com/mesziman/android_vendor_xiaomi_sm8250-common/ 2b68e4bcfc0ccce178f57ccbd5decbe1003605eb ; git cherry-pick FETCH_HEAD
git fetch https://github.com/mesziman/android_vendor_xiaomi_sm8250-common/ 92170d54d276c0a6bd2bbb9705fd2cf27a4cb42c ; git cherry-pick FETCH_HEAD
cd /root/crd;
sed -i "s/core_64_bit.mk/core_64_bit_only.mk/" device/xiaomi/cmi/lineage_cmi.mk
sed -i "s/core_64_bit.mk/core_64_bit_only.mk/" device/xiaomi/cas/lineage_cas.mk
git clone https://github.com/Sushrut1101/GoFile-Upload ../uploader
' >> cacheset
'
lunch lineage_umi-bp1a-user ; m installclean; m otatools target-files-package -j$(nproc) ; ota_from_target_files out/target/product/umi/obj/PACKAGING/target_files_intermediates/lineage_umi-target_files.zip /var/www/html/droid/crdroid-umi-15-$(date +%Y%m%d%H%M%S).zip
lunch lineage_cas-bp1a-user ; m installclean; m otatools target-files-package -j$(nproc) ; ota_from_target_files out/target/product/cas/obj/PACKAGING/target_files_intermediates/lineage_cas-target_files.zip /var/www/html/droid/crdroid-cas-15-$(date +%Y%m%d%H%M%S).zip
lunch lineage_cmi-bp1a-user ; m installclean; m otatools target-files-package -j$(nproc) ; ota_from_target_files out/target/product/cmi/obj/PACKAGING/target_files_intermediates/lineage_cmi-target_files.zip /var/www/html/droid/crdroid-cmi-15-$(date +%Y%m%d%H%M%S).zip
' >> umibuilder
chmod +x umibuilder
chmod +x cacheset


tmux new -s base
