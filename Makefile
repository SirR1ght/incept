include srcs/.env

SRCS	=	docker-compose.yml
DCMP	=	docker-compose -f 

all:	up

up:
		mkdir -p $(VOL_WP) && chmod 777 $(VOL_WP)
		mkdir -p $(VOL_DB) && chmod 777 $(VOL_DB)
		cd srcs && $(DCMP) $(SRCS) up -d --build

down:
		cd srcs && $(DCMP) $(SRCS) down --rmi all -v
	
start:
		cd srcs && $(DCMP) $(SRCS) start

stop:
		cd srcs && $(DCMP) $(SRCS) stop

clean:	down
		rm -rf $(VOL_WP)
		rm -rf $(VOL_DB)

re:		clean all