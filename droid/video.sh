  
sudo apt-get update
sudo apt-get install --assume-yes ffmpeg transmission-cli midori xbase-clients tmux handbrake-cli handbrake nginx
sudo sed -i 's/location \/.*/location \/ \{\n autoindex on;/g' /etc/nginx/sites-enabled/default
sudo rm /var/www/html/index.nginx-debian.html
sudo systemctl restart nginx

wget mesziman.github.io/droid/tmux.conf -O ~/.tmux.conf
echo "
function convertmp5() {
file=$1
ffmpeg -i $file -c:v libx265 -preset medium -crf 21 -c:a libopus -b:a 96K "${ffile%.*}.mkv"
}
function batchconvert() {
for %%a in ("*.mp4") do ffmpeg -i "%%a" -c:v libx265 -preset slow -crf 22 -c:a libopus -b:a 96K "newfiles\%%~na.mp4"
pause
}


function handbrakeconvertmp5() {
HandBrakeCLI -i $1 -o x265_"$1" -e x265 -q 22 -E opus -B 96
}


" >> ~/.bashrc

reboot
