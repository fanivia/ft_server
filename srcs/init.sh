#!/bin/bash
service mysql start
mysql < init.sql
service php7.3-fpm start
service nginx start
bash
