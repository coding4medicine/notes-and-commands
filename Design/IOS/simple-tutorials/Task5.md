uploading ssh key
------------------

We will create user-restricted ssh keys. Also, we will create accounts, etc.


> rails new try-ssh

install devise

Then, 

rails generate scaffold Sshkey user_id:integer key:string


try-ssh/app/models/user.rb

has_many :sshkeys

try-ssh/app/models/sshkey.rb
belongs_to :user


Then - 'rake db:migrate'

Also add 'before_action :authenticate_user!' in controller.

Now, users can log in and upload ssh keys.

------------------------------------------------------------

There are three tasks -
(i)	make sure each user can only see, modify his sshkey.
(ii) 	transfer sshkey and use it to allow users to log in.



For (i),

index:

delete -
~~~~~~~~
@sshkeys = Sshkey.all
~~~~~~~~
add -
~~~~~~~~
@sshkeys = current_user.sshkeys.all
~~~~~~~~


show:

add -
~~~~~~~~
if current_user.id != Sshkey.find(params[:id]).user_id
        redirect_to sshkeys_path
    end
~~~~~~~~

edit:

add -
~~~~~~~~
 if current_user.id != Sshkey.find(params[:id]).user_id
        redirect_to sshkeys_path
    end
~~~~~~~~


create:

add -
~~~~~~~~
    @sshkey = Sshkey.new(sshkey_params)
    @sshkey.user_id=current_user.id

    respond_to do |format|
      if @sshkey.save
        filename="keys" + rand(1000000).to_s
        f=File.open("/tmp/keys/"+filename,"w+")
        txt=current_user.email + ' ' + @sshkey.user_id.to_s  + ' ' + @sshkey.key
        f.write(txt)
        f.close
        cmd="scp /tmp/keys/"+filename+" aa@10.0.0.111:keys/"
        value=`#{cmd}`

~~~~~~~~

new:

delete:

update:




------------------------------------------------------------

For (ii) -

Step 1. write sshkeys in tmp folder

Step 2. allow scp without password in the server with bioinfo code, and 
copy the sshkeys to that server from the webserver.

Step 3. use cron in the bioinfo server to create accounts and also 
	copy the keys into various directories.

http://www.thesitewizard.com/general/set-cron-job.shtml


-----------------------------------------------------------------

automate -

(i) create an account 

https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/4/html/Step_by_Step_Guide/s1-starting-create-account.html

(ii) add sshkey to the account

(iii) add necessary files to the account


