#!/bin/bash

# Get the current non-root user
if [ -n "$SUDO_USER" ]; then
    username="$SUDO_USER"
else
    username=$(whoami)
fi

echo "Current user: $username"
/opt/remote_desktop/stop
sudo systemctl stop remote_desktop
sudo systemctl disable remote_desktop
sudo rm /etc/systemd/system/remote_desktop.service
sudo rm -rf /tmp/.X*
