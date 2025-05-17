#!/bin/bash

# Connect to the remote server using ssh
# ssh -i ubuntu-aws.pem ubuntu@52.77.235.180

sudo apt update -y && sudo apt upgrade -y

sudo apt install docker.io

sudo systemctl start docker

# Add 'ubuntu' user to the Docker group
sudo usermod -a -G docker ubuntu

git clone https://github.com/AdityaSuresh013/Customer-Churn-Analysis.git

cd Customer-Churn-Analysis

docker build -t customer-churn .

docker run -d \
  --name customer-churn \
  -p 80:8501 \
  --restart unless-stopped \
  customer-churn

docker ps -a