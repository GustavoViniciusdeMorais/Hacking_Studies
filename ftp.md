# Setting up FTP Server on Ubuntu

This guide will walk you through the process of installing and configuring an FTP server on Ubuntu, allowing anonymous connections.

## Step 1: Install vsftpd

First, update your package index and install the `vsftpd` package:

```bash
sudo apt update
sudo apt install vsftpd
```

## Step 2: Configure vsftpd

Edit the vsftpd configuration file `/etc/vsftpd.conf`:

```bash
sudo nano /etc/vsftpd.conf
```

Uncomment or add the following lines to the file to allow anonymous access:

```
anonymous_enable=YES
anon_upload_enable=YES
anon_mkdir_write_enable=YES
```

Save the changes and exit the editor.

## Step 3: Restart vsftpd Service

After making changes, restart the vsftpd service to apply the new configuration:

```bash
sudo systemctl restart vsftpd
```

## Step 4: Testing

You can now test the FTP server by connecting to it using an FTP client. You should be able to connect anonymously and upload files.

## Create directory and flag file
```bash
cd /srv/ftp/
mkdir test
nano test/flag.txt
```

## Additional Configuration (Optional)

- **Restrict Anonymous Access**: You may want to restrict anonymous access to certain directories. You can do this by configuring the `chroot_local_user` and `chroot_list_enable` options in the vsftpd configuration file.

- **Enable SSL/TLS**: For secure FTP connections, you can enable SSL/TLS encryption. Refer to the vsftpd documentation for more information on how to set this up.

- **Logging**: By default, vsftpd logs to `/var/log/vsftpd.log`. You can customize the logging behavior in the configuration file.

## Conclusion

You've successfully installed and configured an FTP server on Ubuntu, allowing anonymous connections. Remember to review your security settings and adjust them according to your needs.
