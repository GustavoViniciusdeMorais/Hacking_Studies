FROM archlinux

# RUN pacman -Sy python-pip --noconfirm

# RUN pacman -S gdb --noconfirm // this is the gdb memory debug

# RUN pacman -S pwndbg --noconfirm

# echo 'source /usr/share/pwndbg/gdbinit.py' >> ~/.gdbinit

# pacman -S gcc --noconfirm

# pacman -S nano --noconfirm

WORKDIR /var/www/html

ENTRYPOINT ["tail", "-f", "/dev/null"]