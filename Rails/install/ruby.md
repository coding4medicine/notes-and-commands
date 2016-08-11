# Brightbox works great for ruby on ubuntu

https://www.brightbox.com/blog/2016/01/06/ruby-2-3-ubuntu-packages/



# INSTALL ruby after disabling dtrace:

Note: ruby 2.3.0 and 2.3.1 fail using this method.

CONFIGURE_OPTS="--disable-dtrace" rbenv install 2.2.4
rbenv global 2.2.4


---------------------------------------------------------------

# INSTALL gem without documentation:

You just add following line to your local ~/.gemrc file (it is in your home folder)

gem: --no-document

