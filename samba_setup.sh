#!/bin/bash

# Ask username for the Samba 
read -p "Enter the Samba username: " samba_user

# Ask password for the Samba
read -s -p "Enter the Samba password: " samba_pass
echo
read -s -p "Confirm the Samba password: " samba_pass_confirm
echo

# Check if passwords match
if [ "$samba_pass" != "$samba_pass_confirm" ]; then
    echo "Error: Passwords do not match."
    exit 1
fi

# Update system
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Install Samba
echo "Installing Samba..."
sudo apt install -y samba

# Configure smb.conf file
echo "Configuring Samba..."
echo -e "[Desktop]\npath = /home/$samba_user/Desktop\nwriteable = yes\nbrowseable = yes\nvalid users = $samba_user" | sudo tee -a /etc/samba/smb.conf

# Set password for the user
echo "Setting password for $samba_user..."
echo -e "$samba_pass\n$samba_pass" | sudo smbpasswd -a $samba_user

# Install UFW firewall and allow Samba
echo "Installing UFW firewall and allowing Samba..."
sudo apt install -y ufw
sudo ufw allow samba

# Restart Samba service
echo "Restarting Samba service..."
sudo systemctl restart smbd

echo "Samba installation and configuration completed."
