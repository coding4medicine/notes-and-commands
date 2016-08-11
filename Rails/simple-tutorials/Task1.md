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
rake db:migrate
~~~~~~

## Locking access


In app/controllers/posts_controller.rb, add in line 3 -

~~~~~~
before_action :authenticate_user!
~~~~~~


## Configure devise

In config/routes.rb, add  in line 2 -

~~~~~~
root 'posts#index'
~~~~~~

For proper sign out (http://coding4medicine.com:21179/users/sign_out)

In config/initializers/devise.rb, change 'delete' to 'get'.

~~~~~~
config.sign_out_via = :get
~~~~~~


## Run 

~~~~~~
rails s -b 0.0.0.0 -p 80
~~~~~~
