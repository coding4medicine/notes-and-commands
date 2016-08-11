# atgc.work steps -

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install nginx

https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-12-04

sudo apt-get install php5-fpm

vi /etc/php5/fpm/php.ini

cgi.fix_pathinfo=0

sudo service php5-fpm restart

vi /etc/php5/fpm/pool.d/www.conf [already right format]

vi /etc/nginx/sites-available/default

sudo service nginx restart

-----------------------------------------------------------------

# rnaseq.work steps -


sudo apt-get update
sudo apt-get upgrade
sudo apt-get install nginx

https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-12-04

sudo apt-get install php5-fpm

vi /etc/php5/fpm/php.ini

cgi.fix_pathinfo=0

vi /etc/php5/fpm/pool.d/www.conf [already right format]

vi /etc/nginx/sites-available/default


