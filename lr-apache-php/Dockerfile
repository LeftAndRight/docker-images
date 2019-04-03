# https://github.com/docker-library/docs/blob/master/php/README.md
FROM php:7.2.9-apache-stretch

# Add some utils
RUN apt-get update \
    && apt-get install -y \
    nano \
    net-tools \
    git \
    dnsutils \
    dos2unix \
    ssmtp \
    && apt-get clean


# Add the production php.ini
# Updates to be made by additional config files
RUN mv $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini

# Enable basic apache modules
RUN a2enmod \
    rewrite \
    request \
    http2 \
    headers \
    ext_filter \
    expires

# Add all source files & fix line endings
COPY ./conf /tmp/conf
RUN find /tmp/conf -type f -print0 | xargs -0 dos2unix


RUN mv /tmp/conf/.bashrc /root/.bashrc \
    && chmod 777 /root/.bashrc

RUN mv /tmp/conf/setup-git /usr/local/bin/lr-apache-php-setup-git \
    && chmod 777 /usr/local/bin/lr-apache-php-setup-git

# Add mail php file, add example config to be overridden
RUN mv /tmp/conf/mail.ini $PHP_INI_DIR/conf.d/mail.ini \
    && mv /tmp/conf/ssmtp.conf /etc/ssmtp/ssmtp.conf \
    && mv /tmp/conf/revaliases /etc/ssmtp/revaliases

RUN rm -rf /tmp/conf