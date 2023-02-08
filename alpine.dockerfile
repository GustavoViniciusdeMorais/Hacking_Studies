FROM alpine

EXPOSE 80
EXPOSE 21
EXPOSE 8080
EXPOSE 445

RUN apk add --no-cache python3 py3-pip

WORKDIR /var/www/html

ENTRYPOINT ["tail", "-f", "/dev/null"]