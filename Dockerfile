FROM ubuntu:16.04

MAINTAINER jinhyung <mail@jinhyung.kim>

# 기본 설치
RUN apt-get update && apt-get install -y \
  apache2 \
  php \
  libapache2-mod-php \
  php-mcrypt \
  php-mysql \
  mbstring \
  php-gd \
  curl \
  --no-install-recommends

RUN a2enmod rewrite
RUN sed -i ':a;N;$!ba;s/AllowOverride None/AllowOverride All/3' /etc/apache2/apache2.conf

# composer 설치
# RUN curl -sS https://getcomposer.org/installer | php \
#     && mv composer.phar /usr/local/bin/ \
#     && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# apt 리스트 제거
# RUN rm -r /var/lib/apt/lists/*

EXPOSE 80

CMD apachectl -DFOREGROUND
