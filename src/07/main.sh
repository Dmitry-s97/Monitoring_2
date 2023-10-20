#!/bin/bash

sudo apt-get update && apt-get upgrade -y

sudo apt install prometheus
sudo systemctl start prometheus
sudo systemctl enable prometheus
sudo systemctl status prometheus

# grafana
# download from here https://mirrors.cloud.tencent.com/grafana/debian/pool/main/g/grafana/
# https://community.grafana.com/t/install-on-ubuntu-18-04-lts/7164/3 install from comments here
# sudo dpkg -i ./grafana_9.5.9_amd64.deb
sudo apt update
sudo apt install grafana
# sudo systemctl stop grafana-server
# sudo grafana-cli admin reset-admin-password 12345
sudo systemctl start grafana-server
sudo systemctl enable grafana-server
sudo systemctl status grafana-server

# node-explorer
# cd ~
# curl -LO https://github.com/prometheus/node_exporter/releases/download/v0.15.1/node_exporter-0.15.1.linux-amd64.tar.gz
# tar xvf node_exporter-0.15.1.linux-amd64.tar.gz
sudo cp node_exporter-0.15.1.linux-amd64/node_exporter /usr/local/bin
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

sudo rm -rf node_exporter-0.15.1.linux-amd64.tar.gz node_exporter-0.15.1.linux-amd64

sudo cp /home/dmitry/MyProjects/Monitoring_2/src/07/node_exporter.service /etc/systemd/system/node_exporter.service

sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter
sudo systemctl status node_exporter