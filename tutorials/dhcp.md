## Setting up DHCP Server on Ubuntu

1. **Install DHCP Server:**
   First, install the DHCP server package on Ubuntu. You can do this by running the following command in the terminal:
   ```bash
   sudo apt-get update
   sudo apt-get install isc-dhcp-server
   ```

2. **Configure DHCP Server:**
   Once installed, you need to configure the DHCP server. The main configuration file is `/etc/dhcp/dhcpd.conf`. Open this file with your preferred text editor:
   ```bash
   sudo nano /etc/dhcp/dhcpd.conf
   ```
   Here's a simple configuration example:
   ```
   default-lease-time 600;
   max-lease-time 7200;
   subnet 10.0.0.0 netmask 255.255.255.0{
    interface eth0;
    range 10.0.0.3 10.0.0.250;
    option broadcast-address 10.0.0.255;
    option routers 10.0.0.1;
    option domain-name-servers 10.0.0.2;
   }
   ```

3. **Start DHCP Server:**
   After configuring the DHCP server, start the service:
   ```bash
   rm -rf /var/run/dhcpd.pid
   service isc-dhcp-server start
   ```

### Get IP from DHCP

#### Get DHCP Offer with dhcpd
```sh
dhcpcd eth0
```

#### Altering network config file
```sh
nano /etc/network/interfaces
```
Config the eth0 to request IPs
```
auto eth0
iface eth0 inet dhcp
```
Restart the network service
```sh
service networking force-reload
```
It's gona print DHCP offer and bound
```
DHCPOFFER of 10.0.0.4 from 10.0.0.3
DHCPREQUEST for 10.0.0.4 on eth0 to 255.255.255.255 port 67
DHCPACK of 10.0.0.4 from 10.0.0.3
bound to 10.0.0.4 -- renewal in 270 seconds.
```

