# X-sendfile

This instruction worked after removing ssl -

https://coderwall.com/p/o0alkq/serving-protected-static-content-using-nginx-for-speed-and-rails-server-for-authentication


----------------------------------------

http://ranjithkumar.github.io/blog/2014/09/10/rails-number-send-file-plus-nginx-x-accel-redirect/

https://gist.github.com/Djo/11374407

http://stackoverflow.com/questions/4797820/how-can-i-secure-static-content-in-rails-3

https://github.com/thoughtbot/high_voltage

https://www.redmine.org/boards/1/topics/26338?r=30755

add ":x_sendfile=>true" to the end of "def download" in attachments_controller.rb


# Specifies the header that your server uses for sending files
  config.action_dispatch.x_sendfile_header = "X-Sendfile"


https://gist.github.com/Djo/11374407

https://vijaydev.wordpress.com/2010/12/15/rails-3-and-apache-x-sendfile/

http://stackoverflow.com/questions/7963257/rails-3-0-x-send-file-sending-404-html-instead-of-the-real-file

http://stackoverflow.com/questions/22115011/capistrano-x-sendfile

http://stackoverflow.com/questions/28859649/capistrano-and-xsendfile-configuration


http://thedataasylum.com/articles/how-rails-nginx-x-accel-redirect-work-together.html

http://makandracards.com/makandra/990-speed-up-file-downloads-with-rails-apache-and-x-sendfile

https://gist.github.com/ozgun/4547357

https://mattbrictson.com/accelerated-rails-downloads

http://blog.kiskolabs.com/post/637725747/nginx-rails-send-file

https://www.nginx.com/resources/wiki/start/topics/examples/xsendfile/

