#!/bin/zsh

PKG_CORE=(
	xorg-minimal xauth
	mesa-dri vulkan-loader mesa-vulkan-intel intel-video-accel
	xf86-video-intel xf86-input-libinput
	pipewire bluez libspa-bluetooth
	acpi tlp
	dbus chrony elogind
)

PKG_WM=(
	bspwm
	sxhkd
	alacritty
	rofi
	rofi-emoji
	picom
)

PKG_FONT=(
	dejavu-fonts-ttf
	noto-fonts-cjk
	noto-fonts-emoji
	noto-fonts-ttf
	noto-fonts-ttf-extra
)

PKG_UTILS=(
	exa ripgrep fd fzf bat tmux
	htop lf pfetch
	maim xclip ffmpeg 
	redshift xbacklight
	unzip tar perl-rename 
	mpv zathura sxiv xwallpaper
	wget curl yt-dlp
)

PKG_MISC=(
	xsetroot setxkbmap
	dunst
	xrandr
	opendoas
	ntfs-3g
)

sudo xbps-install -Sy $PKG_CORE $PKG_WM $PKG_FONT $PKG_FONT $PKG_UTILS $PKG_MISC
sudo xbps-install -Sy intel-ucode

# Create folder structure
pushd ~
mkdir -p dev docs media/{shots,vids,wallpapers} src temp .config .cache
popd

# Configure shell
sudo chsh -s /bin/zsh $(whoami)
mkdir -p ~/.cache/zsh
sudo mkdir -p /usr/share/zsh/plugins/fast-syntax-highlighting
sudo git clone https://github.com/zdharma-continuum/fast-syntax-highlighting /usr/share/zsh/plugins/fast-syntax-highlighting

# Configure sound
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/

# Link configs
ln -s ~/sys/bin ~
ln -s ~/sys/{bspwm,sxhkd,alacritty,rofi,bat,lf,picom,tmux,zsh} ~/.config
chmod +x ~/sys/bspwm/bspwmrc
ln -s ~/sys/x11/xinitrc ~/.xinitrc
ln -s ~/sys/zsh/zshenv ~/.zshenv

# Enable services
sudo ln -s /etc/sv/{dbus,chronyd,tlp,bluetoothd,wpa_supplicant} /var/service

# Install nerd fonts
nerd_fonts() {
    echo "Installing nerd fonts"
    ubuntu="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/UbuntuMono.zip"
    jetbrains="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip"
    dist="/usr/share/fonts/custom"

    wget $ubuntu -q -o /dev/null -P ~/tmp
    wget $jetbrains -q -o /dev/null -P ~/tmp

    sudo unzip -q tmp/"*.zip" "*.ttf" -x "*Propo*" "*NL*" -d $dist
    sudo rm -f ~/tmp/{JetBrainsMono.zip,UbuntuMono.zip}
}

nerd_fonts && echo "Nerd fonts installed"

# Reconfigure fonts
sudo xbps-reconfigure -f fontconfig
