#!/bin/sh
# 00-ssh-setup.sh - SSH setup script

set -e  # Exit immediately if a command exits with a non-zero status

# Install SSH client
sudo apt-get install -y openssh-client
eval "$(ssh-agent -s)"  # Start the SSH agent

# Add the private SSH key from the GitLab variable to the SSH agent
echo "$SSH_PRIVATE_KEY" > /tmp/ec2-remote-login-key.pem
chmod 600 /tmp/ec2-remote-login-key.pem # Restrict permissions

# Add server to known hosts to prevent interactive prompts
ssh-keyscan -t ed25519 -H "$SERVER_DNS_OR_IP" >> /tmp/known_hosts 2>/dev/null