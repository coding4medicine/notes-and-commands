# Isso commenting

https://posativ.org/isso/
https://github.com/posativ/isso
https://tobrunet.ch/articles/comments-for-a-static-website-with-isso/

First install isso.

https://posativ.org/isso/docs/install/

~~~~~~~~
sudo apt-get install python-setuptools python-virtualenv
virtualenv /opt/isso
source /opt/isso/bin/activate

sudo apt-get install python-dev sqlite3 build-essential
pip install isso
ln -s /opt/isso/bin/isso /usr/local/bin/isso
~~~~~~~~


Run isso as -

~~~~~~~~
isso -c isso.cfg run
~~~~~~~~

where isso.cfg is -

~~~~~~~~
[general]
dbpath = /Issodir/Isso-comments/comments.db
host = http://localhost
[server]
listen = http://localhost:8001/
[moderation]
enabled = false
~~~~~~~~


The page on the site will have -

~~~~~~~~
<html>
<body>
<section id="isso-thread"></section>

<script data-isso="/isso" src="/isso/js/embed.min.js"></script>
</body>
</html>
~~~~~~~~

