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
mkdir -p frameworks/base ;cd frameworks/base ; git remote add oms https://github.com/LineageOMS/android_frameworks_base; git fetch oms; git pull oms/cm-14.1; cd /mnt/volume/oms;
mkdir -p frameworks/native ;cd frameworks/native ; git remote add oms https://github.com/LineageOMS/android_frameworks_native; git fetch oms; git pull oms/cm-14.1; cd /mnt/volume/oms;
mkdir -p packages/apps/Contacts ;cd packages/apps/Contacts ; git remote add oms https://github.com/LineageOMS/android_packages_apps_Contacts; git fetch oms; git pull oms/cm-14.1; cd /mnt/volume/oms;
mkdir -p packages/apps/ContactsCommon ;cd packages/apps/ContactsCommon ; git remote add oms https://github.com/LineageOMS/android_packages_apps_ContactsCommon; git fetch oms; git pull oms/cm-14.1; cd /mnt/volume/oms;
mkdir -p packages/apps/Dialer ;cd packages/apps/Dialer ; git remote add oms https://github.com/LineageOMS/android_packages_apps_Dialer; git fetch oms; git pull oms/cm-14.1; cd /mnt/volume/oms;
mkdir -p packages/apps/ExactCalculator ;cd packages/apps/ExactCalculator ; git remote add oms https://github.com/LineageOMS/android_packages_apps_ExactCalculator; git fetch oms; git pull oms/cm-14.1; cd /mnt/volume/oms;
mkdir -p packages/apps/PackageInstaller ;cd packages/apps/PackageInstaller ; git remote add oms https://github.com/LineageOMS/android_packages_apps_PackageInstaller; git fetch oms; git pull oms/cm-14.1; cd /mnt/volume/oms;
mkdir -p packages/apps/PhoneCommon ;cd packages/apps/PhoneCommon ; git remote add oms https://github.com/LineageOMS/android_packages_apps_PhoneCommon; git fetch oms; git pull oms/cm-14.1; cd /mnt/volume/oms;
mkdir -p packages/apps/Settings ;cd packages/apps/Settings ; git remote add oms https://github.com/LineageOMS/android_packages_apps_Settings; git fetch oms; git pull oms/cm-14.1; cd /mnt/volume/oms;
mkdir -p system/sepolicy ;cd system/sepolicy ; git remote add oms https://github.com/LineageOMS/android_system_sepolicy; git fetch oms; git pull oms/cm-14.1; cd /mnt/volume/oms;
mkdir -p vendor/cm ;cd vendor/cm ; git remote add oms https://github.com/LineageOMS/android_vendor_cm; git fetch oms; git pull oms/cm-14.1; cd /mnt/volume/oms;

echo "export USE_CCACHE=1" >> ~/.bashrc
echo "export CCACHE_COMPRESS=1" >> ~/.bashrc
source ~/.bashrc
source build/envsetup.sh
./prebuilts/misc/linux-x86/ccache/ccache -M 50G

