FROM ubuntu:16.04

MAINTAINER Michael Gibbs

COPY . /var/www/html

RUN composer update
RUN  chmod a+rx -R /var/www/html/docker
RUN /var/www/html/docker/install.bash

COPY ./docker/entrypoint ./docker/apache2-foreground /usr/local/bin/
COPY ./docker/vhost.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT ["entrypoint"]

CMD ["apache2-foreground"]
