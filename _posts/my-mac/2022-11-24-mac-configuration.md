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

Each time I reinstall my mac os system I have to do the same installation steps.
It is difficult to remember the necessary tools and the steps to install them, there is why up till now I install them in time the specific tool is needed. However, I noticed that it is better to configure the computer from start and have all the applications installed. There is why I make it more simple by writing this article, explaining what I install, and how I configure my Mac M1 for developing on machine learning and doing data science.

Also, you can find it helpful because of the list of the best founded apps and their configuration can be found in this article. Of course this article will be changed during time, as my experience using the mac os applications.

# Command Line installation

## homebrew & wget

The first thing to install is the **homebrew** that is a package manager.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


Using the homebrew, I install wget.
```bash
brew install wget
```

Next here are the applications, that I found very useful and installed on my mac.

# Applications

1) [Alfred](https://www.alfredapp.com/)
 - type space to find a file
 - opens any app we want
 - type **define** to define any word you want
 - type something to search google directly
 - type **youtube/amazon/google** to search in thees directly
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
Change Appearance settings theme into Windows10 and into controls for shortcut. The first should change between all the applications, and the second should change between the application that is currently active.

9) [Monitor Control](https://github.com/MonitorControl/MonitorControl) allow to modify the brightness of the monitor
10) [App Cleaner](https://freemacsoft.net/appcleaner/) application to delete applications for mac
11) [Rectangle](https://rectangleapp.com) and Mosaic from
12) [Maccy](https://maccy.app) Clipboardmanager to keep the copy history
13) MindNote
14) Be Focused
15) Gifox - application that creates a gif from a recorded zone of your screen
16) [MacDown](https://macdown.uranusjr.com)
17) Bartender 4



I am a Data Scientist, and I work on different projects. To manage environments for a specific project I use anaconda/miniconda. The installation of miniconda on the M1 chip mac is specific so theese steps are only helpful for thoos with a Mac M1 chip.

## miniconda for MAC M1

First we need to verify if we are in arm64 terminal
```bash
> uname -m  
arm64
```

Now we download miniconda with wget:

```bash
wget [https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh](https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh)
```

Start the installation
```bash
sh ./Miniconda3-latest-MacOSX-arm64.sh
```

Once the installation is over we will prompt to run conda init. Here we can repond `yes`.
