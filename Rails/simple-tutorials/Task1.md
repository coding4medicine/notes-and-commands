# Set up CRUD website password-protected with devise

## Set up new rails site

~~~~~~
rails new blog
cd blog
bundle install
~~~~~~


## Set up new scaffold

~~~~~~
rails generate scaffold Post name:string title:string content:text
rake db:migrate
~~~~~~


## Set up devise

~~~~~~
echo "gem 'devise'" >> Gemfile
bundle install
rails generate devise:install
rails generate devise user
~~~~~~

## Locking access


In controller, add 

~~~~~~
before_action :authenticate_user!
~~~~~~



## Configure devise

In config/routes.rb, add 

~~~~~~
root 'posts#index'
~~~~~~

For proper sign out (),

In config/initializers/devise.rb, change 'delete' to 'get'.


