# Table of contents
- [Table of contents](#table-of-contents)
- [Introduction](#introduction)
- [How to use?](#how-to-use)
  - [Pre-requisites](#pre-requisites)
  - [Steps](#steps)
- [References](#references)
  
# Introduction

`.zshrc` file to be used with 'oh-my-zsh'.

# How to use?

## Pre-requisites

- 'oh-my-zsh' must be installed.
  ```
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```
- Required theme is installed. Refer: [Themes README](themes/README.md)
- 'lsd' must be installed.
  ```
    brew install lsd
  ```
- Required fonts must be installed.
  ```
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
  ```
## Steps

1. Install 'oh-my-zsh':
  ```
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```
2. Replace the contents of [zshrc file](.zshrc) with `~/.zshrc`.

# References

- https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/af-magic.zsh-theme
- https://blog.protein.tech/make-your-macos-terminal-look-great-76dceb96607e