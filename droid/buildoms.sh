
function jack_workaround() {
    # Only allow one stream of compilation
    export SERVER_NB_COMPILE=1
    # Jack arguments
    export JACK_SERVER_VM_ARGUMENTS="-Xmx7G
                                     -XX:+TieredCompilation
                                     -Dfile.encoding=UTF-8"
    # Server restart is only needed if jack is already installed
    if [[ -d ${HOME}/.jack-server ]]; then
        ./prebuilts/sdk/tools/jack-admin kill-server
        ./prebuilts/sdk/tools/jack-admin start-server
    fi
}
function copyrom(){
sudo mkdir -p /var/www/html
sudo cp ./out/target/product/capricorn/*.zip /var/www/html/
sudo cp ./out/target/product/capricorn/*.zip.md5sum /var/www/html/

}
function uploadtome(){
rsync -avP -e ssh zip root@178.62.238.57:/var/www/html/cepheus/AospExtended/test/
}
function copyromcep(){
sudo mkdir -p /var/www/html
sudo cp ./out/target/product/cepheus/*.zip /var/www/html/
sudo cp ./out/target/product/cepheus/*.zip.md5sum /var/www/html/

}
corenumber=$( nproc --all )
buildspeed=$(( $corenumber + 2 ))

function buildkernel() {
#jack_workaround
NOW=$( date +"%Y-%m-%d-%H-%M" )
mkdir -p build-logs
START=$( date +%s )
lunch syberia_cepheus-userdebug
make installclean
make -j$buildspeed bootimage  2>&1 | tee -a build-logs/kernel_${NOW}.log
END=$(date +%s)
echo -e "DURATION: $( format_time ${END} ${START} )"
}


function buildrom() {
#jack_workaround
NOW=$( date +"%Y-%m-%d-%H-%M" )
mkdir -p build-logs
START=$( date +%s )
lunch syberia_cepheus-userdebug
make installclean
make -j$buildspeed bacon  2>&1 | tee -a build-logs/log_${NOW}.log
END=$(date +%s)
echo -e "DURATION: $( format_time ${END} ${START} )"
copyromcep
}

function buildomni() {
#jack_workaround
NOW=$( date +"%Y-%m-%d-%H-%M" )
mkdir -p build-logs
START=$( date +%s )
breakfast capricorn
make installclean

make -j$buildspeed cookies 2>&1 | tee -a build-logs/log_${NOW}.log
END=$(date +%s)
echo -e "DURATION: $( format_time ${END} ${START} )"
copyrom
}

function buildcapaex() {
#jack_workaround
NOW=$( date +"%Y-%m-%d-%H-%M" )
mkdir -p build-logs
START=$( date +%s )
lunch aosp_capricorn-userdebug
make  aex -j$buildspeed 2>&1 | tee -a build-logs/log_${NOW}.log
END=$(date +%s)
echo -e "DURATION: $( format_time ${END} ${START} )"
copyrom
}

function cleanlogs ()
{
rm -f build-logs/*
}
function buildaex() {
#jack_workaround
NOW=$( date +"%Y-%m-%d-%H-%M" )
mkdir -p build-logs
START=$( date +%s )
lunch aosp_cepheus-userdebug
make installclean
make aex -j$buildspeed 2>&1 | tee -a build-logs/log_${NOW}.log
END=$(date +%s)
echo -e "DURATION: $( format_time ${END} ${START} )"
copyromcep
}


function buildcos() {
#jack_workaround
NOW=$( date +"%Y-%m-%d-%H-%M" )
mkdir -p build-logs
START=$( date +%s )
lunch cos_cepheus-userdebug
make -j$buildspeed 2>&1 | tee -a build-logs/log_${NOW}.log
END=$(date +%s)
echo -e "DURATION: $( format_time ${END} ${START} )"
copyromcep
}
