# Monitoring and Controlling IP Connection Attempts on a Debian Server

This tutorial demonstrates how to monitor and analyze IP connection attempts on a Debian OS server, specifically focusing on FTP and Nginx services. It also covers controlling access with UFW and configuring monitoring logs to capture the attacker's IP and NIC address.

## Prerequisites

- Debian OS server
- FTP service (e.g., vsftpd)
- Nginx web server
- UFW (Uncomplicated Firewall) installed

## Steps

### 1. Install Required Tools

Ensure the necessary tools are installed on your Debian server.

```bash
sudo apt-get update
sudo apt-get install ufw tcpdump
```

### 2. Enable and Configure UFW

Enable UFW and configure it to allow only specific IP addresses to access the FTP and Nginx services.

```bash
sudo ufw enable
sudo ufw allow ssh
sudo ufw allow from [Trusted_IP] to any port 21
sudo ufw allow from [Trusted_IP] to any port 80
sudo ufw allow from [Trusted_IP] to any port 443
sudo ufw reload
```

Replace `[Trusted_IP]` with the IP addresses you want to allow access.

### 3. Monitor Connection Attempts

Use `tcpdump` to monitor and capture connection attempts to the FTP and Nginx services.

```bash
sudo tcpdump -i any port 21 or port 80 or port 443 -w /var/log/connection_attempts.pcap
```

### 4. Analyze Connection Logs

After capturing the logs, analyze them to identify the IP addresses and NIC details of the connection attempts.

```bash
sudo tcpdump -r /var/log/connection_attempts.pcap
```

To view detailed information about each packet, including the NIC address, use:

```bash
sudo tcpdump -nn -tttt -e -r /var/log/connection_attempts.pcap
```

### 5. Configure Logging for UFW

Enable UFW logging to capture detailed information about connection attempts.

```bash
sudo ufw logging on
```

UFW logs are stored in `/var/log/ufw.log`. Use `tail` to monitor the log file in real-time.

```bash
sudo tail -f /var/log/ufw.log
```

### 6. Monitor FTP Access Attempts

FTP service logs connection attempts in its log file. For vsftpd, the log file is usually located at `/var/log/vsftpd.log`.

```bash
sudo tail -f /var/log/vsftpd.log
```

### 7. Monitor Nginx Access Attempts

Nginx logs connection attempts in its access log file, typically located at `/var/log/nginx/access.log`.

```bash
sudo tail -f /var/log/nginx/access.log
```

### 8. Blocking Malicious IP Addresses

If you identify any malicious IP addresses, you can block them using UFW.

```bash
sudo ufw deny from [Malicious_IP]
sudo ufw reload
```

### 9. Automate Monitoring and Alerts

You can automate monitoring and alerts using tools like `fail2ban`, which scans log files and bans IPs that show malicious signs.

```bash
sudo apt-get install fail2ban
```

Create or edit the configuration file for vsftpd in `/etc/fail2ban/jail.local`:

```ini
[vsftpd]
enabled = true
port = ftp,ftp-data,ftps,ftps-data
filter = vsftpd
logpath = /var/log/vsftpd.log
maxretry = 5
```

Create or edit the configuration file for nginx in `/etc/fail2ban/jail.local`:

```ini
[nginx-http-auth]
enabled = true
port = http,https
filter = nginx-http-auth
logpath = /var/log/nginx/error.log
maxretry = 3
```

Restart `fail2ban` to apply the changes:

```bash
sudo systemctl restart fail2ban
```

### 10. Review `fail2ban` Logs

Review the logs to see which IPs have been banned:

```bash
sudo cat /var/log/fail2ban.log
```

## Summary

You have successfully configured your Debian server to monitor and analyze IP connection attempts for FTP and Nginx services. You used UFW to control access, configured logging, and set up automated monitoring with `fail2ban` to detect and respond to malicious activity.

---

Ensure you have proper authorization to access and interact with the systems described in this tutorial. Unauthorized access is illegal and unethical.