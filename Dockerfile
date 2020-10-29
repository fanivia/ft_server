# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fanivia <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/26 14:46:05 by fanivia           #+#    #+#              #
#    Updated: 2020/10/29 19:14:18 by fanivia          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
RUN apt-get update -y
RUN apt-get -y install vim
RUN apt-get -y install nginx
RUN apt-get -y install openssl
RUN apt-get -y install php-fpm php-mysql
RUN apt-get -y install mariadb-server
RUN apt-get -y install php-mbstring php-zip php-gd
RUN apt-get -y install wget
RUN mkdir /var/www/fanivia
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/ssl.key -out /etc/nginx/ssl/ssl.pem -subj "/C=RF/ST=Moscow/L=Moscow/O=school21/OU=fanivia/CN=my_domain"
WORKDIR /var/www/fanivia
COPY srcs/ .
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar xvf latest.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages phpMyAdmin
RUN rm phpMyAdmin-5.0.4-all-languages.tar.gz
RUN rm latest.tar.gz
RUN mv nginx.conf /etc/nginx/sites-available/default
RUN chmod +x *.sh
EXPOSE 80 443
CMD ["bash", "init.sh"]
