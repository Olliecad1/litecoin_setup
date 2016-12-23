sed '16d' /etc/dphys-swapfile
sed 's/16d/CONF_SWAPSIZE=1024/g' /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
sudo apt-get install autoconf libtool libssl-dev libboost-all-dev libminiupnpc-dev -y
sudo apt-get install qt4-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev -y
mkdir ~/bin
cd ~/bin
wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
tar -xzvf db-4.8.30.NC.tar.gz
cd db-4.8.30.NC/build_unix; ../dist/configure --enable-cxx
make -j2
sudo make install
cd ~/bin/
git clone https://github.com/litecoin-project/litecoin.git
cd litecoin/
./autogen.sh
./configure CPPFLAGS="-I/usr/local/BerkeleyDB.4.8/include -O2" LDFLAGS="-L/usr/local/BerkeleyDB.4.8/lib" --with-gui
./configure CPPFLAGS="-I/usr/local/BerkeleyDB.4.8/include -O2" LDFLAGS="-L/usr/local/BerkeleyDB.4.8/lib"
make -j2
sudo make install
mkdir ~/.litecoin/
cd ~/.litecoin/
touch litecoin.conf
printf 'listen=1\n   server=1\n  daemon=1\n   testnet=0\n   rpcuser=LITECOIN\n   rpcpassword=LITECOIN_TEST' >> litecoin.conf
litecoind -daemon
