# Configuring a Firewall for FTP Service on Port 21 in Ubuntu

This guide will walk you through the process of configuring a firewall to allow FTP service on port 21 in Ubuntu and how to connect to the FTP server using the command line after the firewall is up.

## Step 1: Install and Configure the FTP Server

First, you'll need to have an FTP server installed. This example uses vsftpd (Very Secure FTP Daemon).

### Install vsftpd
Open your terminal and run the following command:
```bash
sudo apt update
sudo apt install vsftpd
```

### Configure vsftpd
Edit the vsftpd configuration file:
```bash
sudo nano /etc/vsftpd.conf
```
Make sure the following lines are set correctly:
```plaintext
listen=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES
chroot_local_user=YES
```
Save the file and exit the editor (Ctrl+O, Enter, Ctrl+X).

Restart the vsftpd service to apply the changes:
```bash
sudo systemctl restart vsftpd
```

## Step 2: Configure the Firewall

Ubuntu typically uses UFW (Uncomplicated Firewall) as its default firewall management tool.

### Allow FTP Traffic
To allow FTP traffic on port 21, run the following command:
```bash
sudo ufw allow 21/tcp
```

### Enable the Firewall
If the firewall is not already enabled, enable it with:
```bash
sudo ufw enable
```

### Check the Firewall Status
Verify the firewall status and rules with:
```bash
sudo ufw status
```
You should see an output similar to:
```plaintext
Status: active

To                         Action      From
--                         ------      ----
21/tcp                     ALLOW       Anywhere
21/tcp (v6)                ALLOW       Anywhere (v6)
```

## Step 3: Connect to the FTP Server

With the firewall configured to allow FTP traffic on port 21, you can now connect to your FTP server using the command line.

### Connect via Command Line
Open a terminal and use the `ftp` command:
```bash
ftp <server-ip-address>
```
Replace `<server-ip-address>` with the IP address of your FTP server.

### Example Command Line Session
```bash
ftp 192.168.1.100
```
You will be prompted for a username and password. Use the credentials of a local user on the FTP server.

#### Sample Session:
```bash
ftp 192.168.1.100
Connected to 192.168.1.100.
220 (vsFTPd 3.0.3)
Name (192.168.1.100:your-username): your-username
331 Please specify the password.
Password:
230 Login successful.
ftp>
```

Once logged in, you can use FTP commands to navigate and transfer files.

## Summary
1. Install and configure vsftpd.
2. Allow FTP traffic through the firewall on port 21.
3. Connect to the FTP server using the command line.

By following these steps, you will have successfully configured your Ubuntu firewall to allow FTP service on port 21 and connected to the FTP server using the command line.