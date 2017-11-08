FROM ubuntu:16.04

MAINTAINER jinhyung <mail@jinhyung.kim>

# 기본 설치
RUN apt-get update && apt-get install -y \
  apache2 \
  php \
  unzip \
  libapache2-mod-php \
  php-mcrypt \
  php-mysql \
  php-mbstring \
  php-gd \
  php-dev \
  php-curl \
  curl \
  wget \
  build-essential \
  --no-install-recommends

RUN a2enmod rewrite
RUN sed -i ':a;N;$!ba;s/AllowOverride None/AllowOverride All/3' /etc/apache2/apache2.conf

# composer 설치
# RUN curl -sS https://getcomposer.org/installer | php \
#     && mv composer.phar /usr/local/bin/ \
#     && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# apt 리스트 제거
# RUN rm -r /var/lib/apt/lists/*

# Xdebug 설치
RUN wget http://xdebug.org/files/xdebug-2.5.4.tgz --no-check-certificate
RUN tar -xvzf xdebug-2.5.4.tgz
RUN cd xdebug-2.5.4 && phpize
WORKDIR xdebug-2.5.4
RUN /xdebug-2.5.4/configure
RUN make
RUN cp modules/xdebug.so /usr/lib/php/20151012
RUN echo 'zend_extension = /usr/lib/php/20151012/xdebug.so' >> /etc/php/7.0/apache2/php.ini


EXPOSE 80 9000 8443

CMD apachectl -DFOREGROUND
