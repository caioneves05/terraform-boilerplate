#!/bin/bash

#run as admin
sudo su

# Update and install necessary packages
apt-get update -y
apt-get upgrade -y
apt-get install -y docker
service docker start
usermod -a -G docker ec2-user

docker run -p 80:8080 caioneves05/your-image-name:latest