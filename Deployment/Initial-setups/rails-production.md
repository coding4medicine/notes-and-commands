Install brightbox ruby (for ruby 2.3) -
	sudo apt-get install software-properties-common
	sudo apt-add-repository ppa:brightbox/ruby-ng
	sudo apt-get update
	sudo apt-get install ruby2.3

Install other libraries -
	sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

Install nodejs -
	curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
	sudo apt-get install -y nodejs
	sudo apt-get install ruby2.3-dev

Install rails -
	echo "gem: --no-document" > ~/.gemrc
	gem install bundler
	gem install rails

Install postgres -
	sudo apt-get install postgresql-client
	sudo apt-get install postgresql postgresql-contrib

set up postgres and change username/password -
	sudo -u postgres psql
	postgres=# ALTER USER postgres PASSWORD 'postgres';


New app with postgres -
	sudo apt-get install libpq-dev
	gem install pg -v '0.19.0'
	rails new myapp --database=postgresql

Run rails -
	RAILS_ENV=production bundle exec rake db:create
	RAILS_ENV=production bundle exec rake db:migrate
	RAILS_ENV=production bundle exec rake db:seed
	rails server -e production -b 0.0.0.0 -p 80


