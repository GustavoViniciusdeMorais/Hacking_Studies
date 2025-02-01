import urllib.request
import sys

if len(sys.argv) < 2:
    ip='10.0.0.3'
else:
    ip = sys.argv[1]

link='http://' + ip + '/index.php'
url=urllib.request.urlopen(link)
print(url.read().decode('utf-8'))