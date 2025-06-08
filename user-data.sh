#!/bin/bash
sudo apt update -y
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1>Hello Guys, Welcome! This server is running on $(hostname -I)</h1>" > /var/www/html/index.html
