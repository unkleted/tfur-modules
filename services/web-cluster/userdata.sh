#!/bin/bash
# Install Apache, MariaDB (MySQL compatible), and PHP with common extensions
dnf install -y httpd mariadb105-server php php-mysqlnd php-gd php-xml php-mbstring

# Start and enable services to run on boot
systemctl start httpd
systemctl enable httpd
systemctl start mariadb
systemctl enable mariadb

# Set permissions for the web root so ec2-user can manage files
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www && find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;

# Create a test PHP info page
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php

cat << EOF > /var/www/html/index.html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <title>It works! Apache httpd</title>
  </head>
  <body>
    <h1>Hello, World</h1>
    <p>It works so good!</p>
    <p>DB address: ${db_address}</p>
    <p>DB port: ${db_port}</p>
  </body>
</html>
EOF