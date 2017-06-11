FROM ubuntu:latest

VOLUME ["/var/moodledata"]
EXPOSE 80

COPY config.php /var/www/html/config.php

ENV DEBIAN_FRONTEND noninteractive

ADD ./permissionsForeground.sh /etc/apache2/permissionsForeground.sh

RUN apt-get update -y
RUN apt-get install -y git-core apache2 mysql-client php7.0 libapache2-mod-php7.0 graphviz aspell php7.0-pspell php7.0-curl php7.0-gd php7.0-intl php7.0-mysql php7.0-xml php7.0-xmlrpc php7.0-ldap php7.0-zip php7.0-soap php7.0-mbstring

COPY php.ini /etc/php/7.0/apache2/php.ini

WORKDIR /opt
RUN git clone git://git.moodle.org/moodle.git
WORKDIR /opt/moodle
RUN git init
RUN git branch -a
RUN git branch --track MOODLE_33_STABLE origin/MOODLE_33_STABLE
RUN git checkout MOODLE_33_STABLE
RUN cp -a /opt/moodle/. /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 0755 /var/www/html
RUN rm /var/www/html/index.html
RUN chmod +x /etc/apache2/permissionsForeground.sh

CMD ["/etc/apache2/permissionsForeground.sh"]
