# Installing let's encrypt


# Nginx configuration

  286  sudo apt-get -y install git bc
  287  sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
  288  ls
  289  cd /etc/nginx/
  290  ls
  291  cd sites-available/
  292  ls
  293  vi coding4medicine.com
  294  vi ~/code
  295  cd /opt/
  296  ls
  297  cd letsencrypt/
  298  ls
  299  more ~/code
  300  chmod ~/code
  301  chmod +x ~/code
  302  ls
  303  ls /usr/share/nginx/
  304  ls /usr/share/nginx/html/
  305  vi /etc/nginx/nginx.conf
  306  vi /etc/nginx/sites-available/
  307  vi /etc/nginx/sites-available/coding4medicine.com
  308  nginx -s reload
  309  vi /usr/share/nginx/html/index.html
  310  vi /etc/nginx/sites-available/coding4medicine.com
  311  sudo service nginx reload
  312  vi ~/code
  313  ./letsencrypt-auto certonly -a webroot --webroot-path=/usr/share/nginx/html -d coding4medicine.com -d www.coding4medicine.com
  314  cd /etc/letsencrypt/live/coding4medicine.com/
  315  ls
  316  ls -la
  317  cd
  318  ls
  319  cd /etc/nginx/
  320  ls
  321  cd sites-available/
  322  l
  323  ls
  324  vi coding4medicine.com
  325  sudo service nginx reload
  326  ls
  327  vi code
  328  cd /etc/nginx/
  329  ls
  330  cd sites-available/
  331  ls
  332  vi rnaseq.work
  333  sudo service nginx reload
  334  vi rnaseq.work
  335  cd /var/log/nginx
  336  ls
  337  vi error
  338  vi access
  339  ls
  340  cd /etc/nginx/
  341  ls
  342  vi nginx.conf
  343  exit
  344  ls
  345  cd /etc/nginx/
  346  ls
  347  cd sites-available/
  348  ls
  349  vi rnaseq.work
  350  cd
  351  exit
  352  ls
  353  cd
  354  exit
  355  ls
  356  vi co
  357  vi code
  358  ls
  359  cd /etc/nginx/
  360  ls
  361  cd sites-available/
  362  ls
  363  vi systemix.org
  364  exit
  365  ls
  366  cd /etc/nginx/
  367  ls
  368  cd sites-available/
  369  ls
  370  vi rnaseq.work
  371  nginx -s reload
  372  vi rnaseq.work
  373  sudo service nginx reload
  374  vi rnaseq.work
  375  sudo service nginx reload
  376  vi rnaseq.work
  377  sudo service nginx reload
  378  vi rnaseq.work
  379  sudo service nginx reload
  380  vi rnaseq.work
  381  vi atgc.work
  382  sudo service nginx reload
  383  vi atgc.work
  384  sudo service nginx reload
  385  vi atgc.work
  386  sudo service nginx reload
  387  vi rnaseq.work
  388  vi atgc.work
  389  sudo service nginx reload
  390  cd
  391  exit
  392  ls
  393  more co
  394  more code
  395  date
  396  ls
  397  cd
  398  ls
  399  exit
  400  ls
  401  cd ~www-data/html/
  402  ls
  403  more index.nginx-debian.html
  404  ls
  405  exit
  406  ls
  407  vi commands
  408  ps
  409  history
  410  ls
  411  more commands
  412  more code
  413  cd /opt/letsencrypt/
  414  ls
  415  ls ..
  416  ls -la
  417  more code
  418  cd
  419  ls
  420  history
  421  cd ~www-data/html/
  422  ls
  423  cd /etc/nginx/
  424  ls
  425  cd sites-available/
  426  ls
  427  ls -la
  428  more default
  429  ls ../sites-enabled/
  430  ls
  431  vi arnesoftware.com
  432  ls
  433  more *
  434  ls
  435  vi systemix.org
  436  ls
  437  vi rnaseq.work
  438  vi homolog.us
  439  vi coding4medicine.com
  440  cd /opt/
  441  ls
  442  cd letsencrypt/
  443  ls
  444  cd /etc/
  445  ls
  446  cd /opt/letsencrypt/
  447  ls
  448  cd /etc/nginx/
  449  ls
  450  cd nginx.conf
  451  vi nginx.conf
  452  cd sites-available/
  453  ls
  454  vi arnesoftware.com
  455  ls ~www-data/
  456  cd ~www-data/
  457  ls
  458  pwd
  459  cd /usr/share/nginx/html
  460  ls
  461  pwd
  462  ls -la
  463  more index.html
  464  ls
  465  ls -la
  466  ls .well-known/
  467  ls
  468  cd ~www-data/
  469  ls
  470  cd /etc/nginx/
  471  ls
  472  sudo service nginx reload
  473  cd /opt/
  474  ls
  475  cd letsencrypt/
  476  ls
  477  vi ~/commands
  478  ls ~
  479  vi ~/code
  480  cd /etc/letsencrypt/
  481  ls
  482  cd live/
  483  ls
  484  ls coding4medicine.com/
  485  ls -la coding4medicine.com/
  486  ls
  487  ./letsencrypt-auto certonly -a webroot --webroot-path=/usr/share/nginx/html -d coding4medicine.com -d www.coding4medicine.com
  488  cd /opt/letsencrypt/
  489  ./letsencrypt-auto certonly -a webroot --webroot-path=/usr/share/nginx/html -d coding4medicine.com -d www.coding4medicine.com
  490  clear
  491  ls
  492  cd /etc/nginx/
  493  ls
  494  cd sites-available/
  495  ls
  496  vi coding4medicine.com
  497  ls
  498  cd ~www-data/html/
  499  ls
  500  cd /etc/n
  501  cd /etc/nginx/
  502  ls
  503  cd sites-available/
  504  ls
  505  vi arnesoftware.com
  506  nginx -s reload
  507  vi coding4medicine.com
  508  sudo service nginx reload
  509  systemctl status nginx.service
  510  vi coding4medicine.com
  511  sudo service nginx reload
  512  vi coding4medicine.com
  513  sudo service nginx reload
  514  vi coding4medicine.com
  515  sudo service nginx reload
  516  vi /etc/ports
  517  nmap -sT -O localhost
  518  sudo service nginx reload
  519  exit
  520  ls
  521  cd
  522  ls
  523  cd /etc/letsencrypt/
  524  ls
  525  cd live/
  526  ls -la
  527  cd coding4medicine.com/
  528  ls
  529  ls -la
  530  cd ../../archive/coding4medicine.com/
  531  ls
  532  ls -la
  533  exit
  534  ls
  535  cd /etc/nginx/
  536  ls
  537  cd sites-available/
  538  ls
  539  sudo service nginx reload
  540  vi coding4medicine.com
  541  ls -la /etc/letsencrypt/live/coding4medicine.com/fullchain.pem
  542  more /etc/letsencrypt/live/coding4medicine.com/fullchain.pem
  543  ls -la
  544  vi coding4medicine.com
  545  more /etc/letsencrypt/live/coding4medicine.com/privkey.pem
  546  ls -la
  547  ls
  548  vi coding4medicine.com
  549  ls /usr/share/nginx/
  550  ls /usr/share/nginx/html/
  551  ls -la
  552  nginx -s reload
  553  exit
  554  ls
  555  cd /etc/nginx/
  556  cd sites-available/
  557  ls
  558  vi coding4medicine.com
  559  cd /etc/nginx/
  560  ls
  561  cd sites-available/
  562  ls
  563  vi coding4medicine.com
  564  cd
  565  ls
  566  cd
  567  exit
  568  ls
  569  cd ~www-data/html/
  570  ls
  571  cd /etc/nginx/
  572  ls
  573  cd sites-available/
  574  ls
  575  vi coding4medicine.com
  576  nginx -s reload
  577  exit
  578  cd /etc/n
  579  ls
  580  cd /etc/nginx
  581  ls
  582  cd sites-available/
  583  ls
  584  vi arnesoftware.com
  585  ls
  586  vi rnaseq.work
  587  ls
  588  ls > com
  589  vi com
  590  chmod +x com
  591  ./com
  592  rm -f com
  593  ls
  594  vi arnesoftware.com
  595  vi systemix.org
  596  vi rnaseq.work
  597  vi atgc.work
  598  vi rnaseq.work
  599  exit
  600  ls
  601  cd /opt/letsencrypt/
  602  ls
  603  ./letsencrypt-auto certonly -a webroot --webroot-path=/usr/share/nginx/html -d systemix.org -d www.systemix.org
  604  ./letsencrypt-auto certonly -a webroot --webroot-path=/usr/share/nginx/html -d arnesoftware.com -d www.arnesoftware.com
  605  ./letsencrypt-auto certonly -a webroot --webroot-path=/usr/share/nginx/html -d atgc.work -d www.atgc.work
  606  ./letsencrypt-auto certonly -a webroot --webroot-path=/usr/share/nginx/html -d rnaseq.work -d www.rnaseq.work
  607  ls /etc/letsencrypt/live/
  608  ./letsencrypt-auto certonly -a webroot --webroot-path=/usr/share/nginx/html -d homolog.us -d www.homolog.us
  609  exit
  610  ls
  611  cd /etc/nginx/
  612  ls
  613  cd sites-available/
  614  ls
  615  vi systemix.org
  616  ls
  617  vi rnaseq.work
  618  vi homolog.us
  619  vi rnaseq.work
  620  vi systemix.org
  621  vi homolog.us
  622  vi atgc.work
  623  ls
  624  vi systemix.org
  625  ls
  626  mkdir old
  627  mv * old/
  628  ls
  629  cp old/systemix.org .
  630  vi systemix.org
  631  nginx -s reload
  632  more ~/code
  633  vi ~/code
  634  ls tm
  635  ls old/
  636  vi ~/code
  637  ls
  638  vi systemix.org
  639  nginx -s reload
  640  vi ~/code
  641  vi systemix.org
  642  nginx -s reload
  643  vi systemix.org
  644  nginx -s reload
  645  vi ~/code
  646  vi systemix.org
  647  nginx -s reload
  648  ls
  649  mv old/* .
  650  rmdir old/
  651  ls
  652  nginx -s reload
  653  vi homolog.us
  654  nginx -s reload
  655  ls
  656  vmadm list
  657  exit
  658  ls
  659  cd /etc/nginx/
  660  ls
  661  cd sites-available/
  662  ls
  663  vi rnaseq.work
  664  grep chat *
  665  vi default
  666  nginx -s reload
  667  vi default
  668  nginx -s reload
  669  vi default
  670  ls
  671  vi default
  672  cd ../sites-enabled/
  673  ls
  674  cd ..
  675  ls
  676  vi conf.d/
  677  ls
  678  ls conf.d/
  679  ls
  680  cd
  681  ls
  682  vi co
  683  vi commands
  684  vi code
  685  history

