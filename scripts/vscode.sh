#!/usr/bin/env sh

ln -sf ~/dotfiles/vscode/keybindings.json ~/Library/ApplicationSupport/Code/User/keybindings.json
ln -sf ~/dotfiles/vscode/settings.json ~/Library/ApplicationSupport/Code/User/settings.json
ln -sf ~/dotfiles/vscode/snippets ~/Library/ApplicationSupport/Code/User/snippets

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false # For VS Code Insider
defaults delete -g ApplePressAndHoldEnabled                                      # If necessary, reset global default 
