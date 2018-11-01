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
function buildrom() {
#jack_workaround
NOW=$( date +"%Y-%m-%d-%H-%M" )
mkdir -p build-logs
START=$( date +%s )
breakfast capricorn
make installclean

make -j$( nproc --all ) bacon  2>&1 | tee -a build-logs/log_${NOW}.log
END=$(date +%s)
echo -e "DURATION: $( format_time ${END} ${START} )"
copyrom
}

function buildomni() {
#jack_workaround
NOW=$( date +"%Y-%m-%d-%H-%M" )
mkdir -p build-logs
START=$( date +%s )
breakfast capricorn
make installclean

make -j$( nproc --all ) cookies 2>&1 | tee -a build-logs/log_${NOW}.log
END=$(date +%s)
echo -e "DURATION: $( format_time ${END} ${START} )"
copyrom
}

function buildaex() {
#jack_workaround
NOW=$( date +"%Y-%m-%d-%H-%M" )
mkdir -p build-logs
START=$( date +%s )
lunch aosp_capricorn-userdebug
mka aex -j$( nproc --all ) bacon 2>&1 | tee -a build-logs/log_${NOW}.log
END=$(date +%s)
echo -e "DURATION: $( format_time ${END} ${START} )"
copyrom
}


function buildcit() {
#jack_workaround
NOW=$( date +"%Y-%m-%d-%H-%M" )
mkdir -p build-logs
START=$( date +%s )
lunch citrus_capricorn-userdebug
mka lemonade -j$( nproc --all ) 2>&1 | tee -a build-logs/log_${NOW}.log
END=$(date +%s)
echo -e "DURATION: $( format_time ${END} ${START} )"
copyrom
}
