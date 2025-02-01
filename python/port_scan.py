import socket
import sys

if len(sys.argv) < 2:
    ip='10.0.0.3'
else:
    ip = sys.argv[1]

for port in range(1,65535):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    socket.setdefaulttimeout(1)

    result = s.connect_ex((ip, port))

    if result == 0:
        print("Port {} is open.".format(port))
    
    s.close()