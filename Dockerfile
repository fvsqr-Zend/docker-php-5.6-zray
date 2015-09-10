FROM php:5.6-apache
MAINTAINER Jan Burkl <jan@zend.com>

RUN apt-get update && apt-get install -y net-tools

ADD run.sh /run.sh
RUN chmod 775 /*.sh

RUN curl -O http://downloads.zend.com/zray/1208//zray-php5.6-Ubuntu-14.04-x86_64.tar.gz && tar xzvf zray-php5.6-Ubuntu-14.04-x86_64.tar.gz -C /opt && rm zray-php5.6-Ubuntu-14.04-x86_64.tar.gz
RUN cp /opt/zray/zray-ui.conf /etc/apache2/sites-available
RUN a2ensite 000-default.conf && a2ensite zray-ui.conf
RUN a2enmod rewrite

RUN ln -sf /opt/zray/zray.ini /usr/local/etc/php/conf.d/zray.ini
RUN ln -sf /opt/zray/lib/zray.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226/zray.so

RUN chown -R www-data:www-data /opt/zray

EXPOSE 10081

CMD ["/run.sh"]
