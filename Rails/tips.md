# Command to run rails locally

rails s -b 0.0.0.0 -p 80


# File upload

rails - file upload

http://guides.rubyonrails.org/form_helpers.html

http://stackoverflow.com/questions/14174044/uploading-a-file-in-rails


# Scaling


https://www.nateberkopec.com/2015/07/29/scaling-ruby-apps-to-1000-rpm.html

# Security

http://rails-sqli.org/

https://github.com/ankane/secure_rails


# Slash routing param

http://stackoverflow.com/questions/4273205/rails-routing-with-a-parameter-that-includes-slash

match "urls/:url" => "urls#index", :constraints => {:url => /.*/}


# Layout

http://alma-connect.github.io/techblog/2015/02/layout-and-rendering-in-rails.html#.VvtmJNIX6Jk

http://stackoverflow.com/questions/22646048/rails-render-a-different-header-just-on-homepage

# App/views/layouts/application.html.erb

<% if current_page?(root_path) %>
    <%= render 'layouts/home_header' %>
<% else %>
    <%= render 'layouts/header' %>
<% end %>

# Connecting two rails models

http://stackoverflow.com/questions/8510596/connecting-two-rails-models

