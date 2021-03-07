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

FROM alpine:3.13.2
RUN apk update && apk upgrade
RUN apk add vim
RUN apk add nginx

RUN apk add openssl

RUN apk add wget
RUN mkdir /var/www/fanivia
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/ssl.key -out /etc/nginx/ssl/ssl.pem -subj "/C=RF/ST=Moscow/L=Moscow/O=school21/OU=fanivia/CN=my_domain"
WORKDIR /var/www/fanivia
COPY srcs/ .



RUN mv nginx.conf /etc/nginx/sites-available/default
RUN chmod +x *.sh
EXPOSE 80 443
CMD ["bash", "init.sh"]
