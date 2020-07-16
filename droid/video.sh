  
sudo apt-get update
sudo apt-get install --assume-yes ffmpeg transmission-daemon transmission-cli midori xbase-clients tmux handbrake-cli handbrake nginx
sudo systemctl stop transmission-daemon
sudo sed -i 's/"rpc-authentication-required": true/"rpc-authentication-required": false/g' /etc/transmission-daemon/settings.json
sudo sed -i 's/"rpc-whitelist-enabled": true/"rpc-whitelist-enabled": false/g' /etc/transmission-daemon/settings.json
sudo systemctl start transmission-daemon

sudo sed -i 's/location \/.*/location \/ \{\n autoindex on;/g' /etc/nginx/sites-enabled/default
sudo rm /var/www/html/index.nginx-debian.html
sudo systemctl restart nginx

wget mesziman.github.io/droid/tmux.conf -O ~/.tmux.conf
echo "

function convertmp5() {
file=$1
str="${file// /_}"
str="${str//-/}"
strfin=$(echo $str | tr -cd '[:alnum:]._-')
strfinl=$(echo $strfin | tr '[:upper:]' '[:lower:]')
ffmpeg -i "$file" -c:v libx265 -preset $2 -crf $3 -c:a libopus -b:a 96K "${strfinl%.*}_x265.mkv"
}
function batchconvert() {
mkdir new
for %%a in ("*.mp4")
do 
file="%%a"
str="${file// /_}"
str="${str//-/}"
strfin=$(echo $str | tr -cd '[:alnum:]._-')
strfinl=$(echo $strfin | tr '[:upper:]' '[:lower:]')
ffmpeg -i "%%a" -c:v libx265 -preset $1 -crf $2 -c:a libopus -b:a 96K "new/${strfinl%.*}_x265.mp4"
done
pause
}


function handbrakeconvertmp5() {
HandBrakeCLI -i $1 -o x265_"$1" -e x265 -q 22 -E opus -B 96
}


" >> ~/.bashrc

tmux new -s base
