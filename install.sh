#!/bin/bash
VERSION=op_linux_386_v1.12.3
# Install op
curl "https://cache.agilebits.com/dist/1P/op/pkg/v1.12.3/$VERSION.zip" >> /tmp/op.zip
unzip /tmp/op.zip -d /tmp/$VERSION/

gpg --receive-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
gpg --verify /tmp/$VERSION/op.sig /tmp/$VERSION/op

sudo mv /tmp/$VERSION/op /usr/local/bin/

rm -rf /tmp/$VERSION
rm /tmp/op.zip

echo "Enter 1password username"
read username
eval `op signin my.1password.com $username`

git clone https://github.com/enewbury/workstation.git /tmp/workstation

ansible-galaxy -r /tmp/workstation/requirements.yml install
ansible-playbook -c local -K /tmp/workstation/setup.yml

rm -rf /tmp/workstation

