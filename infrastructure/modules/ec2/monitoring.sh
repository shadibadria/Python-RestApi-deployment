#!/bin/bash

sudo apt-get update -y
wget https://github.com/prometheus/prometheus/releases/download/v3.2.0-rc.1/prometheus-3.2.0-rc.1.linux-amd64.tar.gz
tar -xvf prometheus-3.2.0-rc.1.linux-amd64.tar.gz
cd  prometheus-3.2.0-rc.1.linux-amd64
./prometheus & # port 9090
sudo apt-get install -y adduser libfontconfig1 musl
wget https://dl.grafana.com/enterprise/release/grafana-enterprise_11.5.1_amd64.deb 
sudo dpkg -i grafana-enterprise_11.5.1_amd64.deb
sudo /bin/systemctl start grafana-server # port 3000

wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.25.0/blackbox_exporter-0.25.0.linux-amd64.tar.gz
tar -xvf blackbox_exporter-0.25.0.linux-amd64.tar.gz 
cd blackbox_exporter-0.25.0.linux-amd64
./blackbox_exporter & # port 9115
