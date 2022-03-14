#!/bin/bash
# Ubuntu PostgreSQL Installation

sudo apt update --force-yes
sudo apt upgrade --force-yes
sudo apt install postgresql postgresql-contrib --force-yes
sudo apt autoremove --force-yes
