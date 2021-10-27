FROM	alpine:3.14

RUN		apk update && \
		apk upgrade && \
		apk add mariadb \
		mariadb-client \
		openrc

COPY	./conf/my.cnf /etc/

COPY	./tools/mdb_start.sh .
RUN		chmod +x mdb_start.sh

ENV		TZ=Europe/Moscow

VOLUME	["/var/lib/mysql"]

EXPOSE	3306

CMD		["/bin/sh", "mdb_start.sh"]