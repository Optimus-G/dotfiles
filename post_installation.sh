#!/bin/bash
echo "SYSTEM TYPE: main/test (default: test)"
read -r system_type
if [ -z "$system_type" ] || [ "$system_type" != "main" ]; then
  system_type="test"
fi
echo "SYSTEM TYPE: $system_type"

git clone https://aur.archlinux.org/paru.git
cd paru || return
makepkg -si
cd .. && rm -rf paru/
paru -c && paru -Sc

sudo pacman -S adobe-source-code-pro-fonts
sudo pacman -S adobe-source-sans-pro-fonts
sudo pacman -S adobe-source-serif-pro-fonts
sudo pacman -S cantarell-fonts
sudo pacman -S freetype2
sudo pacman -S gnu-free-fonts
sudo pacman -S noto-fonts
sudo pacman -S noto-fonts-extra
sudo pacman -S otf-hermit
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

sudo pacman -S bluez
sudo pacman -S bluez-cups
sudo pacman -S bluez-utils

sudo pacman -S cups
sudo pacman -S cups-pdf
sudo pacman -S cups-pk-helper
sudo pacman -S foomatic-db-gutenprint-ppds
sudo pacman -S gutenprint
sudo pacman -S pappl
sudo pacman -S print-manager
sudo pacman -S skanlite
sudo pacman -S system-config-printer

sudo systemctl enable org.cups.cupsd.service
sudo systemctl start  org.cups.cupsd.service

if [ "$system_type" = "test" ]; then
  sudo pacman -S xf86-video-fbdev # for QEMU/KVM
else
  sudo pacman -S egl-wayland
  sudo pacman -S nvidia-lts
  sudo pacman -S nvidia-settings
  sudo pacman -S nvidia-utils
  sudo pacman -S opencl-nvidia
fi

sudo pacman -S vulkan-extra-layers
sudo pacman -S vulkan-extra-tools
sudo pacman -S vulkan-headers
sudo pacman -S vulkan-icd-loader
sudo pacman -S vulkan-mesa-layers
sudo pacman -S vulkan-tools
sudo pacman -S vulkan-validation-layers

sudo pacman -S gvfs
sudo pacman -S gvfs-afc
sudo pacman -S gvfs-goa
sudo pacman -S gvfs-google
sudo pacman -S gvfs-gphoto2
sudo pacman -S gvfs-mtp
sudo pacman -S gvfs-nfs
sudo pacman -S gvfs-smb

sudo pacman -S jack

sudo pacman -S libinput
sudo pacman -S xf86-input-libinput
sudo pacman -S xf86-input-synaptics

sudo pacman -S ocl-icd
sudo pacman -S opencl-clhpp
sudo pacman -S opencl-headers
sudo pacman -S opencl-mesa
sudo pacman -S pocl

sudo pacman -S xorg
sudo pacman -S xorg-apps
sudo pacman -S xorg-docs
sudo pacman -S xorg-fonts-cyrillic
sudo pacman -S xorg-server
sudo pacman -S xorg-setxkbmap
sudo pacman -S xorg-xdm
sudo pacman -S xorg-xinit
sudo pacman -S xorg-xmodmap
sudo pacman -S xorg-xrandr

sudo pacman -S wayland

sudo pacman -S cronie
sudo pacman -S packagekit-qt5
sudo pacman -S phonon-qt5-gstreamer

for i in {1..5}
do
  echo "=============================="
  echo "$i KDE Plasma installation ..."
  echo "=============================="
  sudo pacman -S plasma-meta
  sudo pacman -S plasma-integration
  sudo pacman -S plasma-wayland-session
  sudo pacman -S kde-system-meta
done

sudo pacman -S dolphin
sudo pacman -S dolphin-plugins
sudo pacman -S kate
sudo pacman -S kcalc
sudo pacman -S kcron
sudo pacman -S kdeconnect
sudo pacman -S kfind
sudo pacman -S konsole
sudo pacman -S krunner

sudo pacman -S sddm
sudo pacman -S sddm-kcm
sudo systemctl enable sddm.service

sudo pacman -S xdg-desktop-portal
sudo pacman -S xdg-desktop-portal-kde
sudo pacman -S xdg-user-dirs
sudo pacman -S xdg-utils
xdg-user-dirs-update

