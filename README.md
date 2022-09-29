# Workstation setup

This serves as my "Source of Truth" for the configuration of my workstation computers. I can mess around with them as much as I like, but anything I want to save permanently goes in this repo.

## Setting up a new install

1. Run the setup script which
   - Install homebrew/linuxbrew
   - Installs ansible
   - Prompts you for 1password login details
   - Downloads the ansible playbook
   - Installs ansible galaxy dependencies
   - Runs the playbook
2. Log in and and out after running the script, then enable the gnome extensions
3. Install any themes or icons you like!

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/enewbury/workstation/main/install.sh)"
```

Note: the above script isn't working exactly out of the box, but next time I run this on a clean install, I'll track down where it's going wrong. It's only a few lines, so feel free to run the steps manually.

## Features

- RCM for dotfiles
- Asdf with elixir, erlang, node
- Auto gpg import
- Auto ssh key setup
- Custom keyboard shortcuts and gnome settings
- Install favorite apps and utilities
