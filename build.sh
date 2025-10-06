#!/bin/bash
# Base OS setup script for NexusOS

# Install packages
xargs -a config/packages.txt apt-get install -y

# Set wallpaper on first boot
mkdir -p /usr/share/backgrounds/nexusos
cp config/wallpaper.jpg /usr/share/backgrounds/nexusos/wallpaper.jpg

# Auto-set wallpaper at login (for XFCE)
mkdir -p /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml
cat <<EOF > /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml
<?xml version="1.0" encoding="UTF-8"?>
<channel name="xfce4-desktop" version="1.0">
  <property name="backdrop">
    <property name="screen0">
      <property name="monitor0">
        <property name="image-path" type="string" value="/usr/share/backgrounds/nexusos/wallpaper.jpg"/>
      </property>
    </property>
  </property>
</channel>
EOF
