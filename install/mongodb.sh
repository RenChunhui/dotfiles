#!/bin/sh

info "Mongodb installing..."

# Tap the MongoDB Homebrew Tap
brew tap mongodb/brew

# Install MongoDB
brew install mongodb-community

# Install MongoDB GUI
brew cask install robo-3t

# Run MongoDB
# brew services start mongodb-community
