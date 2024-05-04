#!/bin/bash

# Get the current non-root user
if [ -n "$SUDO_USER" ]; then
    username="$SUDO_USER"
else
    username=$(whoami)
fi

echo "Current user: $username"

# 1. Define the filename to search for
filename="install_remote_desktop.sh"

# 2. Check if the file exists in the home directory
file_path="/home/$username/$filename"

if [ -f "$file_path" ]; then
    echo "File already exists at: $file_path"
    echo "Closing and cleaning current VNC session"
    sudo systemctl stop remote_desktop
    sudo systemctl disable remote_desktop
    sudo rm /etc/systemd/system/remote_desktop.service
    sudo rm -rf /tmp/.X*
else
    # Download the script from GitHub if the file doesn't exist
    echo "File not found. Downloading from GitHub..."
    curl -s https://raw.githubusercontent.com/wildfoundry/specialprojects-public/remote-desktop/install.bash -o "$file_path"
    echo "File downloaded to: $file_path"
    chown $username:$username "$file_path"
fi

# Change permissions to make the script executable
echo "Preparing clean VNC session"
chmod +x "$file_path"
bash "$file_path"
sudo sed -i 's/127.0.0.1:5901/127.0.0.1:5902/' /opt/remote_desktop/remote_desktop
sudo sed -i 's/1920x1080/800x600/' /opt/remote_desktop/start

/opt/remote_desktop/start
