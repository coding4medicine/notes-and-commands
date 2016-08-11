# INSTALL ruby after disabling dtrace:

CONFIGURE_OPTS="--disable-dtrace" rbenv install 2.3.0
rbenv global 2.3.0

---------------------------------------------------------------

# INSTALL gem without documentation:

You just add following line to your local ~/.gemrc file (it is in your home folder)

gem: --no-document

