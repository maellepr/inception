# script qui sert a creer une database et un utilisateur associe, il sera exec par le Dockerfile
#!/bin/bash
#set -eux

# demarre MySQL
service mariadb start;

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# se log a MariaDB en root et creer la database et l'utilisateur
mysql -u root -p${SQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -u root -p${SQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root -p${SQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root -p${SQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# verifie si le serveur MariaDB est en cours d'exec et accessible
mysqladmin ping -u root -p${SQL_ROOT_PASSWORD} || exit 1
mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown
exec mysqld_safe

echo "MariaDB database and user were created successfully! "
