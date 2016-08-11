# Set up email-confirmation for registration

## Set up rails and devise (Task1)
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

In controller, add - 
In config/routes.rb, add - root 'posts#index'

In config/initializers/devise.rb, change 'delete' to 'get'.

## Email confirmation -

http://stackoverflow.com/questions/8186584/how-do-i-set-up-email-confirmation-with-devise
https://github.com/plataformatec/devise/wiki/How-To:-Add-:confirmable-to-Users
http://www.yiiframework.com/forum/index.php/topic/2327-partialy-resolved-sqlite-and-now/


go to models/user.rb and add ':confirmable'

then -

rails generate migration add_confirmable_to_devise

go to db/migrate/... and add the entire text (replace 'change')

rake db:migrate

set up 'action mailer'


set up action mailer

http://edgeguides.rubyonrails.org/action_mailer_basics.html



## B-email-works:

This demo installs devise and adds email confirmation, etc.

1.	rails new B-email-works


2. Add devise gem -

        vi Gemfile --> add  -- gem 'devise'

3. Install all gems -

        bundle install

4. Install devise components -

        rails generate devise:install
        rails generate devise user
        rails generate devise admin


set up action mailer

http://edgeguides.rubyonrails.org/action_mailer_basics.html

sudo apt-get install sendmail

sendmail or postfix?





5.	email (http://stackoverflow.com/questions/8186584/how-do-i-set-up-email-confirmation-with-devise)
	------

	A. go to models/user.rb and add ':confirmable'

	B. goto db/migration/XXX_devise_create_users.rb and uncomment all '## confirmable'

	OR,

	rails generate migration add_confirmable_to_devise

	go to db/migrate/... and add the entire text from here by replacing 'change'
		https://github.com/plataformatec/devise/wiki/How-To:-Add-:confirmable-to-Users
		http://stackoverflow.com/questions/8186584/how-do-i-set-up-email-confirmation-with-devise

	C. rake db:migrate

	D. 	

	rails generate devise:views User
	rails generate devise:views Admin

	E. set up gmail in config files

	in config/environment.rb, add

	ActionMailer::Base.smtp_settings = {
  		:user_name => 'aabbcc@gmail.com',
  		:password => 'aabbcc',
  		:domain => 'gmail.com',
  		:address => 'smtp.gmail.com',
  		:port => 587,
  		:authentication => :plain,
  		:enable_starttls_auto => true
	}

	in config/environments/development.rb, add

	config.action_mailer.default_url_options = { :host => "www.c4m.com:xxxx" }

	config.action_mailer.smtp_settings = {
		:address              => "smtp.gmail.com",
		:port                 => 587,
		:domain               => "gmail.com",
		:user_name            => "aabbcc@gmail.com",
		:password             => "aabbcc",
		:authentication       => :plain,
		:enable_starttls_auto => true
	}



	custom views
	------------

	https://github.com/plataformatec/devise
	https://github.com/plataformatec/devise/wiki/How-To:-Create-custom-layouts
	http://stackoverflow.com/questions/6646845/customizing-devise-views-in-rails
	"After rails generate devise:views make sure you go into initializers/devise.rb and set config.scoped.views = true. This is explained in the devise documentation at https://github.com/plataformatec/devise as well as in the devise.rb comments."

	
	sign out -
	----------------

	vi config/initializers/devise.rb
	change 'config.sign_out_via = :delete' to 'config.sign_out_via = :get'



6. Pages -

	rails generate scaffold Page name:string title:string content:text

	in config/routes.rb, comment out and modify - "root 'pages#index'"

	in pages_controller.rb, add 'before_action :authenticate_user!'

	clean the functions
	

7. Migration -

	rake db:migrate












rails new blogx
cd blogx
bundle install
rails generate scaffold Post name:string title:string content:text
rake db:migrate
bundle exec rake db:migrate



devise -
----------------

echo "gem 'devise'" >> Gemfile
bundle install      
rails generate devise:install
rails generate devise user

in config/routes.rb

change -  root 'posts#index'

vi config/initializers/devise.rb


locking access -
----------------

in controller, add - before_action :authenticate_user!



sign out -
----------------

vi config/initializers/devise.rb
change delete to get



email confirmation -
---------------------

http://stackoverflow.com/questions/8186584/how-do-i-set-up-email-confirmation-with-devise
https://github.com/plataformatec/devise/wiki/How-To:-Add-:confirmable-to-Users
http://www.yiiframework.com/forum/index.php/topic/2327-partialy-resolved-sqlite-and-now/


go to models/user.rb and add ':confirmable'

then -

rails generate migration add_confirmable_to_devise

go to db/migrate/... and add the entire text (replace 'change')

rake db:migrate

set up 'action mailer'


set up action mailer 

http://edgeguides.rubyonrails.org/action_mailer_basics.html






devise views -
---------------

rails generate devise:views users



layout 

http://guides.rubyonrails.org/layouts_and_rendering.html




---------------------------------------------------------------

bin/rails generate controller welcome index
rails generate scaffold Post name:string title:string content:text

sudo apt-get install sendmail

sendmail or postfix?


  714  rails generate devise:views users
  725  vi app/models/user.rb 
  728  vi db/migrate/20160312095215_devise_create_users.rb 
  729  vi config/routes.rb 
  730  rake db:migrate
rails new blog
vi Gemfile
bundle install

rails generate scaffold Post name:string title:string content:text

rails generate devise:install
rails generate devise user
rails generate devise admin
rails generate devise:views
rake db:migrate

rails s -b 0.0.0.0 -p 80


vi devise.rb 


 2304  cd config
 2306  vi routes.rb 
 2308  rails s -b 0.0.0.0 -p 80
 2310  cd  app/
 2314  vi user.rb 
 2319  rails g migration add_confirmable_to_devise
 2330  rake db:migrate
 2333  cp Gemfile ~
 2334  cd ..
 2335  ls
 2336  ls toy_app/
 2337  rm -rf blog/ new_app_name/
