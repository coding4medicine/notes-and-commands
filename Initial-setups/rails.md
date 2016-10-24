Install brightbox ruby (for ruby 2.3) - 
	sudo apt-get install software-properties-common
	sudo apt-add-repository ppa:brightbox/ruby-ng
	sudo apt-get update
	sudo apt-get install ruby2.3
	ruby -v

Install other libraries -
	sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

Install nodejs -
	curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
	sudo apt-get install -y nodejs

Ruby-dev to compile files -
	sudo apt-get install ruby2.3-dev

Install gem -
	echo "gem: --no-document" > ~/.gemrc
	gem install bundler
	gem install rails

install postgres -
	sudo apt-get install postgresql-client
	sudo apt-get install postgresql postgresql-contrib

	rails new myapp --database=postgresql

	sudo apt-get install libpq-dev
	gem install pg -v '0.19.0'

