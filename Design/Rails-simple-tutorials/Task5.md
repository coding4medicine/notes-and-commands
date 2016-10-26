# uploading ssh key

## Create password-protected account and sshkey scaffold

We will create user-restricted ssh keys. Also, we will create accounts, etc.

~~~~~~~~
rails new try-ssh
~~~~~~~~

Next, install devise following instructions from Task1.

Then, 
~~~~~~~~
rails generate scaffold Sshkey user_id:integer key:string
~~~~~~~~


In app/models/user.rb, add -
~~~~~~~~
has_many :sshkeys
~~~~~~~~

In app/models/sshkey.rb, add -
~~~~~~~~
belongs_to :user
~~~~~~~~
The above changes will link sshkeys to users.

Then - 
~~~~~~~~
rake db:migrate
~~~~~~~~

Also add this in controller to allow users to upload ssh keys only 
after log in.
~~~~~~~~
before_action :authenticate_user!
~~~~~~~~

## Tasks

There are two tasks -
(i)	make sure each user can only see, modify and delete only own sshkeys.
(ii) 	transfer sshkey to new server and and use it to allow users to do ssh.

## Changes in controller functions for (i)

For (i),

index:

replace following line -
~~~~~~~~
@sshkeys = Sshkey.all
~~~~~~~~
with -
~~~~~~~~
@sshkeys = current_user.sshkeys.all
~~~~~~~~


In show, edit, delete, update, add -
~~~~~~~~
if current_user.id != Sshkey.find(params[:id]).user_id
        redirect_to sshkeys_path
    end
~~~~~~~~


create:

change to -
~~~~~~~~
  def create
    @sshkey = Sshkey.new(sshkey_params)
    @sshkey.user_id=current_user.id

    respond_to do |format|
      if @sshkey.save
        filename="keys" + rand(1000000).to_s
        f=File.open("/tmp/keys/"+filename,"w+")
        txt=current_user.email + ' ' + ' ' + Time.now.to_i.to_s + "\n"
        f.write(txt)
        txt=@sshkey.key + "\n"
        f.write(txt)
        f.close
        cmd="scp /tmp/keys/"+filename+" aa@10.0.0.xxx:keys/"
        value=`#{cmd}`
        format.html { redirect_to @sshkey, notice: 'Sshkey was successfully created.' }
        format.json { render :show, status: :created, location: @sshkey }
      else
        format.html { render :new }
        format.json { render json: @sshkey.errors, status: :unprocessable_entity }
      end
    end
  end
~~~~~~~~

new:
unchanged

update:
change to -
~~~~~~~~
  def update
        if current_user.id != Sshkey.find(params[:id]).user_id
                redirect_to sshkeys_path
        end
    respond_to do |format|
      if @sshkey.update(sshkey_params)
        filename="keys" + rand(1000000).to_s
        f=File.open("/tmp/keys/"+filename,"w+")
        txt=current_user.email + ' ' + ' ' + Time.now.to_i.to_s + "\n"
        f.write(txt)
        txt=@sshkey.key + "\n"
        f.write(txt)
        f.close
        cmd="scp /tmp/keys/"+filename+" aa@10.0.0.xxx:keys/"
        value=`#{cmd}`
        format.html { redirect_to @sshkey, notice: 'Sshkey was successfully updated.' }
        format.json { render :show, status: :ok, location: @sshkey }
      else
        format.html { render :edit }
        format.json { render json: @sshkey.errors, status: :unprocessable_entity }
      end
    end
  end
~~~~~~~~



## Transfer key and set up account

For (ii) -

Step 1. write sshkeys in tmp folder

Step 2. allow scp without password in the server with bioinfo code, and 
copy the sshkeys to that server from the webserver.

Step 3. use cron in the bioinfo server to create accounts and also 
	copy the keys into various directories.

http://www.thesitewizard.com/general/set-cron-job.shtml


## Automated acount set up

Automate the following process in the server -

(i) create an account 

https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/4/html/Step_by_Step_Guide/s1-starting-create-account.html

(ii) add sshkey to the account

~~~~~~
useradd new-user -m -s /bin/bash
mkdir /home/new-user/.ssh
cp key/new-user /home/new-user/.ssh/authorized_keys
chown -R new-user:new-user /home/new-user
~~~~~~


(iii) add necessary files to the account

(iv) ssh witout password

http://www.rebol.com/docs/ssh-auto-login.html
http://www.linuxproblem.org/art_9.html


