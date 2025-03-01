mkfs.ext4 /dev/sda1
mkswap /dev/sda2
mount /dev/sda1 /mnt
swapon /dev/sda2

pacman -S debootstrap debian-archive-keyring --noconfirm
debootstrap sid /mnt http://deb.debian.org/debian/
genfstap -U /mnt >> /mnt/etc/fstab

sudo mount --bind /dev /mnt/dev
sudo mount --bind /dev/pts /mnt/dev/pts
sudo mount --bind /proc /mnt/proc
sudo mount --bind /sys /mnt/sys
sudo mount --bind /run /mnt/run

mv c.sh /mnt/
chmod +x /mnt/c.sh
chroot /mnt /bin/bash
