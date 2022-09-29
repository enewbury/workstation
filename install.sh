#!/bin/bash
echo "Installing Hombrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Install Ansible..."
brew install ansible


echo "Cloning playbook..."
git clone https://github.com/enewbury/workstation.git /tmp/workstation

cp /tmp/workstation/inventory.cfg.sample /tmp/workstation/inventory.cfg

read -p "Enter 1password username: " op_username
echo "op_username: ${op_username}\n" >> /tmp/workstation/inventory.cfg

read -s -p "Enter 1password master password: " op_password
echo "op_master_password: ${op_password}\n" >> /tmp/workstation/inventory.cfg

read -s -p "Enter 1password secret key: " op_secret_key
echo "op_secret_key: ${op_secret_key}\n" >> /tmp/workstation/inventory.cfg

ansible-galaxy install -r /tmp/workstation/requirements.yml
ansible-playbook -c local -K /tmp/workstation/setup.yml