FROM wordpress:5.4.0-php7.3-apache

ENV WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST}
ENV WORDPRESS_DB_USER=${WORDPRESS_DB_USER}
ENV WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD}
ENV WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME}
ENV WORDPRESS_TABLE_PREFIX=${WORDPRESS_TABLE_PREFIX}
ENV WORDPRESS_DEBUG=0
ENV WP_DEBUG_DISPLAY=0

RUN echo "short_open_tag = Off" > $PHP_INI_DIR/conf.d/short_open_tag.ini
RUN mkdir /var/www/html/wp-admin || true && chown -R www-data:www-data /var/www/html/wp-admin && chmod -R 0755 /var/www/html/wp-admin
RUN mkdir /var/www/html/wp-content || true && chown -R www-data:www-data /var/www/html/wp-content && chmod -R 0755 /var/www/html/wp-content

ENV WORDPRESS_CONFIG_EXTRA="define('FS_METHOD', 'direct');"

EXPOSE 80