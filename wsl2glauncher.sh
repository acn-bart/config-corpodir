#!/bin/sh
# This is a generic launcher for apps on older WSL2g that need dbus service
# this wouldn't be necessary with systemd aware host
export DISPLAY=:0
sudo service dbus start
export XDG_RUNTIME_DIR=/run/user/$(id -u)
sudo mkdir $XDG_RUNTIME_DIR
sudo chmod 700 $XDG_RUNTIME_DIR
sudo chown $(id -un):$(id -gn) $XDG_RUNTIME_DIR
export DBUS_SESSION_BUS_ADDRESS=unix:path=$XDG_RUNTIME_DIR/bus
dbus-daemon --session --address=$DBUS_SESSION_BUS_ADDRESS --nofork --nopidfile --syslog-only &
echo "You are free to launch your fancy app now..."
