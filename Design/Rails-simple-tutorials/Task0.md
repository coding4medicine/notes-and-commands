# Install ruby on rails on ubuntu 15.04 using Brightbox rails packages

DO NOT USE - sudo apt-get install ruby-full (v 1.9)
because you do not get ruby 2+.


## Step 1 - Install ruby

https://www.brightbox.com/blog/2016/01/06/ruby-2-3-ubuntu-packages/


## Step 2 - Install rails

Follow digitalocean steps from the following section.


# Install ruby on rails in ubuntu 14.04 using digitalocean instructions

The following method (disable-dtrace) does not work on ubuntu 15.04. It is good for
ubuntu 14.04.


https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-14-04

## Step 1 - Install rbenv

~~~~~~~~
sudo apt-get update

sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
~~~~~~~~


~~~~~~~~
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
~~~~~~

## Step 2 - Install ruby

~~~~~~
CONFIGURE_OPTS="--disable-dtrace" rbenv install 2.3.0
rbenv global 2.2.3
~~~~~~


## Step 3 - Install rails

~~~~~~
echo "gem: --no-document" > ~/.gemrc

gem install bundler
gem install rails
gem install uglifier
~~~~~~

## Step 4 -Install node.js

~~~~~~
sudo apt-get install node.js
~~~~~~


