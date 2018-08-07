#!/bin/bash

case "$1" in
    start)
        if [ "$2" == "apache2" ]
        then
            printf "Starting $2 server......"
            docker-compose up -d apache2 redis portainer beanstalkd beanstalkd-console mariadb phpmyadmin workspace
        elif [ "$2" == "nginx" ] 
        then
            printf "Starting $2 server......"
            docker-compose up -d nginx redis portainer beanstalkd beanstalkd-console mariadb phpmyadmin workspace
        else
            echo 'Selected server not found.  Choices are apache2 or nginx'
        fi
        ;;
    bash)
        docker-compose exec workspace bash
        ;;
    stop)
        docker-compose stop
        ;;
    *)
        echo don\'t know
        ;;
esac







