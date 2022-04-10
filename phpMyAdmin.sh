#!/bin/bash
sudo apt update
sudo apt install wget -y
sudo apt install unzip -y
sudo apt install apache2 -y
sudo apt install php libapache2-mod-php php-mysql php-mbstring php-xml -y
echo "<?php phpinfo(); ?>" >> phpinfo.php
sudo mv phpinfo.php /var/www/html
sudo apt install mariadb-server mariadb-client -y
# sudo echo -e "# Fix: AH00076: Failed to enable APR_TCP_DEFER_ACCEPT\nAcceptFilter http none\nAcceptFilter https none\n" >> /etc/apache2/apache2.conf
wget "https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip"
unzip -d phpmyadmin phpMyAdmin-latest-all-languages.zip
rm phpMyAdmin-latest-all-languages.zip
directory=$(pwd)
cd phpmyadmin
folder=$(ls)
echo $folder
mv $folder/config.sample.inc.php $folder/config.inc.php
sudo mkdir /var/www/html/phpmyadmin
sudo mv -f $folder/* /var/www/html/phpmyadmin
cd $directory
rm -R phpmyadmin
# secret_password="wDdAIJ*@#AU@#(J#fh@(D)_@(#@(JFPK"
# sudo sed -i "s/\$cfg\['blowfish_secret'\] = ''\;/\$cfg\['blowfish_secret'\] = '$secret_password'\;/" config.inc.php
sudo service mysql stop
sudo service mysql start
sudo mysql_secure_installation
# CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'password';
# GRANT ALL PRIVILEGES ON * . * TO 'new_user'@'localhost';
# FLUSH PRIVILEGES;
sudo service apache2 stop
sudo service apache2 start
echo "phpMyAdmin was successfully installed. access: yourdomain/phpmyadmin"
