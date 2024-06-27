# Database
```sh
service mariadb start

mysql_secure_installation # redefine password

mariadb -u root -p
1234
```

```sql
source /var/www/html/Configurations/database.sql;

SELECT c.name AS customer_name, p.name as product_name, sale.total_price AS order_price
FROM customers AS c
INNER JOIN orders AS sale ON c.id = sale.customer_id
INNER JOIN products AS p ON sale.product_id = p.id;
```

## Configuring MariaDB for Remote Connections on Ubuntu

### Prerequisites
- A server running Ubuntu.
- MariaDB installed on your Ubuntu server.
- Root access to the server.

### Step 1: Update Your System
Before making any changes, it’s a good practice to update your system packages.

```sh
sudo apt update
sudo apt upgrade -y
```

### Step 2: Install MariaDB (if not installed)
If MariaDB is not already installed, you can install it using the following commands:

```sh
sudo apt install mariadb-server -y
sudo systemctl start mariadb
sudo systemctl enable mariadb
```

### Step 3: Configure MariaDB to Allow Remote Connections
1. **Edit the MariaDB Configuration File:**

   Open the MariaDB configuration file using a text editor:

   ```sh
   sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf
   ```

2. **Bind Address:**

   Find the line containing `bind-address`. By default, it is set to `127.0.0.1` which means MariaDB is listening only on localhost. Change it to `0.0.0.0` to allow MariaDB to listen on all IP addresses.

   ```ini
   bind-address = 0.0.0.0
   ```

3. **Save and Close the File:**

   Save the changes and close the file. (In nano, press `CTRL + X`, then `Y`, and then `Enter`).

### Step 4: Allow MariaDB through the Firewall
If you have a firewall running, you need to allow traffic on the MariaDB port (3306 by default).

```sh
sudo ufw allow 3306/tcp
sudo ufw reload
```

### Step 5: Create a User for Remote Connections
Log in to MariaDB as the root user:

```sh
sudo mariadb
```

Create a new user and grant remote access:

```sql
CREATE USER 'remote_user'@'%' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON *.* TO 'remote_user'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;
```

### Step 6: Restart MariaDB Service
Restart the MariaDB service to apply the changes:

```sh
sudo systemctl restart mariadb
```

### Step 7: Test the Remote Connection
From a remote machine, you can test the connection using the `mysql` command-line tool or any MySQL client:

```sh
mysql -u remote_user -p -h your_server_ip
```

Replace `remote_user` with the username you created, `your_server_ip` with the IP address of your MariaDB server, and you will be prompted to enter the password.

### Additional Security Tips
- **Use Strong Passwords:** Ensure that the passwords for your MariaDB users are strong.
- **Limit Access:** Instead of using `%` to allow all hosts, specify the IP address or range that should be allowed to connect.
- **Encrypt Connections:** Consider using SSL/TLS to encrypt connections to your MariaDB server.

By following these steps, you should be able to configure MariaDB to allow remote connections on your Ubuntu server.