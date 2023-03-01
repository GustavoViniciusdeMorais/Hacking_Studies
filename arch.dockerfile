FROM archlinux

RUN pacman -Sy python-pip --noconfirm

# RUN pacman -Sy gdb, this is the gdb memory debug

# RUN pacman -Sy pwndbg

# echo 'source /usr/share/pwndbg/gdbinit.py' >> ~/.gdbinit

# pacman -S gcc

# pacman -S nano

WORKDIR /var/www/html

ENTRYPOINT ["tail", "-f", "/dev/null"]