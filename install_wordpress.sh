#! /bin/bash

# Install apache2
sudo apt -y update
sudo apt -y install apache2
sudo systemctl enable apache2

# Install mysql-server
sudo apt -y install mysql-server
sudo systemctl enable mysql-server
sudo mysql_secure_installation

# Install PHP
sudo apt -y install php7.2 php7.2-cli php7.2-mysql php7.2-json php7.2-opcache php7.2-mbstring php7.2-xml php7.2-gd php7.2-curl
sudo systemctl restart apache2

# Create database and user
echo "================================";
echo -e "CREATE DATABASE wordpress CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;"
echo -e "CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'user_password';"
echo -e "GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'change-with-strong-password';"
echo -e "exit"
echo "================================";
sudo mysql

# Intsll wordpress
rm -rf /var/www/html/*
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar xf latest.tar.gz
sudo mv /tmp/wordpress/* /var/www/html/
sudo chown -R www-data: /var/www/html/
sudo systemctl restart apache2



