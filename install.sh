#!/bin/bash
echo "Installing Hombrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if [ $(uname) == "Darwin" ]; then
    brew install 1password-cli
else
  os_release=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
  if [[ $os_release == "Fedora Linux" ]]; then
    sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
    sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
    sudo dnf check-update -y 1password-cli && sudo dnf install 1password-cli
  elif [[ $os_release == "Ubuntu Linux" ]]; then
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | sudo tee /etc/apt/sources.list.d/1password.list 
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
    sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
    sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

    sudo apt update && sudo apt install 1password-cli
  fi
fi

eval $(op signin)

if [[ $(uname) == "Darwin" ]]; then
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/parallels/.bash_profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

echo "Install Ansible..."
brew install ansible

echo "Cloning playbook..."
git clone https://github.com/enewbury/workstation.git /tmp/workstation

cd /tmp/workstation
ansible-galaxy install -r requirements.yml
ansible-playbook -c local -K setup.yml