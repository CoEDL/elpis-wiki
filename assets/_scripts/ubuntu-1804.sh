#!/bin/bash
# Commands taken from https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
# Run using:
# bash <(curl -s https://gitcdn.link/repo/CoEDL/elpis-wiki/setup/ubuntu-1804.sh)
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt install -y docker-ce
docker run -d --rm -p 80:5000/tcp coedl/elpis:stable
