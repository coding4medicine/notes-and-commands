# Serving different static content to users with different permissions

The tutorial uses information from following two pages -

https://coderwall.com/p/o0alkq/serving-protected-static-content-using-nginx-for-speed-and-rails-server-for-authentication

https://gustavocguimaraes.wordpress.com/2014/12/17/role-based-authorization-with-rails-4-enum/comment-page-1/


# Install rails  and nginx. We will be running rails on port 3000 and

Channel it through nginx.

~~~~~~
sudo apt-get install git
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install ruby2.3 ruby2.3-dev
echo "gem: --no-document" > ~/.gemrc
gem install bundler
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
gem install rails
sudo apt-get install nodejs
sudo apt-get install nginx
~~~~~~


## Install rails site and configure nginx

New rails site running on port 3000 -

~~~~~~
rails new blog
cd blog
bundle install
~~~~~~

Nginx is configure into proxy_pass mode -

~~~~~~
upstream rails {
    server localhost:3000;
  }


server {
        listen 80 default_server;
        listen [::]:80 default_server;

        server_name _;

        location / {

            proxy_set_header    X-Real-IP         $remote_addr;
            proxy_set_header    X-Forwarded-For   $proxy_add_x_forwarded_for;
            proxy_set_header    X-Forwarded-Proto http;
            proxy_set_header    Host              $http_host;
            proxy_redirect      off;
                proxy_pass http://rails;
        }
}
~~~~~~

This works.
~~~~~~
nginx -s reload
rails s -b 0.0.0.0 -p 3000
~~~~~~

At this point, you will see nginx redirecting Rails pages.


# Install devise, create three users with access-controlled pages

Controller is plural -

http://stackoverflow.com/questions/646951/singular-or-plural-controller-and-helper-names-in-rails

~~~~~~
rails generate controller pages page0
~~~~~~

~~~~
echo "gem 'devise'" >> Gemfile
bundle install
rails generate devise:install
rails generate devise user
~~~~

Add the following line to app/models/user.rb -
~~~~
enum access_level: [:good, :better, :best]
~~~~

Add the following line to db/migrate/xxx_devise_create_users.rb -
~~~~
 t.integer  :access_level, default: 0, null:false
~~~~

Change 'delete' to 'get' in config/initializers/devise.rb and then run -
~~~~
rake db:migrate
~~~~

Create three users using the web form and then change their permissions using rails console.
~~~~~~
>rails console
irb(main):032:0> @user=User.find(1)
irb(main):033:0> @user.access_level="best"
irb(main):034:0> @user.save
irb(main):035:0> @user=User.find(2)
irb(main):036:0> @user.access_level="better"
irb(main):037:0> @user.save
~~~~~~

Update app/controllers/pages_controller.rb  to -
~~~~~~
class PagesController < ApplicationController

    before_action :authenticate_user!

  def page0

        @var="Good"
        if current_user.best?
                @var="Best"
        end

        if current_user.better?
                @var="Better"
        end
  end
end
~~~~~~

Update app/views/pages/page0.html.erb  to -
~~~~~~
<h1>Pages#page0</h1>

<%= @var =%>
~~~~~~

Update config/routes.rb to -

~~~~~~
Rails.application.routes.draw do
  root 'pages#page0'

  devise_for :users
end
~~~~~~

Now, you will see access control on root page. After log in, different users
will see different text in their views based on their access_level field.


# Create three protected pages and modify nginx

Next, we will create folders. The links /protected/Good/file_good.txt, 
/protected/Better/file_better.txt and /protected/Best/file_best.txt will have different 
access controls for the users.

To accomplish that, the following files need to be changed.


/etc/nginx/sites-available/default -

~~~~
  upstream rails {
    server localhost:3000;
  }

  server {
    listen 80;
    server_name localhost;

   root /var/rails/rails_app;

    location /protected/ {
     alias /var/rails/blog/;  # Append the path with /
      internal;   # Can't access this directory from direct access from the web
    }

    location / {
      proxy_redirect    off;

      proxy_set_header  Host             $http_host;
      proxy_set_header  X-Real-IP        $remote_addr;
      proxy_set_header  X-Forwarded-For  $proxy_add_x_forwarded_for;

      proxy_set_header  X-Sendfile-Type  X-Accel-Redirect;
      proxy_set_header  X-Accel-Mapping  /var/rails/blog/=/protected/;

      proxy_pass http://rails;
    }
}
~~~~

Run 'nginx -s reload'.



In config/routes.rb -
~~~~
Rails.application.routes.draw do
  root 'pages#page0'

  get "Best/:url" => "pages#page_best", :constraints => {:url => /.*/}
  get "Good/:url" => "pages#page_good", :constraints => {:url => /.*/}
  get "Better/:url" => "pages#page_better", :constraints => {:url => /.*/}

  devise_for :users
end
~~~~


In app/controllers/pages_controller.rb -

~~~~
class PagesController < ApplicationController

    before_action :authenticate_user!

  def page0

        @var="Good"
        if current_user.best?
                @var="Best"
        end

        if current_user.better?
                @var="Better"
        end

  end

  def page_good
        if current_user.good?
                file_path = "#{Rails.root}/protected/Good/" + params[:url]
                send_file(file_path, type: 'text/html', disposition: 'inline')
        else
                render plain: "you do not have access"
        end
  end

  def page_better
        if current_user.better?
                file_path = "#{Rails.root}/protected/Better/" + params[:url]
                send_file(file_path, type: 'text/html', disposition: 'inline')
        else
                render plain: "you do not have access"
        end
  end

  def page_best
        if current_user.best?
                file_path = "#{Rails.root}/protected/Best/" + params[:url]
                send_file(file_path, type: 'text/html', disposition: 'inline')
        else
                render plain: "you do not have access"
        end
  end

end
~~~~

app/views/pages/page0.html.erb

~~~~
<h1>Pages#page0</h1>

<%= @var =%>
~~~~


Run -

~~~~~~
rails s -b 0.0.0.0 -p 3000
~~~~~~


# How it works

Request is made to http://example.com/Good/file_good.txt
Request is made to http://example.com/Better/file_better.txt
Request is made to http://example.com/Best/file_best.txt

First the site receives requests for Good, Better, Best.  Nginx sends it to the rails server 
after adding X-accel header.

Within rails, route command send the requests to controllers assigned in route.rb file.

The controller processes, check for permission ( sign_up and good/better/best) and
sends back appropriate response using sendfile.

If the reply is with sendfile, nginx sends the file.
If the reply is with render, rails creates the output.

Nginx receives the request, matches the request path with it's mapping rules in nginx.conf, adds HTTP headers X-Accel-Redirect and X-Accel-Mapping, and sends the request to http://localhost:3000

Rails server receives the request, looks up routes.rb and routes the request to Pages#page_..

The before_filter method in the controller performs the appropriate authentication and authorization config/environments/production.rb tells the rails server to look for X-Accel-Redirect and X-Accel-Mapping in a request

Rails compares the file path that is passed to sendfile with what is defined in the left-hand-side of the X-Accel-Mapping value (ie. /var/rails/blog/=/protected/). If the 2 values match, the controller passes the request back to nginx. Otherwise the controller will send the file back to the client

Nginx receives the request and looks at the right-hand-side of X-Accel-Mapping value (ie. /var/rails/blog/=/protected/). Since the request is internal to the host, nginx loads and sends the file back to the client (see internal in nginx.conf)
