#!/usr/bin/env sh
sudo mkdir temp
sudo git clone https://github.com/ChildOfJustice/AngularWithJenkins.git ./temp
sudo cp -R ./temp/dist/mixTestApp/* /var/www/html/
sudo rm -rf temp/

sudo service httpd start

echo 'Now start the apache server on your EC2: $ sudo service httpd start'
echo 'Visit http://<PUBLIC IP>/ to see your application in action.'


