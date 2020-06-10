FROM wordpress:5.4.1-php7.3-apache

ENV WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST}
ENV WORDPRESS_DB_USER=${WORDPRESS_DB_USER}
ENV WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD}
ENV WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME}
ENV WORDPRESS_TABLE_PREFIX=${WORDPRESS_TABLE_PREFIX}
ENV WORDPRESS_DEBUG=0
ENV WP_DEBUG_DISPLAY=0

RUN echo "short_open_tag = Off" > $PHP_INI_DIR/conf.d/short_open_tag.ini
RUN echo $"upload_max_filesize = 128M;\npost_max_size = 128M;\nmax_execution_time = 120;\nmemory_limit=128M;" > $PHP_INI_DIR/conf.d/max_upload_size.ini
RUN mkdir /var/www/html/wp-admin || true && chown -R www-data:www-data /var/www/html/wp-admin && chmod -R 0755 /var/www/html/wp-admin
RUN mkdir /var/www/html/wp-content || true && chown -R www-data:www-data /var/www/html/wp-content && chmod -R 0755 /var/www/html/wp-content

ENV WORDPRESS_CONFIG_EXTRA="define('FS_METHOD', 'direct');define('upload_max_size','128M');@ini_set( 'upload_max_size' , '128M' );@ini_set( 'post_max_size', '128M');@ini_set( 'memory_limit', '128M' );"

EXPOSE 80