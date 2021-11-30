#!/bin/bash
mkdir -p $XDG_CONFIG_HOME/nvim
stow -d $HOME/dotfiles -t $XDG_CONFIG_HOME/nvim -S nvim
mkdir -p $XDG_CONFIG_HOME/alacritty
stow -d $HOME/dotfiles -t $XDG_CONFIG_HOME/alacritty -S alacritty
mkdir -p $XDG_CONFIG_HOME/enc
stow -d $HOME/dotfiles -t $XDG_CONFIG_HOME/enc -S enc
mkdir -p $XDG_CONFIG_HOME/fish
stow -d $HOME/dotfiles -t $XDG_CONFIG_HOME/fish -S fish
mkdir -p $XDG_CONFIG_HOME/git
stow -d $HOME/dotfiles -t $XDG_CONFIG_HOME/git -S git
mkdir -p $XDG_CONFIG_HOME/gpg
stow -d $HOME/dotfiles -t $XDG_CONFIG_HOME/gpg -S gpg
mkdir -p $XDG_CONFIG_HOME/kitty
stow -d $HOME/dotfiles -t $XDG_CONFIG_HOME/kitty -S kitty
mkdir -p $XDG_CONFIG_HOME/tmux
stow -d $HOME/dotfiles -t $XDG_CONFIG_HOME/tmux -S tmux
mkdir -p $XDG_CONFIG_HOME/zsh
stow -d $HOME/dotfiles -t $XDG_CONFIG_HOME/zsh -S zsh
