service nginx start
service php7.3-fpm start
service mysql start
mysql -u root < setup.sql && rm setup.sql
mysql -u root phpmyadmin < pma.sql && rm pma.sql
tail -f /dev/null
