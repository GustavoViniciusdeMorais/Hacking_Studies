import socket
import sys

ports = [21,22,80,3306];

if len(sys.argv) < 2:
    ip='10.0.0.3'
else:
    ip = sys.argv[1]

for port in ports:
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    socket.setdefaulttimeout(1)

    result = s.connect_ex((ip, port))

    if result == 0:
        print("Port {} is open.".format(port))
    
    s.close()
