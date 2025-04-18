## Config owasp container
```bash
owasp:
  image: owasp/security-shepherd
  container_name: owasp
  ports:
      - 83:8443
  networks:
      kali-app-network:
          ipv4_address: 10.0.0.5

docker exec -it -u 0 owasp bash

netstat -tlp
cat /usr/local/tomcat/conf/Security file && echo;

exit

docker exec -it -u 0 ubuntu bash
./startServices
mysql -u root -p
CREATE USER 'admin'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;

localhost:83
```