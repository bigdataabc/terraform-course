#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo mkdir -p /var/www/html
sudo chmod -R 777 /var/www
echo "<html><h1>Hello, Welcome To My Webpage</h1></html>" > /var/www/html/index.html
sudo service httpd start
sudo chkconfig httpd on
