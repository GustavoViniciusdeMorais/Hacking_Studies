FROM archlinux

# RUN pacman -Sy python-pip --noconfirm

RUN pacman -Sy gdb --noconfirm 
# this is the gdb memory debug

RUN pacman -Sy pwndbg --noconfirm

# echo 'source /usr/share/pwndbg/gdbinit.py' >> ~/.gdbinit

RUN pacman -Sy gcc --noconfirm

# pacman -S nano --noconfirm

WORKDIR /var/www/html

ENTRYPOINT ["tail", "-f", "/dev/null"]