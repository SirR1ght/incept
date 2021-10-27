FROM	alpine:3.14

RUN		apk update && \
		apk upgrade && \
		apk add nginx \
		openssl

RUN		mkdir /etc/nginx/ssl

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
		-subj "/C=RU/ST=Kazan/L=Kazan/O=21 School/OU=gsusanna/CN=localhost" \
		-keyout /etc/nginx/ssl//gsusanna_key.key \
		-out /etc/nginx/ssl/gsusanna_crt.pem

COPY	conf/nginx.conf /etc/nginx/nginx.conf

RUN		mkdir -p /run/nginx

ENV		TZ=Europe/Moscow

VOLUME	["/var/www"]

EXPOSE	443

CMD		["nginx", "-g", "daemon off;"]