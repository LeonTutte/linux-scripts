#!/bin/bash
# Ubuntu PostgreSQL Installation

#Installation
sudo apt update --force-yes
sudo apt upgrade --force-yes
sudo apt install postgresql postgresql-contrib --force-yes
sudo apt autoremove --force-yes

#Configuration
sudo -i -u postgres
createuser --interactive

#network access
cd /etc/postgresql/12/main
echo

#Firewall
sudo ufw allow 5432/tcp