sudo pacman -S archlinux-wallpaper
sudo pacman -S breeze
sudo pacman -S breeze-grub
sudo pacman -S breeze-gtk
sudo pacman -S breeze-icons
sudo pacman -S materia-gtk-theme
sudo pacman -S materia-kde
sudo pacman -S oxygen
sudo pacman -S oxygen-icons
sudo pacman -S oxygen-icons-svg
sudo pacman -S papirus-icon-theme

sudo pacman -S tmux

sudo pacman -S ecb
sudo pacman -S emacs
sudo pacman -S vim
sudo pacman -S vim-spell-en
sudo pacman -S vim-spell-ru

sudo pacman -S qt5-base
sudo pacman -S qt5-doc
sudo pacman -S qt5-examples
sudo pacman -S qt5-tools
sudo pacman -S qt5-wayland
sudo pacman -S qt6-base
sudo pacman -S qt6-doc
sudo pacman -S qt6-examples
sudo pacman -S qt6-tools
sudo pacman -S qt6-wayland

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
sudo pacman -S openal
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

sudo pacman -S curl

sudo pacman -S wget

sudo pacman -S xsel
sudo pacman -S xclip
# localectl --no-convert set-x11-keymap us,ru "" "" grp:alt_shift_toggle

echo "xrdb -merge .Xresources"      >> "$HOME"/.xinitrc
echo "exec         startplasma-x11" >> "$HOME"/.xinitrc

echo "Xft.antialias: true"       >> "$HOME"/.Xresources
echo "Xft.autohint:  false"      >> "$HOME"/.Xresources
echo "Xft.dpi:       96"         >> "$HOME"/.Xresources
echo "Xft.hinting:   true"       >> "$HOME"/.Xresources
echo "Xft.hintstyle: hintslight" >> "$HOME"/.Xresources
echo "Xft.lcdfilter: lcddefault" >> "$HOME"/.Xresources
echo "Xft.rgba:      rgb"        >> "$HOME"/.Xresources

echo "\$include /etc/inputrc"                     >> "$HOME"/.inputrc
echo "set bell-style                        none" >> "$HOME"/.inputrc
echo "set bind-tty-special-chars              on" >> "$HOME"/.inputrc
echo "set blink-matching-paren                on" >> "$HOME"/.inputrc
echo "set colored-stats                       on" >> "$HOME"/.inputrc
echo "set completion-ignore-case              on" >> "$HOME"/.inputrc
echo "set completion-prefix-display-length     5" >> "$HOME"/.inputrc
echo "set completion-query-items              10" >> "$HOME"/.inputrc
echo "set echo-control-characters            off" >> "$HOME"/.inputrc
echo "set editing-mode                     emacs" >> "$HOME"/.inputrc
echo "set horizontal-scroll-mode              on" >> "$HOME"/.inputrc
echo "set mark-directories                    on" >> "$HOME"/.inputrc
echo "set mark-modified-lines                 on" >> "$HOME"/.inputrc
echo "set mark-symlinked-directories          on" >> "$HOME"/.inputrc
echo "set match-hidden-files                  on" >> "$HOME"/.inputrc
echo "set show-all-if-ambiguous               on" >> "$HOME"/.inputrc
echo "set show-all-if-unmodified              on" >> "$HOME"/.inputrc
echo "set visible-stats                       on" >> "$HOME"/.inputrc

git config --global user.name  "karlkorp"
git config --global user.email "lispgod@gmail.com"

mkdir -p "$HOME"/.fonts
mkdir -p "$HOME"/.icons
mkdir -p "$HOME"/.themes

cp "$HOME"/dotfiles/.bashrc    "$HOME"
cp "$HOME"/dotfiles/.emacs     "$HOME"
cp "$HOME"/dotfiles/.tmux.conf "$HOME"
cp "$HOME"/dotfiles/.vimrc     "$HOME"

sudo systemctl enable fstrim.timer

sudo systemctl enable paccache.timer
sudo systemctl start  paccache.timer

if [ -d /data ]; then
  sudo chown "$USER":"$USER" /data

  mkdir -p /data/projects
  mkdir -p /data/qemu
  mkdir -p /data/torrents
fi

echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.d/99-swappiness.conf

curl -fLo "$HOME"/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo     "Configuration was done!"
read -rp "Press 'enter' to reboot..."
sleep 5 && reboot
