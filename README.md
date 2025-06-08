# terraform-ec2
This is my terraform code to create an ec2 server


## Github steps:

1. Create a new branch
2. make your changes
3. add changes - git add .
4. commit changes - git commit -m "message goes here"
5. puch changes to your new branch - git push origin <branch name>
6. create a pull request
7. merge changes after pull request is approved.



## Installation of a Web Server

# Apache:

https://ubuntu.com/tutorials/install-and-configure-apache#2-installing-apache


1. sudo apt update
2. sudo apt install apache2
3. sudo systemctl status apache2 ** check if it is installed and running **

# NGINX:

https://ubuntu.com/tutorials/install-and-configure-nginx#2-installing-nginx

1. sudo apt update
2. sudo apt install nginx
3. cd /var/www
4. sudo mkdir tutorial
5. cd tutorial
6. sudo "${EDITOR:-vi}" index.html
