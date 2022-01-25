#!/bin/bash
sudo apt update
sudo apt install wget -y
sudo apt install unzip -y
sudo apt install apache2 -y
sudo apt install php libapache2-mod-php php-mysql -y
echo "<?php phpinfo(); ?>" >> /var/www/html/phpinfo.php
sudo apt install mariadb-server mariadb-client -y
echo -e "# Fix: AH00076: Failed to enable APR_TCP_DEFER_ACCEPT\nAcceptFilter http none\nAcceptFilter https none\n" >> /etc/apache2/apache2.conf
wget -P /var/www/html "https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip"
unzip -d /var/www/html/phpmyadmin /var/www/html/phpMyAdmin-latest-all-languages.zip
rm /var/www/html/phpMyAdmin-latest-all-languages.zip
cd /var/www/html/phpmyadmin
folder=$(ls)
echo $folder
mv -f /var/www/html/phpmyadmin/$folder/* /var/www/html/phpmyadmin
rm -R /var/www/html/phpmyadmin/$folder
mv config.sample.inc.php config.inc.php
sudo service apache2 restart