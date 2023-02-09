---
layout: single
title:  "Creation a static website"
date:   2022-11-10 15:38:07 +0100
categories: web static website jekyll netlify github
permalink: "/:categories:title"
toc: true
toc_label: "My Table of Contents"
toc_sticky: true
---

## Introduction

Depending on what the website is meant for, today, building a website is relatively easy. My primary goal in creating this website was to share more detailed information about myself—a digital CV. Looking forward, I realized that sharing a portfolio with some of my projects, and creating a blog may be captivating for some visitors.


Although I know web development, I'm not an experienced web designer, so I was looking for a simple way to build my website. To accomplish this task, we can use a variety of tools and programming languages. However, the tools that help us design a website are limited in their design. I enjoyed creating the website from scratch, but I believe that using CSS and Javascript to design good-looking web templates takes a lot of patience and time.

Looking on the web, I realized that creating a static website with [Hugo](https://gohugo.io) or [Jekyll](https://jekyllrb.com) was ideal for me because there are a lot of blog and portfolio templates. Using one of these will also allow you to write content using just Markdown. Both Hugo and Jekyll are compatible with GitHub pages. However, the most suitable template I found that was compatible with what I wanted to create was the [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/) theme available with Jekyll.

It can be difficult to find ourselves and organize the creation of such a website, so I decided to write this blog to explain step-by-step how to create and publish a portfolio site.

1) First, we require a GitHub account. If you do not have one I strongly recommend you create an account. You will then create a repository there to save all your website code.
2) Next, you need the [Netlify](https://www.netlify.comaccount) to deploy your site. This can be easily connected to the GitHub account so that when you make a change on your site and push it to GitHub, it will automatically update on Netlify.
3) You then need to [install jekyllrb](https://jekyllrb.com/docs/) on your computer. There are also some [prerequisites](https://jekyllrb.com/docs/installation/) to install before. You can start creating your site here, or use one of the templates that can be found on the internet.

## Jekyll's installation and preparation

We need to make sure all prerequisites are met before installing Jekyll. If not, we need to install them. For running in the terminal, run the commands.
```shell
ruby -v
gem -v
gcc -v
make -v
```
Next, we need to install homebrew with the following command.
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Also, ```chruby``` and ```ruby-install``` need to be installed on our computer with to following commands.
```shell
brew install chruby ruby-install xz
ruby-install ruby
```
Configure shell to use chruby.
```shell
echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
echo "chruby ruby-3.1.2" >> ~/.zshrc # run 'chruby' to see actual version
```
If bash is used on your computer, please change .zshrc with .bash_profile

Finally, install Jekyll.
```shell
gem install jekyll
```
Congratulations, Jekyll is installed.

Now we are ready to create our new website.

## Creating the website on local machine

Creating a website is more than simple. Just write in the terminal:
```shell
jekyll new my-website
```
This creates a folder in your directory ```my-website```that contains all the websites.

To view our website, go to my-website folder and run in terminal
```shell
bundle exec jekyll serve
# => Now browse to http://localhost:4000
```

Here we will add content to our site, but first, let us find a template (web theme) that will make our site look nice. You can easily find themes on the internet. I use Minimal Mistakes, which can be downloaded [here](https://github.com/mmistakes/minimal-mistakes). Also, I chose this theme because it has vast documentation.

Different types of theme installations are possible, so I decided to use remote theme installation. For this, we set the Gemfile as follows:
```
source "https://rubygems.org"

gem "github-pages", group: :jekyll_plugins
gem "jekyll-include-cache", group: :jekyll_plugins

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
```

Fetch and update bundled gems by running the following commands in terminal
```shell
bundle install
bundle update
bundle exec jekyll serve
```

Don't forget to update your config.yml file with
```
remote_theme: "mmistakes/minimal-mistakes@4.24.0"
```

## Deploying the Website

### Pushing the website on GitHub

When we make changes to a site, we create our repository on GitHub and push it. Nothing special here. :) By creating a repository, we have a central location where all changes can be tracked and managed. This allows us to easily view and manage the changes we make, as well as share them with other developers. Additionally, using GitHub allows us to easily merge changes from multiple developers, ensuring that all changes are accounted for and up-to-date. 

### Deployment on Netlify

In Netlify, you click on ***Add new site*** , and you will connect with GitHub and the repository that contains your site. When the site is created, a random name is chosen. We can change it. If you want, you can also add a custom domain to Netlify so that your site will be published automatically on your domain.
