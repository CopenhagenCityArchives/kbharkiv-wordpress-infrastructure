FROM wordpress:5.3.2-php7.3-apache

ENV WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST}
ENV WORDPRESS_DB_USER=${WORDPRESS_DB_USER}
ENV WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD}
ENV WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME}
ENV WORDPRESS_TABLE_PREFIX=${WORDPRESS_TABLE_PREFIX}

RUN echo "short_open_tag = Off" > $PHP_INI_DIR/conf.d/short_open_tag.ini
RUN mkdir /var/www/html/wp-admin && chown -R www-data:www-data /var/www/html/wp-admin
RUN mkdir /var/www/html/wp-content && chown -R www-data:www-data /var/www/html/wp-content

EXPOSE 80