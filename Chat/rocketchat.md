# Deploying Meteor application on ubuntu

https://www.digitalocean.com/community/tutorials/how-to-deploy-a-meteor-js-application-on-ubuntu-14-04-with-nginx


# Rocketchat installation

From digitalocean

~~~~~~~~
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update
sudo apt-get install -y npm mongodb-org curl graphicsmagick
sudo npm install -g n
sudo n 0.10.40
curl -L https://rocket.chat/releases/latest/download -o rocket.chat.tgz
tar zxvf rocket.chat.tgz
mv bundle Rocket.Chat
cd Rocket.Chat/programs/server
npm install
cd ../..
sudo apt-get install -y nginx
vi /etc/nginx/default
export ROOT_URL=http://10.0.0.209/
export MONGO_URL=mongodb://localhost:27017/rocketchat
export PORT=3000
cd Rocket.Chat
nohup mongod -dbpath /var/db/  &
nohup node main.js  &
~~~~~~~~

# If admin gets locked out of rocketchat

Password reset and email confirmation.

--------------------------------

https://github.com/RocketChat/Rocket.Chat/issues/766


https://github.com/RocketChat/Rocket.Chat/issues/1502


https://github.com/RocketChat/Rocket.Chat/issues/766#issuecomment-139656453

$ mongo
MongoDB shell version: 3.0.6
connecting to: test
> use rocketchat
switched to db rocketchat
> db.getCollection('rocketchat_settings').find({ _id: 'Accounts_EmailVerification' })
{ "_id" : "Accounts_EmailVerification", "value" : true, "i18nLabel" : "Accounts_EmailVerification", "i18nDescription" : null, "type" : "boolean", "group" : "Accounts", "section" : "Registration", "public" : true }
> db.getCollection('rocketchat_settings').update({ _id: 'Accounts_EmailVerification' }, { $set: { value: false } })
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.getCollection('rocketchat_settings').find({ _id: 'Accounts_EmailVerification' })
{ "_id" : "Accounts_EmailVerification", "value" : false, "i18nLabel" : "Accounts_EmailVerification", "i18nDescription" : null, "type" : "boolean", "group" : "Accounts", "section" : "Registration", "public" : true }

