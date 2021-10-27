#!/bin/sh

echo "listen = 9000" >> /etc/php7/php-fpm.d/www.conf

mkdir -p /var/www/wordpress
chmod 777 /var/www/wordpress
cd /var/www/wordpress

wp core download	--allow-root \
					--quiet

wp core config		--allow-root \
					--skip-check \
					--dbname=$DB_NAME \
					--dbuser=$DB_USER \
					--dbpass=$DB_PASSWORD \
					--dbhost=$DB_HOST \
					--dbprefix=$DB_PREFIX \
					--quiet

wp core install		--allow-root \
					--url=$DOMAIN_NAME \
					--title="inception" \
					--admin_user="gsusanna" \
					--admin_password="gsusanna13" \
					--admin_email="gsusanna@student.21-school.ru" \
					--quiet

wp user create		park	linkin_park@$DOMAIN_NAME \
					--role=author \
					--first_name=Linkin \
					--last_name=Park \
					--user_pass=rock13 \
					--quiet 

wp user create		door	3_doors_down@$DOMAIN_NAME \
					--role=author \
					--first_name=3_Doors \
					--last_name=Down \
					--user_pass=rock13 \
					--quiet 

php-fpm7 -F -R --nodaemonize;