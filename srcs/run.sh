service nginx start
service php7.3-fpm start
service mysql start
mysql -u root < setup.sql
rm setup.sql
tail -f /dev/null
