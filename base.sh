#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Prague /etc/localtime
hwclock --systohc
sed -i '117s/.//' /etc/locale.gen
locale-gen
echo "LANG=cs_CZ.UTF-8" >> /etc/locale.conf
echo "KEYMAP=cz-qwertz" >> /etc/vconsole.conf
echo "wizzard174-desktop" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 wizzard174-desktop.localdomain wizzard174-desktop >> /etc/hosts
echo root:z9pHkT9A | chpasswd

pacman -S -- noconfirm grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools base-devel linux-headers xdg-user-dirs xdg-utils bluez bluez-utils openssh os-prober ntfs-3g terminus-font xorg plasma firefox neofetch nano xf86-video-amdgpu lightdm lightdm-gtk-greeter firefox htop cmatrix

pacman -S kde-applications


grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable sshd
systemctl enable lightdm

useradd -m wizzard174
echo ermanno:z9pHkT9A | chpasswd

echo "wizzard174 ALL=(ALL) ALL" >> /etc/sudoers.d/wizzard174


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
