# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    Dockerfile                                       .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: jgambard <marvin@le-101.fr>                +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2019/11/24 15:25:22 by jgambard     #+#   ##    ##    #+#        #
#    Updated: 2019/11/25 17:11:08 by jgambard    ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

FROM debian:buster-slim
#ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y upgrade

#SHELL
RUN apt-get install -y wget
RUN apt-get install -y vim
RUN apt-get install -y zsh
RUN apt-get install -y git
RUN apt-get install -y curl
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#REQUIREMENT
RUN apt-get install -y nginx
COPY srcs/nginx/default /etc/nginx/sites-enabled/
ADD srcs/wordpress/ /var/www/html/

RUN apt-get install -y php-fpm php-mysql

#RUN apt-get install --no-install-recommends --no-install-suggests -y ca-certificates libssl1.1
COPY srcs/run.sh .
CMD ["sh", "run.sh"];
