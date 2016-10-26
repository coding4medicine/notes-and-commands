# Serving password-protected pages


config/routes.rb -

~~~~~~
get "Materials/:url" => "atgcpages#page_protect", :constraints => {:url => /.*/}
~~~~~~

config/environments/* -
~~~~~~
config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX
~~~~~~


controller -
~~~~~~
        def page_protect
                file_path = "#{Rails.root}/Materials/" + params[:url]
                send_file(file_path, type: 'text/html', disposition: 'inline')
        end
~~~~~~


nginx -
~~~~~~
        location /protected {
             alias /user/web/all-sites/Materials;
             internal;
         }

       location /Materials/ {

        proxy_pass http://127.0.0.1:4000;
        proxy_redirect    off;
        proxy_set_header  Host             $http_host;
        proxy_set_header  X-Real-IP        $remote_addr;
        proxy_set_header  X-Forwarded-For  $proxy_add_x_forwarded_for;
        proxy_set_header  X-Sendfile-Type  X-Accel-Redirect;
        proxy_set_header  X-Accel-Mapping  /user/web/all-sites/Materials/=/protected/;
      }
~~~~~~

Rails app needs to be started on port 4000, while nginx runs on port 80.
