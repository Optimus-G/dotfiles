#!/bin/bash
echo "SYSTEM TYPE: main/test"
read -r system_type
if [ -z "$system_type" ] || [ "$system_type" != "main" ]; then
  system_type="test"
fi
echo "SYSTEM TYPE: $system_type"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd .. && rm -rf yay/

yay -S tuned
sudo systemctl start  tuned
sudo systemctl enable tuned
if [ "$system_type" = "test" ]; then
  tuned-adm profile virtual-guest # for QEMU/KVM
else
  tuned-adm profile desktop
fi

sudo pacman -S adobe-source-code-pro-fonts
sudo pacman -S adobe-source-sans-pro-fonts
sudo pacman -S adobe-source-serif-pro-fonts
sudo pacman -S cantarell-fonts
sudo pacman -S freetype2
sudo pacman -S gnu-free-fonts
sudo pacman -S noto-fonts
sudo pacman -S noto-fonts-extra
sudo pacman -S pango
sudo pacman -S terminus-font
sudo pacman -S ttf-anonymous-pro
sudo pacman -S ttf-carlito
sudo pacman -S ttf-dejavu
sudo pacman -S ttf-droid
sudo pacman -S ttf-fantasque-sans-mono
sudo pacman -S ttf-fira-code
sudo pacman -S ttf-font-awesome
sudo pacman -S ttf-jetbrains-mono
sudo pacman -S ttf-liberation
sudo pacman -S ttf-linux-libertine
sudo pacman -S ttf-opensans
sudo pacman -S ttf-roboto
sudo pacman -S ttf-roboto-mono
sudo pacman -S woff-fira-code
sudo pacman -S woff2-fira-code

sudo pacman -S bluez
sudo pacman -S bluez-cups
sudo pacman -S bluez-utils

sudo pacman -S cups
sudo pacman -S cups-pdf
sudo pacman -S cups-pk-helper
sudo pacman -S foomatic-db-gutenprint-ppds
sudo pacman -S gutenprint
sudo pacman -S simple-scan
sudo pacman -S system-config-printer
sudo systemctl start  org.cups.cupsd.service
sudo systemctl enable org.cups.cupsd.service

if [ "$system_type" = "test" ]; then
  sudo pacman -S xf86-video-fbdev # for QEMU/KVM
else
  sudo pacman -S nvidia-lts
  sudo pacman -S nvidia-utils
  sudo pacman -S opencl-nvidia
  sudo pacman -S xf86-video-nouveau
fi

sudo pacman -S gvfs
sudo pacman -S gvfs-afc
sudo pacman -S gvfs-goa
sudo pacman -S gvfs-google
sudo pacman -S gvfs-gphoto2
sudo pacman -S gvfs-mtp
sudo pacman -S gvfs-nfs
sudo pacman -S gvfs-smb

sudo pacman -S jack

sudo pacman -S ocl-icd
sudo pacman -S opencl-clhpp
sudo pacman -S opencl-headers
sudo pacman -S opencl-mesa

sudo pacman -S xf86-input-synaptics
sudo pacman -S xorg
sudo pacman -S xorg-docs
sudo pacman -S xorg-fonts-cyrillic
sudo pacman -S xorg-server
sudo pacman -S xorg-setxkbmap
sudo pacman -S xorg-xdm
sudo pacman -S xorg-xinit
sudo pacman -S xorg-xmodmap
sudo pacman -S xorg-xrandr

sudo pacman -S catfish
sudo pacman -S scrot
sudo pacman -S xcursor-simpleandsoft
sudo pacman -S xcursor-themes
sudo pacman -S xfce4
sudo pacman -S xfce4-goodies
yay         -S mugshot

sudo pacman -S lightdm
sudo pacman -S lightdm-gtk-greeter
sudo pacman -S lightdm-gtk-greeter-settings
sudo pacman -S numlockx
echo "greeter-setup-script=/usr/bin/numlockx on" | sudo tee -a /etc/lightdm/lightdm.conf
sudo systemctl enable lightdm.service

sudo pacman -S xdg-user-dirs
sudo pacman -S xdg-utils
xdg-user-dirs-update

sudo pacman -S adapta-gtk-theme
sudo pacman -S adwaita-icon-theme
sudo pacman -S arc-gtk-theme
sudo pacman -S arc-icon-theme
sudo pacman -S arc-solid-gtk-theme
sudo pacman -S archlinux-wallpaper
sudo pacman -S materia-gtk-theme
sudo pacman -S papirus-icon-theme
sudo pacman -S xscreensaver
yay         -S ocs-url

sudo pacman -S tmux

sudo pacman -S ecb
sudo pacman -S emacs
sudo pacman -S vim
sudo pacman -S vim-spell-en
sudo pacman -S vim-spell-ru

sudo pacman -S qt5-base
sudo pacman -S qt5ct
yay         -S qt5-styleplugins
echo "export QT_QPA_PLATFORMTHEME=qt5ct"    >> $HOME/.profile
echo "export QT_AUTO_SCREEN_SCALE_FACTOR=0" >> $HOME/.profile

