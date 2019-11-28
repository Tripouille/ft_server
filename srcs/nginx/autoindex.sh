if [ $# = 1 ]
then

	if [ $1 = "on" ]
	then
		echo "Autoindex [\e[32mon\e[39m]"
		sed "s/autoindex off/autoindex on/" /etc/nginx/sites-available/default > temp && mv temp /etc/nginx/sites-available/default
		service nginx restart
	elif [ $1 = "off" ]
	then
		echo "Autoindex [\e[31moff\e[39m]"
		sed "s/autoindex on/autoindex off/" /etc/nginx/sites-available/default > temp && mv temp /etc/nginx/sites-available/default
		service nginx restart
	else
		echo "Usage: autoindex on / autoindex off"
	fi
else
	echo "Usage: autoindex on / autoindex off"
fi
