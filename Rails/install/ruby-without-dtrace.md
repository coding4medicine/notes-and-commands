sudo apt-get update
sudo apt-get upgrade

sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

-------------

https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-14-04

INSTALL rbenv:

cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

-------------

Brightbox works great -

https://www.brightbox.com/blog/2016/01/06/ruby-2-3-ubuntu-packages/


Alternative - INSTALL ruby after disabling dtrace:

Note: ruby 2.3.0 and 2.3.1 fail using this method.

CONFIGURE_OPTS="--disable-dtrace" rbenv install 2.2.4
rbenv global 2.2.4


-----------------

INSTALL gem without documentation:

You just add following line to your local ~/.gemrc file (it is in your home folder)

echo "gem: --no-document" > ~/.gemrc

gem: --no-document

-----------------

sudo apt-get install node.js


gem install bundler
gem install uglifier

Note: The following command takes a while

gem install rails 
or,
gem install rails --no-document

gem install thin

include thin in gemfile
thin start -p 80


