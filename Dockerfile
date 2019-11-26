# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    Dockerfile                                       .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: jgambard <marvin@le-101.fr>                +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2019/11/24 15:25:22 by jgambard     #+#   ##    ##    #+#        #
#    Updated: 2019/11/26 17:32:32 by jgambard    ###    #+. /#+    ###.fr      #
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
RUN apt-get install -y git
RUN apt-get install -y curl
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Install nginx
RUN apt-get install -y nginx
COPY srcs/nginx/default /etc/nginx/sites-enabled/

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
#WORKDIR /usr/share/phpmyadmin
#RUN cp config.sample.inc.php config.inc.php

#COPY and launch run.sh.
COPY srcs/run.sh .
CMD ["sh", "run.sh"];

#RUN apt-get install --o-install-recommends --no-install-suggests -y ca-certificates libssl1.1
