#!/bin/bash

#install docker compose

if [ ! command -v docker-compose &> /dev/null ]
then
    echo "installing docker compose"
    sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    source ~/.profile
fi

if [ ! -d "./jenkins_dir/casc_configs" ] 
then
    mkdir -p ./jenkins_dir/casc_configs
fi

#launch container
docker-compose build
docker-compose up -d