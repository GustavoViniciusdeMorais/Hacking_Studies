FROM kalilinux/kali-rolling

RUN apt update && apt -y install kali-linux-large

ENTRYPOINT ["tail", "-f", "/dev/null"]