# Adding a New User to the vsftpd Service on Ubuntu

This guide will walk you through the process of adding a new user to the vsftpd service on an Ubuntu system.

## Step 1: Create a New User

Open a terminal and run the following command to create a new user. Replace `username` with the desired username:

```bash
sudo adduser username
```

Follow the prompts to set a password and provide user information. 

## Step 2: Configure vsftpd for the New User

Edit the vsftpd configuration file to ensure local users can log in and are restricted to their home directories.

Open the vsftpd configuration file with a text editor:
```bash
sudo nano /etc/vsftpd.conf
```

Ensure the following settings are present and correctly configured:

```plaintext
listen=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES
chroot_local_user=YES
```

Save the file and exit the editor (Ctrl+O, Enter, Ctrl+X).

## Step 3: Set Up the User's FTP Directory

By default, vsftpd will use the user's home directory for FTP access. Ensure the directory exists and is correctly owned by the new user:

```bash
sudo mkdir -p /home/username
sudo chown username:username /home/username
```

## Step 4: Restart vsftpd Service

Restart the vsftpd service to apply the changes:

```bash
sudo systemctl restart vsftpd
```

## Step 5: Verify the User Configuration

To verify that the new user can log in via FTP, you can use the FTP command from the command line.

Open a terminal and connect to the FTP server:

```bash
ftp <server-ip-address>
```

Replace `<server-ip-address>` with the IP address of your FTP server. When prompted, enter the new user's credentials.

### Example Command Line Session:

```bash
ftp 192.168.1.100
Connected to 192.168.1.100.
220 (vsFTPd 3.0.3)
Name (192.168.1.100:your-username): username
331 Please specify the password.
Password:
230 Login successful.
ftp>
```

Once logged in, you can use FTP commands to navigate and transfer files.

## Summary
We've created the directory home/gustavo for user gustavo with pass gustavo to access through ftp.<br>
The configuration was commited to docker gustavovinicius/devsecops:ubuntu_server
1. Create a new user with `sudo adduser username`.
2. Configure vsftpd to allow local user logins and restrict them to their home directories.
3. Set up the user's FTP directory and ensure proper ownership.
4. Restart the vsftpd service with `sudo systemctl restart vsftpd`.
5. Verify the new user can log in via FTP.

By following these steps, you will have successfully added a new user to the vsftpd service on Ubuntu.