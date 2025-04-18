# Config Metasploitable2

```yaml
metasploitable2:
  image: tleemcjr/metasploitable2
  tty: true
  container_name: metasploitable2
  ports:
      - 83:80
  volumes:
      - ./:/home/gustavo
  networks:
      kali-app-network:
          ipv4_address: 10.0.0.6

docker exec -it -u 0 metasploitable2 sh
nano /var/www/mutillidae/config.inc
netstat -tlp | grep mysql

http://localhost:83/mutillidae/index.php?page=user-info.php
# owasp 10, A1 injection at menu
```
### Metasploitable2 Create DB
```bash
mysql -u root -p # no pass
show databases;
use metasploit;
source /home/gustavo/users.sql;
LOAD DATA INFILE '/home/gustavo/users.txt' into table accounts FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
select * from accounts;
```
### Metasploitable2 users.txt
```
gustavo,gustavo\n
test,test\n
```
### Metasploitable2 users.sql
```
CREATE TABLE accounts (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL
);
```
