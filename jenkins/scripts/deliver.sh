#!/usr/bin/env sh
sudo cd /var/www/html
sudo git init
sudo git clone https://github.com/ChildOfJustice/AngularWithJenkins.git
sudo cp -R ./AngularWithJenkins/dist/mixTestApp/* /var/www/html/
sudo rm -rf AngularWithJenkins/

#sudo /etc/init.d/apache2 start

echo 'Now start the apache server on your EC2: $ sudo service httpd start'
echo 'Visit http://<PUBLIC IP>/ to see your application in action.'
