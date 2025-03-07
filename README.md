# Samba-Setup
Automatically install and configure Samba to share and access files between devices on the same network.

# Samba Auto Setup Script

This script automates the installation and configuration of Samba on a Linux system. It allows users to set up a Samba shared folder and configure firewall rules easily.

## Features
- Prompts the user for a Samba username and password.
- Installs and configures Samba.
- Sets up a shared folder in the user's Desktop directory.
- Configures UFW firewall rules to allow Samba.
- Restarts Samba service to apply changes.

## Prerequisites
- A Debian-based Linux system (e.g., Ubuntu, Jetson).
- Superuser (sudo) privileges.

## Installation & Usage

### 1. Clone the repository or download the script:
    git clone https://github.com/yunusozpolat/Auto-Setup-Samba.git
    cd samba-setup

### 2. Make the script executable:
    chmod +x samba_setup.sh

### 3. Run the script:
    ./samba_setup.sh

### 4. Follow the on-screen instructions to enter a Samba username and password.

## Verification & Troubleshooting
After running the script, you can verify that Samba and the firewall are correctly configured using the following commands:

### Check Samba Service Status
    systemctl status smbd

If Samba is not running, start it manually:
    sudo systemctl restart smbd

### Check UFW Firewall Status
    sudo ufw status

If Samba is not allowed through the firewall, enable it:
    sudo ufw allow samba

# Notes
If the entered passwords do not match, the script will exit.
The script appends the Samba configuration to /etc/samba/smb.conf.
If Samba is already installed, it will be reconfigured.

# License

This project is licensed under the MIT License.
