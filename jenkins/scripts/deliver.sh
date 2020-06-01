#!/usr/bin/env sh
cd /var/www/html
sudo git init
sudo git clone https://github.com/ChildOfJustice/AngularWithJenkins.git
sudo cp -R /var/www/html/AngularWithJenkins/dist/mixTestApp/* /var/www/html/
sudo rm -rf AngularWithJenkins/

sudo service httpd start

echo 'Now...'
echo 'Visit http://<PUBLIC IP>/ to see your application in action.'
