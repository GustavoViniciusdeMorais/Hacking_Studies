FROM archlinux

RUN pacman -Sy python-pip --noconfirm

WORKDIR /var/www/html

ENTRYPOINT ["tail", "-f", "/dev/null"]