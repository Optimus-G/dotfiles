#!/bin/bash
echo "HOST NAME:"
read -r hostname

echo "USER NAME:"
read -r username

if [ -z "$hostname" ] || [ -z "$username" ]; then
  echo "ERROR!" && return
fi

ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc

{
  echo "en_US ISO-8859-1"
  echo "en_US.UTF-8 UTF-8"
  echo "ru_RU.UTF-8 UTF-8"
} >> /etc/locale.gen
locale-gen
echo "KEYMAP=us"         >> /etc/vconsole.conf
echo "FONT=cyr-sun16"    >> /etc/vconsole.conf
echo "LANG=ru_RU.UTF-8"  >> /etc/locale.conf

echo "$hostname"                                 >> /etc/hostname
{
  echo "127.0.0.1 localhost"
  echo "::1       localhost"
  echo "127.0.1.1 $hostname.localdomain $hostname"
} >> /etc/hosts

mkinitcpio -P

echo "SET THE ROOT PASSWORD:"
passwd

echo "NEW USER: $username"
useradd -m -s /bin/bash "$username"
usermod -aG audio,disk,kvm,lp,optical,scanner,storage,video,wheel "$username"
echo "SET THE $username PASSWORD:"
passwd "$username"
pacman -S sudo
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

pacman -S acpi
pacman -S acpi_call-lts
pacman -S acpid
pacman -S arch-audit
pacman -S avahi
pacman -S bash-completion
pacman -S bind
pacman -S btrfs-progs
pacman -S cloc
pacman -S dbus
pacman -S dhcpcd
pacman -S dialog
pacman -S dosfstools
pacman -S efibootmgr
pacman -S exfat-utils
pacman -S f2fs-tools
pacman -S gpart
pacman -S grub
pacman -S hwinfo
pacman -S inetutils
pacman -S iproute2
pacman -S iw
pacman -S iwd
pacman -S jfsutils
pacman -S libpwquality
pacman -S lsb-release
pacman -S mkinitcpio
pacman -S mtools
pacman -S nano
pacman -S ncdu
pacman -S netctl
pacman -S network-manager-sstp
pacman -S networkmanager
pacman -S networkmanager-openvpn
pacman -S networkmanager-pptp
pacman -S networkmanager-qt
pacman -S networkmanager-vpnc
pacman -S nfs-utils
pacman -S nilfs-utils
pacman -S nss-mdns
pacman -S ntfs-3g
pacman -S ntp
pacman -S os-prober
pacman -S pacman-contrib
pacman -S parallel
pacman -S parted
pacman -S plocate
pacman -S polkit
pacman -S reiserfsprogs
pacman -S rp-pppoe
pacman -S sysfsutils
pacman -S sysstat
pacman -S systemd
pacman -S udftools
pacman -S util-linux
pacman -S which
pacman -S wireless_tools
pacman -S wpa_supplicant

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg

echo     "Base installation was finished!"
read -rp "Press 'enter' to exit..."

sleep 5 && exit
