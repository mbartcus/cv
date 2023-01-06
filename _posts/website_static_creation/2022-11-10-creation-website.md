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

Depending on what the website is meant for, today, creating a website is relatively easy. My primary goal for creating this website was sharing a more detailed information about myself—digital cv. Looking forward, I understood that sharing a portfolio with some of my projects, and creating a blog may be interesting for some visitors. Also, I find creating the blog and having all my projects in one place can be very helpful when I want to find or share some information.

Regardless the fact that I know web development, I'm not an experimented web designer, I was looking for a simple way to create my website. There exists different tools and programming languages that we can use for this task. However, the tools that help us in creating the website are limited in their designs. Creating the website from scratch was captivating, however, I think, using CSS and javascript for building nice web designed templates needs a lot of patience and time ressources.

Looking on the web, I realised that creating a **static website** with [Hugo](https://gohugo.io) or [Jekyll](https://jekyllrb.com) was ideal for me because there are a lot of blog and portfolio templates. Also, using one of these gives the possibility of creating content just using the Markdown. Hugo and Jekyll that are also compatible with GitHub pages are very similar. However, the best template I found that was compatible with what I want to create was the [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/) theme disponible with Jekyll.

Sometimes it is difficult to find our selfs and organize the creation of such a website, therefore I write this blog to describe step by step – how to create and publish a portfolio website.

1) First, we require a GitHub account, if you do not have one I strongly recommend you to create an account. You will then create a repository there to save all your website code.
2) Next, you need the [Netlify](https://www.netlify.comaccount) to deploy your site. This can be easily connected to the GitHub account, so that when you make a change on your site and push to GitHub, it will automatically update on Netlify.
3) You then need to [install jekyllrb](https://jekyllrb.com/docs/) on your computer. There are also some [prerequisites](https://jekyllrb.com/docs/installation/) to install before. You can start creating your site here, or use one of the templates that can be found on the internet.

## Jekyll's installation and preparation

To install Jekyll, first we need to make sure all prerequisites are set on our computer. If not, we need to install them. For that run in the terminal, the following commands.
```shell
ruby -v
gem -v
gcc -v
make -v
```
Next, if it is not done, we need to install homebrew with the following command.
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Also, ```chruby``` and ```ruby-install``` is needed to be installed on our computer with to following commands.
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
Congratulations, Jekyll is installed, and now we are ready to create our new website.

## Creating the website on local machine

To create the website it is more than simple, just write in terminal:
```shell
jekyll new my-website
```
This creates a folder in your directory ```my-website```that contains all the website.

To view our website, go to my-website folder and run in terminal
```shell
bundle exec jekyll serve
# => Now browse to http://localhost:4000
```

Here we will add content to our site, but first let us find a template (web theme) that will make our site look nice. You can easily find themes on internet. I use the Minimal Mistakes, that can be downloaded [here](https://github.com/mmistakes/minimal-mistakes). Also, I chose this theme because of it has a vast documentation.

Different types of theme installations are possible, I decide to use remote theme installation. For this, we set the Gemfile as follows:
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

In GitHub, we create our repository and make pushes when some changes of the site is made. Nothing special here :)

### Deployment on Netlify

In Netlify, you click on ***Add new site*** and here you will connect with the GitHub and the repository that contains your site. When the site is created, a random name is created. We can change it. If you want, you can also add a custom domain in Netlify so that your site will be published automatically on your domain.
