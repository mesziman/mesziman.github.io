

git clone https://github.com/mesziman/kernel_xiaomi_sm8150-2 k ;
cd k ; 
git remote add aka https://github.com/markakash/kernel_xiaomi_sm8150
git remote add demon https://github.com/demon000/kernel_xiaomi_sm8150
git config --global color.ui true ;
git config --global user.name "Gabor Meszaros" ;
git config --global user.email "meszaros.gabor.10k@gmail.com" ;
cd .. ;

git clone https://github.com/mesziman/device_xiaomi_cepheus-3 d ;
cd d ;
git remote add derp https://github.com/DerpFest-Devices/device_xiaomi_cepheus
git remote add dem https://github.com/demon000/device_xiaomi_cepheus
git config --global color.ui true ;
git config --global user.name "Gabor Meszaros" ;
git config --global user.email "meszaros.gabor.10k@gmail.com" ;
cd .. ;
git clone https://github.com/mesziman/device_xiaomi_sm8150-common-1 dc ;
cd dc ;
git remote add derp https://github.com/DerpFest-Devices/device_xiaomi_sm8150-common/
git remote add demon https://github.com/demon000/device_xiaomi_sm8150-common/
git remote add markakash https://github.com/markakash/device_xiaomi_sm8150-common/
git config --global color.ui true ;
git config --global user.name "Gabor Meszaros" ;
git config --global user.email "meszaros.gabor.10k@gmail.com" ;
cd .. ;
