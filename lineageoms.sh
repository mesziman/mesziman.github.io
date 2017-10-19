wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d ~
mkdir ~/bin
echo 'if [ -d "$HOME/platform-tools" ] ; then' >> ~/.profile
echo '    PATH="$HOME/platform-tools:$PATH"' >> ~/.profile
echo 'fi' >> ~/.profile
apt-get install bc bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev openjdk-8-jdk
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo 'if [ -d "$HOME/bin" ] ; then' >> ~/.profile
echo '    PATH="$HOME/bin:$PATH"' >> ~/.profile
echo 'fi' >> ~/.profile
source ~/.profile
mkdir oms
cd oms
repo init -u https://github.com/LineageOS/android.git -b cm-14.1
repo sync
mkdir .repo/local_manifests
cd .repo/local_manifests
wget https://raw.githubusercontent.com/LineageOMS/local_manifest/master/substratum.xml
cd ../..
repo sync --force-sync
echo "export USE_CCACHE=1" >> ~/.bashrc
echo "export CCACHE_COMPRESS=1" >> ~/.bashrc
source ~/.bashrc
./prebuilts/misc/linux-x86/ccache/ccache -M 50G

