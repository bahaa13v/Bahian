#!/bin/bash
apt update && apt upgrade -y
apt install locales -y
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
