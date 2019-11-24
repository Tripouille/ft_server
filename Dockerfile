# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    Dockerfile                                       .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: jgambard <marvin@le-101.fr>                +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2019/11/24 15:25:22 by jgambard     #+#   ##    ##    #+#        #
#    Updated: 2019/11/24 18:38:45 by jgambard    ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

FROM debian:buster-slim

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install --no-install-recommends --no-install-suggests -y ca-certificates libssl1.1
RUN apt-get install -y nginx
RUN apt-get install -y wordpress
RUN apt-get install php-mysql
RUN apt-get install -y php



#RUN apt-get install -y Phpmyadmin
#RUN apt-get install -y MySQL
#RUN apt-get clean && rm -rf /var/lib/apt/lists/* && rm /etc/nginx/sites-enabled/default
CMD ["nginx", "-g", "daemon off;"]
