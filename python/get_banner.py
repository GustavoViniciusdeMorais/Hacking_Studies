import socket

s = socket.socket()

ip = sys.argv[1]
port = sys.argv[2]

s.connect((ip, port))

r = s.recv(1024)

print(r)

s.close()
