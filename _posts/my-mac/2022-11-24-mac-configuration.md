---
layout: single
title:  "My MacOS configuration"
date:   2022-11-24 15:38:07 +0100
categories: installing applications configuration macos
permalink: "/:categories:title"
toc: true
toc_label: "My Table of Contents"
toc_sticky: true
---

Each time I reinstall my Mac OS system I have to do the same installation steps.

It is difficult to remember what tools are needed and how to use them, so I install them as soon as the specific tool is needed. However, I noticed that it is better to configure the computer from the start and have all the applications installed. I made it more simple by writing this article, explaining what I install, and how I configure my Mac M1 for machine learning and data science development.

This article also includes a list of the best-founded apps and their configuration, which may be helpful to you. My experience using Mac OS applications will undoubtedly change this article over time.

# Command Line installation

Creating a bash script to install your Mac OS is a great way to save time and effort. The process is simple: just create a script and run it. This script will install all the necessary tools in just one step, eliminating the need to install them individually. To begin, you will first need to open a terminal window. From there, you can enter the command “bash” followed by the name of the script. This will execute the script, installing all the necessary tools.

So fist create a file with an `.sh` extension (e.g. my-mac-setup.sh). Next, let us open it in a file editor and add the following commands that will install all the required tools.

## homebrew & wget

The first thing to install is **homebrew** which is a package manager.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


Using the homebrew, I install wget.
```bash
brew install wget
```
## miniforge for mac m1
As a data scientist, I work on different projects using Python and one of the most important think to install on my Mac M1 is the a package management system and environment management system for installing and managing packages and dependencies in various programming languages. It allows you to create isolated environments with different versions of packages and dependencies, which can be useful when working on multiple projects or when collaborating with others.

Miniconda provides a way to quickly and easily set up a minimal Python environment with Conda installed, allowing you to install additional packages as needed. This can be useful for data scientists who want more control over their Python environment and who do not need all of the additional packages included in the full Anaconda distribution. To manage environments for a specific project I use Anaconda/Miniconda. The installation of Miniconda on the M1 chip Mac is specific so these steps are only helpful for those with a Mac M1 chip.

We need to make sure we're in arm64 mode first
```bash
> uname -m  
arm64
```

Also we install Miniforge with the following commands:
```bash
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh
bash Miniforge3-MacOSX-arm64.sh -b -p $HOME/miniforge
rm Miniforge3-MacOSX-arm64.sh

# Add Miniforge to PATH
echo 'export PATH="$HOME/miniforge/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
```

We'll be asked if conda inits once the installation is done. Here, we can say `yes`.


Now we can manage our conda environments.

## alttab application
Also, one of the applications that I install on mu MAC with the command line is - [AltTab](https://alt-tab-macos.netlify.app/)

```bash
brew install --cask alt-tab
```
Switch to the Appearance settings theme in Windows 10 and into the shortcut controls. The first should change between all the applications, and the second should change between the application that is currently active.

Next here are the applications that I found very useful and installed on my Mac.

## rosetta 2
Another tool that can be installed if we need to use some Intel Core applications that are not available for the M1 chip is rosetta. The following command is used to install:

```bash
# Install Rosetta 2 (for running Intel-based applications)
/usr/sbin/softwareupdate --install-rosetta --agree-to-license
```

You can download the file from the following [link](/assets/sh_files/mac_configuration.sh).

# run the bash file

To use this script, save it as a `.sh` file, navigate to the directory where you saved it, and make it executable with the command:

```bash
chmod +x data-science-setup.sh
```

Then run the script with the command

```bash
./data-science-setup.sh
```

# Applications
Next here are the applications that I found very useful to install on my Mac. However, I was not able to install them with bash, therefore I installed them manually.

- [Alfred](https://www.alfredapp.com/)
  - type space to find a file
  - opens any app we want
  - type **define** to define any word you want
  - type something to search Google directly
  - type **youtube/amazon/google** to search in these directly
  - type empty to empty trash

- [Dropzone](https://apps.apple.com/fr/app/dropzone-4/id1485052491?mt=12)

- [Obsidian](https://obsidian.md/)

- [Discord](https://discord.com/download)

- [GitHub Desktop](https://desktop.github.com/)
  
- [CheatSheet](https://www.mediaatelier.com/CheatSheet/)
 
- [Monitor Control](https://github.com/MonitorControl/MonitorControl) allow to modify the brightness of the monitor

-  [App Cleaner](https://freemacsoft.net/appcleaner/) application to delete applications for mac

-  [Rectangle](https://rectangleapp.com) and Mosaic from

-  [Maccy](https://maccy.app) Clipboardmanager to keep the copy history

-  MindNote

-  Be Focused

-  Gifox - application that creates a gif from a recorded area of your screen

-  [MacDown](https://macdown.uranusjr.com)

-  Bartender 4