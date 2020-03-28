FROM wordpress:5.3.2-php7.3-apache

ENV WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST}
ENV WORDPRESS_DB_USER=${WORDPRESS_DB_USER}
ENV WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD}
ENV WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME}
ENV WORDPRESS_TABLE_PREFIX=${WORDPRESS_TABLE_PREFIX}

RUN echo "short_open_tag = Off" > $PHP_INI_DIR/conf.d/short_open_tag.ini

RUN groupadd -g 1000 ec2-user && \    
    useradd -u 1000 -g ec2-user -m ec2-user -G docker_env && \   
    usermod -p "*" ec2-user

EXPOSE 80