# Set up email-confirmation for registration

Useful links -

http://stackoverflow.com/questions/8186584/how-do-i-set-up-email-confirmation-with-devise
https://github.com/plataformatec/devise/wiki/How-To:-Add-:confirmable-to-Users

## Install sendmail

This is needed, if the server does not have sendmail.

~~~~
sudo apt-get install sendmail
~~~~

We are choosing sendmail over postfix.


## Set up rails and devise (Task1 + confirmable)
~~~~
rails new blog
cd blog
bundle install
rails generate scaffold Post name:string title:string content:text
rake db:migrate
echo "gem 'devise'" >> Gemfile
bundle install
rails generate devise:install
rails generate devise user
~~~~

In app/controllers/posts_controller.rb, add -  before_action :authenticate_user!
In config/routes.rb, add - root 'posts#index'
In config/initializers/devise.rb, change 'delete' to 'get'.
In app/models/user.rb and add ':confirmable' on line 4.
In db/migrate/xxx_devise_create_users.rb, uncomment the lines below 'confirmable.

Then,
~~~~
rake db:migrate
~~~~

## If you forget to add ':confirmable' before running previous migration

It is also possible to add 'confirmable' later in devise after completing 'Task1'.
The method to do that is -

1.	In app/models/user.rb and add ':confirmable' on line 4.

2. Generate migration for confirmable.

~~~~
rails generate migration add_confirmable_to_devise
~~~~

3. Then run - rake db:migrate

## Setting up shell variables

In .bashrc, add -

~~~~
export SECRET_KEY_BASE='..............'

export STRIPE_SECRET_KEY='sk_.....'
export STRIPE_PUBLISHABLE_KEY='pk_....'

export MAIL_EMAIL='aaa@gmail.com'
export MAIL_PWD='qqqqqqq'
~~~~

You may have to run .bashrc manually.

http://hayne.net/MacDev/Notes/unixFAQ.html#shellStartup




## Setting up ActionMailer

Use only the gmail information from the following link. Also remember to 
allow access for 'low security apps' in gmail.


http://edgeguides.rubyonrails.org/action_mailer_basics.html


In config/environment.rb, add -

~~~~
ActionMailer::Base.smtp_settings = {
       :user_name => ENV['MAIL_EMAIL'],
       :password => ENV['MAIL_PWD'],
       :domain => 'gmail.com',
       :address => 'smtp.gmail.com',
       :port => 587,
       :authentication => :plain,
       :enable_starttls_auto => true
}
~~~~

In config/environments/development.rb, add at bottom -

~~~~
config.action_mailer.default_url_options = { :host => "www.c4m.com:xxxx" }

config.action_mailer.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :domain               => "gmail.com",
      :user_name            => ENV['MAIL_EMAIL'],
      :password             => ENV['MAIL_PWD'],
      :authentication       => :plain,
      :enable_starttls_auto => true
}
~~~~


## custom views

~~~~
rails generate devise:views User
rails generate devise:views Admin
~~~~

or,
~~~~
rails generate devise:views users
~~~~

https://github.com/plataformatec/devise
https://github.com/plataformatec/devise/wiki/How-To:-Create-custom-layouts
http://stackoverflow.com/questions/6646845/customizing-devise-views-in-rails
"After rails generate devise:views make sure you go into initializers/devise.rb and set config.scoped.views = true. This is explained in the devise documentation at https://github.com/plataformatec/devise as well as in the devise.rb comments."

layout 

http://guides.rubyonrails.org/layouts_and_rendering.html


## Run

~~~~~~
rails s -b 0.0.0.0 -p 80
~~~~~~
