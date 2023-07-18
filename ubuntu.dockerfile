FROM ubuntu:latest

RUN apt-get update
RUN apt-get install net-tools -y
RUN apt-get install tcpdump -y

ENTRYPOINT ["tail", "-f", "/dev/null"]