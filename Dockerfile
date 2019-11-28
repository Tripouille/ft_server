# *************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    Dockerfile                                       .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: jgambard <marvin@le-101.fr>                +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2019/11/24 15:25:22 by jgambard     #+#   ##    ##    #+#        #
#    Updated: 2019/11/28 15:47:46 by jgambard    ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

FROM debian:buster-slim
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y upgrade

#SHELL
RUN apt-get install -y wget
RUN apt-get install -y vim
RUN apt-get install -y zsh
RUN apt-get install -y curl
RUN apt-get install -y git
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Install nginx
RUN apt-get install -y nginx
COPY srcs/nginx/default /etc/nginx/sites-available/default
COPY srcs/nginx/autoindex.sh .
EXPOSE 80

#Install php requirement and wordpress
RUN apt-get install -y php-fpm php-mysql
ADD srcs/wordpress/ /var/www/html/

#Install mysql
RUN apt-get install -y default-mysql-server
COPY srcs/mysql/setup.sql .

#Install phpmyadmin
RUN apt-get install unzip
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.0-rc1/phpMyAdmin-5.0.0-rc1-all-languages.zip
RUN unzip phpMyAdmin-5.0.0-rc1-all-languages.zip && rm phpMyAdmin-5.0.0-rc1-all-languages.zip
RUN mv phpMyAdmin-5.0.0-rc1-all-languages /usr/share/phpmyadmin
RUN ln -s /usr/share/phpmyadmin /var/www/html
RUN apt-get install -y php-mbstring
COPY srcs/mysql/pma.sql .
COPY srcs/phpmyadmin/config.inc.php /usr/share/phpmyadmin/
RUN mkdir /usr/share/phpmyadmin/tmp && chmod 777 /usr/share/phpmyadmin/tmp

#Setup ssl
COPY srcs/ssl/localhost.crt /etc/ssl/certs/
COPY srcs/ssl/localhost.key /etc/ssl/private/
EXPOSE 443

#COPY and launch run.sh.
COPY srcs/run.sh .
CMD ["sh", "run.sh"];
