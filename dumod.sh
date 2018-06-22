apt-get update
apt-get install bc bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev openjdk-8-jdk
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d ~
mkdir ~/bin
echo 'if [ -d "$HOME/platform-tools" ] ; then' >> ~/.profile
echo '    PATH="$HOME/platform-tools:$PATH"' >> ~/.profile
echo 'fi' >> ~/.profile
git config --global user.name "Gabor Meszaros"
git config --global user.email "meszaros.gabor.10k@gmail.com"
git config --global color.ui true
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo 'if [ -d "$HOME/bin" ] ; then' >> ~/.profile
echo '    PATH="$HOME/bin:$PATH"' >> ~/.profile
echo 'fi' >> ~/.profile
source ~/.profile
mkdir du
cd du
repo init -u https://github.com/DirtyUnicorns/android_manifest -b o8x
mkdir -p .repo/local_manifests
wget https://raw.githubusercontent.com/mesziman/android_manifest/master/du.xml -O .repo/local_manifests/roomservice.xml
repo sync -c -j$( nproc --all ) --force-sync;
echo "export USE_CCACHE=1" >> ~/.bashrc
source ~/.bashrc
source build/envsetup.sh
wget https://mesziman.github.io/buildoms.sh
./prebuilts/misc/linux-x86/ccache/ccache -M 50G