sudo pacman -S a52dec
sudo pacman -S celt
sudo pacman -S faac
sudo pacman -S faad2
sudo pacman -S flac
sudo pacman -S jasper
sudo pacman -S lame
sudo pacman -S libao
sudo pacman -S libdca
sudo pacman -S libdv
sudo pacman -S libmad
sudo pacman -S libmp4v2
sudo pacman -S libmpcdec
sudo pacman -S libmpeg2
sudo pacman -S libogg
sudo pacman -S libtheora
sudo pacman -S libvorbis
sudo pacman -S libxv
sudo pacman -S opencore-amr
sudo pacman -S opus
sudo pacman -S schroedinger
sudo pacman -S speex
sudo pacman -S wavpack
sudo pacman -S x264
sudo pacman -S xvidcore

sudo pacman -S alsa-lib
sudo pacman -S alsa-plugins
sudo pacman -S alsa-utils
sudo pacman -S pavucontrol
sudo pacman -S pulseaudio
sudo pacman -S pulseaudio-alsa
sudo pacman -S pulseaudio-bluetooth
sudo pacman -S pulseaudio-equalizer
sudo pacman -S pulseaudio-jack

sudo pacman -S gst-editing-services
sudo pacman -S gst-libav
sudo pacman -S gst-plugin-gtk
sudo pacman -S gst-plugin-opencv
sudo pacman -S gst-plugin-qmlgl
sudo pacman -S gst-plugins-bad
sudo pacman -S gst-plugins-bad-libs
sudo pacman -S gst-plugins-base
sudo pacman -S gst-plugins-base-libs
sudo pacman -S gst-plugins-espeak
sudo pacman -S gst-plugins-good
sudo pacman -S gst-plugins-ugly
sudo pacman -S gstreamer
sudo pacman -S gstreamermm

sudo pacman -S libcanberra
sudo pacman -S libcanberra-gstreamer
sudo pacman -S libcanberra-pulse
sudo pacman -S sound-theme-freedesktop
yay         -S sound-theme-smooth

sudo pacman -S curl

sudo pacman -S wget

sudo pacman -S xsel
sudo pacman -S xclip
localectl --no-convert set-x11-keymap us,ru "" "" grp:alt_shift_toggle

echo "xrdb -merge .Xresources" >> $HOME/.xinitrc
echo "exec         startxfce4" >> $HOME/.xinitrc

echo "Xft.antialias: true"       >> $HOME/.Xresources
echo "Xft.autohint:  false"      >> $HOME/.Xresources
echo "Xft.dpi:       96"         >> $HOME/.Xresources
echo "Xft.hinting:   true"       >> $HOME/.Xresources
echo "Xft.hintstyle: hintslight" >> $HOME/.Xresources
echo "Xft.lcdfilter: lcddefault" >> $HOME/.Xresources
echo "Xft.rgba:      rgb"        >> $HOME/.Xresources

echo "\$include /etc/inputrc"                     >> $HOME/.inputrc
echo "set bell-style                        none" >> $HOME/.inputrc
echo "set bind-tty-special-chars              on" >> $HOME/.inputrc
echo "set blink-matching-paren                on" >> $HOME/.inputrc
echo "set colored-stats                       on" >> $HOME/.inputrc
echo "set completion-ignore-case              on" >> $HOME/.inputrc
echo "set completion-prefix-display-length     5" >> $HOME/.inputrc
echo "set completion-query-items              10" >> $HOME/.inputrc
echo "set echo-control-characters            off" >> $HOME/.inputrc
echo "set editing-mode                     emacs" >> $HOME/.inputrc
echo "set horizontal-scroll-mode              on" >> $HOME/.inputrc
echo "set mark-directories                    on" >> $HOME/.inputrc
echo "set mark-modified-lines                 on" >> $HOME/.inputrc
echo "set mark-symlinked-directories          on" >> $HOME/.inputrc
echo "set match-hidden-files                  on" >> $HOME/.inputrc
echo "set show-all-if-ambiguous               on" >> $HOME/.inputrc
echo "set show-all-if-unmodified              on" >> $HOME/.inputrc
echo "set visible-stats                       on" >> $HOME/.inputrc

git config --global user.name  "karlkorp"
git config --global user.email "lispgod@gmail.com"

mkdir -p $HOME/.icons
mkdir -p $HOME/.themes

cp $HOME/dotfiles/.bashrc    $HOME
cp $HOME/dotfiles/.emacs     $HOME
cp $HOME/dotfiles/.tmux.conf $HOME
cp $HOME/dotfiles/.vimrc     $HOME

sudo systemctl enable fstrim.timer

if [ -d /data ]; then
  sudo chown "$USER":"$USER" /data

  mkdir -p /data/projects
  mkdir -p /data/qemu
  mkdir -p /data/torrents
fi

curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

reboot
