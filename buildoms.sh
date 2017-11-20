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
function buildoms() {
#jack_workaround
NOW=$( date +"%Y-%m-%d-%H-%M" )
mkdir -p build-logs
START=$( date +%s )
breakfast capricorn
make installclean

make -j$( nproc --all ) bacon | tee -a build-logs/log_${NOW}.log
END=$(date +%s)
echo -e "DURATION: $( format_time ${END} ${START} )"
}
