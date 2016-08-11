# Ruby study notes 

http://rubylearning.com/satishtalim/tutorial.html


# Ruby in twenty minutes

https://www.ruby-lang.org/en/documentation/quickstart/


# Ruby in SmartOS  or OSX

INSTALL ruby after disabling dtrace:

CONFIGURE_OPTS="--disable-dtrace" rbenv install 2.3.0
rbenv global 2.3.0

https://github.com/rbenv/rbenv/issues/708
http://stackoverflow.com/questions/23918889/trying-to-install-ruby-2-1-2-with-rbenv-on-osx-build-failed


# INSTALL gem without documentation:

You just add following line to your local ~/.gemrc file (it is in your home folder)

gem: --no-document

