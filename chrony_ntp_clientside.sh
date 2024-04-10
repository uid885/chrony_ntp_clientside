#!/bin/bash
# Author               : Christo Deale
# Date	               : 2024-04-10
# chrony_ntp_clientside: Utility to setup NTP server on client side

# Prompt for input
read -p "Enter the IP address or hostname of the Chrony server: " CHRONY_SERVER

# Edit Chrony Configuration File
sudo sed -i '/^server/s/^/#/' /etc/chrony.conf   # Comment out existing server lines
sudo sh -c "echo 'server $CHRONY_SERVER iburst' >> /etc/chrony.conf"

# Restart Chrony Service
sudo systemctl restart chronyd

# Verify Synchronization
echo "Synchronization status after configuring Chrony:"
chronyc sources
