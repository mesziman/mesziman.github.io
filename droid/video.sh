  
sudo apt-get update
sudo apt-get install --assume-yes ffmpeg transmission-cli midori xbase-clients tmux

wget mesziman.github.io/droid/tmux.conf -O ~/.tmux.conf
echo "
function convertmp5() {
ffmpeg -i $1 -c:v libx265 -preset medium -crf 23 -c:a libopus -b:a 96K "${f%.*}.mkv"
}
" >> ~/.bashrc

reboot
