#!/bin/bash

# Install Rosetta 2 (for running Intel-based applications)
#/usr/sbin/softwareupdate --install-rosetta --agree-to-license

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install wget
brew install wget

# Install Miniforge for Apple Silicon
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh
bash Miniforge3-MacOSX-arm64.sh -b -p $HOME/miniforge
rm Miniforge3-MacOSX-arm64.sh

# Add Miniforge to PATH
echo 'export PATH="$HOME/miniforge/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile


# Install R and RStudio
brew install --cask r
brew install --cask rstudio

echo "Setup complete!"
