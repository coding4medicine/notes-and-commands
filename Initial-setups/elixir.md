Install erlang/elixir -
	sudo apt-get update
	sudo apt-get install nginx
	wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
	sudo apt-get update
	sudo apt-get install esl-erlang
	sudo apt-get install elixir

inotify-tools -
	sudo apt-get install inotify-tools

Install mix -
	mix local.hex
	mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez


postgres and nodejs -
	sudo apt-get install postgresql-client
	sudo apt-get install postgresql postgresql-contrib
	curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
	sudo apt-get install -y nodejs


git and build-essential -
	sudo apt-get install git
	sudo apt-get install build-essential



----------------------------------
some prod commands -

  179  MIX_ENV=prod PORT=4000 ./rel/hello/bin/hello start
  180  MIX_ENV=prod PORT=4000 ./rel/hello/bin/hello ping
  187  MIX_ENV=prod PORT=4000 ./rel/hello/bin/hello stop
  188  MIX_ENV=prod mix release
  189  MIX_ENV=prod mix compile.protocols
  193  MIX_ENV=prod mix compile
  194  MIX_ENV=prod mix release
  309  MIX_ENV=prod mix ecto.create
  311  MIX_ENV=prod PORT=4001 mix phoenix.digest
  312  MIX_ENV=prod PORT=4001 mix phoenix.server
----------------------------------



