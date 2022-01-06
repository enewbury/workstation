# Workstation setup for Linux and Mac

This serves as my "Source of Truth" for the configuration of my workstation computers.  I can mess around with them as much as I like, but anything I want to save permanantly goes in this repo.

## Setting up a new linux install

1. Install ansible using whatever package manager runs on the distro
2. Run the setup script which
    - Installs `op`, the 1Password command line tool
    - runs the one password login which should prompt you for input
    - clones the workstation git repository to the machine's src directory
    - installs ansible galaxy dependencies
    - runs the playbook
3. Log in and and out after running the script, then enable the gnome extensions
4. Install any themes or icons you like!

Example on debian
```
sudo apt update
sudo apt install ansible
curl https://raw.githubusercontent.com/enewbury/workstation/main/linux/install.sh | bash
```

## Features
- RCM for dotfiles
- Asdf with elixir, erlang, node, and ghq
- Auto gpg import
- Auto ssh key setup
- Setup of terminal themes
- Custom keyboard shortcuts and gnome settings


## Mac
Includes some legacy bash scripts for setting up Mac OS
