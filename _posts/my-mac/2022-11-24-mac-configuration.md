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

## homebrew & wget

The first thing to install is **homebrew** which is a package manager.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


Using the homebrew, I install wget.
```bash
brew install wget
```

Next here are the applications that I found very useful and installed on my Mac.

# Applications

1) [Alfred](https://www.alfredapp.com/)
 - type space to find a file
 - opens any app we want
 - type **define** to define any word you want
 - type something to search Google directly
 - type **youtube/amazon/google** to search in these directly
 - type empty to empty trash

2) [Dropzone](https://apps.apple.com/fr/app/dropzone-4/id1485052491?mt=12)

3) [Obsidian](https://obsidian.md/)

4) [Discord](https://discord.com/download)

5) [Atom](https://atom.io)

6) [GitHub Desktop](https://desktop.github.com/)
7) [CheatSheet](https://www.mediaatelier.com/CheatSheet/)
8) [AltTab](https://alt-tab-macos.netlify.app/)

```bash
brew install --cask alt-tab
```
Switch to the Appearance settings theme in Windows 10 and into the shortcut controls. The first should change between all the applications, and the second should change between the application that is currently active.

9) [Monitor Control](https://github.com/MonitorControl/MonitorControl) allow to modify the brightness of the monitor
10) [App Cleaner](https://freemacsoft.net/appcleaner/) application to delete applications for mac
11) [Rectangle](https://rectangleapp.com) and Mosaic from
12) [Maccy](https://maccy.app) Clipboardmanager to keep the copy history
13) MindNote
14) Be Focused
15) Gifox - application that creates a gif from a recorded area of your screen
16) [MacDown](https://macdown.uranusjr.com)
17) Bartender 4



I am a data scientist, and I work on different projects. To manage environments for a specific project I use Anaconda/Miniconda. The installation of Miniconda on the M1 chip Mac is specific so these steps are only helpful for those with a Mac M1 chip.

## miniconda for MAC M1

We need to make sure we're in arm64 mode first
```bash
> uname -m  
arm64
```

With wget, we'll download miniconda:

```bash
wget [https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh](https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh)
```

Start the installation
```bash
sh ./Miniconda3-latest-MacOSX-arm64.sh
```

We'll ask you to run conda init once the installation is done. Here, we can say `yes`.
