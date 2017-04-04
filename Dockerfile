FROM library/debian:jessie
MAINTAINER guillerod25@gmail.com

RUN apt-get update && \
    apt-get -y install apache2 php5 php-pear php5-mysql php5-common libapache2-mod-php5 && \		       
    a2enmod rewrite && a2enmod headers && a2enmod ssl && a2dismod status

RUN ln -sf /dev/stdout /var/log/apache2/access.log
RUN ln -sf /dev/stderr /var/log/apache2/error.log



ENTRYPOINT ["apachectl", "-DFOREGROUND"]
EXPOSE 80 443






