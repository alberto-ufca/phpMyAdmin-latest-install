# phpMyAdmin-latest-install
### Install phpMyAdmin, apache2 and MySQL on Linux
* Official websites used:
*  **[phpMyAdmin](https://www.phpmyadmin.net/)**
*  **[apache2](https://httpd.apache.org/)**
*  **[MySQL](https://mariadb.org/)**
## How to use
**Download and run the script**
```bash
# Open your terminal and log in to a root account

# Clone this repository
$ git clone https://github.com/meaar/phpMyAdmin-latest-install.git

# Go into the repository
$ cd phpMyAdmin-latest-install

# Change the phpMyAdmin.sh file permissions
$ sudo chmod +x phpMyAdmin.sh

# Run the script
$ ./phpMyAdmin.sh
```
**MySQL**
```mysql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'yourpassword';
FLUSH PRIVILEGES;
EXIT;
```
## Important
**If you have difficulty with mysql or fix any errors, open `phpMyAdmin.sh` file for better information.**
