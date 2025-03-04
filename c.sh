#!/bin/bash

echo "deb http://deb.debian.org/debian sid main contrib non-free non-free-firmware" > /etc/apt/sources.list
apt update && apt upgrade -y
apt install locales -y
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "debian" > /etc/hostname
echo "127.0.0.1 localhost" > /etc/hosts
echo "127.0.1.1 debian" >> /etc/hosts

apt install linux-image-amd64 firmware-linux firmware-linux-nonfree -y

echo "KEYMAP=fr" = /etc/vconsole.conf

ln -sf /usr/share/zoneinfo/Africa/Algiers /etc/localtime
hwclock --systohc

apt install sudo grub-pc neovim network-manager -y

useradd -mG sudo,audio,video -s /bin/bash bahaa
echo "root:r" | chpasswd
echo "bahaa:b" | chpasswd

grub-install /dev/sda
update-grub
