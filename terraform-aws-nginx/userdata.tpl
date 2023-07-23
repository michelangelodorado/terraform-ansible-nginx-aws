#!/bin/bash
sudo apt update -y &&
sudo apt install -y nginx
echo "Hello World! NGINX was successfully installed due to a script that automatically ran immediately after the instance was created \n Hence it's a Success!. " > /var/www/html/index.html
