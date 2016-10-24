# Installing let's encrypt

https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-14-04

## Install programs

~~~~~~
sudo apt-get -y install git bc
sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
~~~~~~

## Get certificates

Add this to /etc/nginx/sites-available/default -

~~~~~~
 location ~ /.well-known {
                allow all;
        }
~~~~~~

and run
~~~~~~
nginx -s reload
~~~~~~

## Run let's encrypt to get certificate

~~~~~~
./letsencrypt-auto certonly -a webroot --webroot-path=/usr/share/nginx/html -d coding4medicine.com -d www.coding4medicine.com
~~~~~~

## Configure nginx with the new certificates

ls .well-known/
ls -la /etc/letsencrypt/live/coding4medicine.com/fullchain.pem

