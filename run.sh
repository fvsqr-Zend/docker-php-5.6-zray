#!/bin/bash

HOSTNAME=`hostname`
APP_IP=`/sbin/ifconfig eth0| grep 'inet addr:' | awk {'print $2'}| cut -d ':' -f 2`
echo "ServerName $HOSTNAME" >> /etc/apache2/apache2.conf
echo "

********************************************

PHP 5.6 with Z-Ray is ready to use at
http://$APP_IP

The Z-Ray administration site is
available here:
http://$APP_IP:10081

Please note that Z-Ray is currently not
working when requesting
http://localhost:<PORT_MAP_FROM_DOCKER>

********************************************
"

tail -F /var/log/apache2/* &
exec apache2ctl -D FOREGROUND
