import ftplib
import sys

if len(sys.argv) < 2:
    ip='10.0.0.3'
else:
    ip = sys.argv[1]

ftp=ftplib.FTP(ip)
ftp.login('anonymous','')
ftp.pwd()
ftp.dir()