# @enewbury has dotfiles

TODO
- [ ] Update the readme
- [ ] Separate out dotfiles to separate repo (dotfiles, mac_setup, linux_setup, cloud_setup)

## install
    
    /usr/bin/env bash \
        <(curl -fsSL https://raw.githubusercontent.com/enewbury/dotfiles/latest/script/install)

This will clone this repo to `~/src/github.com/enewbury` and execute [`script/setup`](script/setup). The path matches conventions from [`ghq`][ghq], which I use to manage all my local projects.

### Next steps

I keep a log of [install issues][install-issues] and potential improvements when
I have the opportunity to run a _clean_ install.

- 2021-06-29: MacBook Pro, macOS 11.4

## Tooling

- [rossmacarthur/sheldon: A fast, configurable, shell plugin manager](https://github.com/rossmacarthur/sheldon)
- [Starship: Cross-Shell Prompt](https://starship.rs/)
- [thoughtbot/rcm: rc file (dotfile) management](https://github.com/thoughtbot/rcm)
- [hlissner/doom-emacs: An Emacs framework for the stubborn martian hacker](https://github.com/hlissner/doom-emacs)
- [asdf - An extendable version manager](https://asdf-vm.com)
- [x-motemen/ghq: Remote repository management made easy][ghq]
- [Homebrew: The Missing Package Manager for macOS (or Linux)](https://brew.sh)


[install-issues]: https://github.com/enewbury/dotfiles/labels/install
[ghq]: https://github.com/x-motemen/ghq
