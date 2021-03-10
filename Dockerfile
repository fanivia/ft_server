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

FROM alpine:3.12.2
RUN apk update && apk upgrade
RUN apk add nginx
RUN apk add openssl
COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/private/nginx-selfsigned.pem -subj "/C=RF/ST=Moscow/L=Moscow/O=school21/OU=fanivia/CN=my_domain"
COPY ./srcs/init.sh /tmp/
RUN chmod +x /tmp/init.sh
EXPOSE 80 443
CMD ["/tmp/init.sh"]