#!/bin/bash
echo "--- Docker Manager ---";
echo "";

if [ $1 = "-h" ]
then
    echo "Instructions:";
    echo "";
    echo "Use v1 for docker-compose file config. New docker compose version does not need v1 flag.";
    echo "";
    echo " 1- --start [v1]                     will start container by docker-compose file config";
    echo " 1- --stop [v1]                      will stop container by docker-compose file config";
    echo " 3- [container_name] [sh, bash]      will enter container with provided mode";
    echo "";
fi

if [ -n "$1" ]
then
    if [ $1 = "--start" ]
    then
        docker container stop $(docker container ls -aq) && docker network prune -f
        if [ "$2" = "v1" ]; then
            docker-compose up -d --build
        else
            docker compose up -d --build
        fi
    else
        if [ $1 = "--stop" ]
        then
            if [ "$2" = "v1" ]; then
                docker-compose down
            else
                docker compose down
            fi
        fi

        if [ $1 = "--stop-all" ]
        then
            docker container stop $(docker container ls -aq) && docker network prune -f
        fi

        if [ -n "$2" ]
        then
            docker exec -it -u 0 $1 $2
        fi
    fi
else
    echo "Please inform docker container name and enter mode [sh, bash]!";
    echo "";
fi
