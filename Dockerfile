
FROM ubuntu:latest

RUN apt-get update -y --fix-missing
RUN apt-get install -y git-core apache2 mysql-client php7.0 libapache2-mod-php7.0 graphviz aspell php7.0-pspell php7.0-curl php7.0-gd php7.0-intl php7.0-mysql php7.0-xml php7.0-xmlrpc php7.0-ldap php7.0-zip php7.0-soap php7.0-mbstring

WORKDIR /opt
RUN git clone git://git.moodle.org/moodle.git
WORKDIR /opt/moodle
RUN git init
RUN git branch -a
RUN git branch --track MOODLE_33_STABLE origin/MOODLE_33_STABLE
RUN git checkout MOODLE_33_STABLE
RUN cp -R /opt/moodle /var/www/html/
RUN mkdir /var/moodledata
RUN chown -R www-data /var/moodledata
RUN chmod -R 777 /var/moodledata
RUN chmod -R 0755 /var/www/html/moodle
