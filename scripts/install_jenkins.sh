#!/bin/bash

# this script is only tested on ubuntu xenial

# install docker
apt update
apt remove docker docker-engine docker.io
apt install docker.io
systemctl enable docker
systemctl start docker
usermod -aG docker ubuntu

# run jenkins
mkdir -p /var/jenkins_home
chown -R 1000:1000 /var/jenkins_home/
docker run -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -d --name jenkins jenkins/jenkins:lts

# show endpoint
echo 'Jenkins installed'
echo 'You should now be able to access jenkins at: http://'$(curl -s ifconfig.co)':8080'
