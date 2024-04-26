## DNS config

1. **Install DNS Server:**
   First, you need to install a DNS server. In this example, we'll use `bind9`, which is a popular DNS server software on Ubuntu.
   ```bash
   sudo apt-get update
   sudo apt install bind9 -y
   apt install dnsutils -y
   ```

2. **Configure DNS Server:**
   The main configuration file for `bind9` is located at `/etc/bind/named.conf`. However, for simplicity, we'll mainly focus on configuring the zone file.

   Create a new zone file for your domain. For example, let's create a zone file named `gustavo.com`:
   ```bash
   sudo nano /etc/bind/zones/gustavo.com
   ```
   Add the following content to the file:
   ```
   $TTL 86400
   @   IN   SOA   ns1.gustavo.com. admin.gustavo.com. (
               2022042301 ; Serial
               3600       ; Refresh
               1800       ; Retry
               604800     ; Expire
               86400 )    ; Minimum TTL

   @   IN   NS    ns1.gustavo.com.
   @   IN   A     10.0.0.3
   ns1 IN   A     10.0.0.3
   ```

   Replace `gustavo.com` with your domain name and `10.0.0.3` with the IP address of your DNS server.

3. **Configure BIND Options:**
   Open the `named.conf.options` file for editing:
   ```bash
   sudo nano /etc/bind/named.conf.options
   ```
   Ensure that your DNS server allows queries from local networks. You can achieve this by adding the following lines:
   ```
   options {
       // Other options...
       allow-query { 10.0.0.0/16; };
   };
   ```

4. **Restart DNS Server:**
   After making changes, restart the DNS server for the changes to take effect:
   ```bash
   service named restart
   ```

5. **Test DNS Resolution:**
   You can now test your DNS server by querying it from another machine in your network:
   ```bash
   nslookup gustavo.com <DNS_SERVER_IP>
   ```
   Replace `<DNS_SERVER_IP>` with the IP address of your DNS server.

### Config other machine to request the DNS server
#### Debian OS example.
1. **Edit DNS Resolver Configuration:**
   Open the `/etc/resolv.conf` file for editing:
   ```bash
   sudo nano /etc/resolv.conf
   ```

2. **Configure DNS Servers:**
   Inside the file, specify the IP addresses of the DNS servers you want your Debian system to use. For example:
   ```
   nameserver 10.0.0.3
   ```

   Replace `10.0.0.3` with the IP address of your DNS server in the same network.

3. **Save the Changes:**
   Save the changes you made to the file and exit the text editor.

4. **Restart the Network Service (Optional):**
   Restarting the network service is usually not required for changes to `resolv.conf` to take effect, but you can do so if you prefer:
   ```bash
   service networking force-reload
   ```

   Alternatively, you can simply restart the DNS resolver service:
   ```bash
   sudo systemctl restart systemd-resolved
   ```

5. **Verify DNS Resolution:**
   Test DNS resolution by using tools like `nslookup` or `dig` to query a domain name:
   ```bash
   nslookup gustavo.com
   ```

   Replace `gustavo.com` with the domain name you want to resolve.
