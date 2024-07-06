### **Step 1: Setup Wi-Fi Router**

1. **Router Configuration**:
   - Connect to your Wi-Fi router's web interface (usually accessible via `http://192.168.1.1` or `http://192.168.0.1`).
   - Login with the admin credentials.
   - Configure the SSID (Wi-Fi network name) and password.
   - Enable DHCP server on the router to assign IP addresses automatically to connected devices.

### **Step 2: Configure Debian Machines**

1. **Connect to Wi-Fi**:
   - On each Debian machine, you can use `nmcli` (Network Manager Command Line Interface) to connect to the Wi-Fi network.
   ```bash
   sudo nmcli device wifi list
   sudo nmcli device wifi connect "your_ssid" password "your_password"
   ```

2. **Check IP Address**:
   - After connecting to Wi-Fi, check the IP address assigned by the router.
   ```bash
   ip addr show
   ```

3. **Static IP Configuration (Optional)**:
   - If you prefer to set static IP addresses instead of using DHCP, edit the network interfaces file:
   ```bash
   sudo nano /etc/network/interfaces
   ```
   - Add the following configuration (replace `wlan0` with your Wi-Fi interface name, and adjust IP addresses as needed):
   ```plaintext
   auto wlan0
   iface wlan0 inet static
       address 192.168.1.100   # Machine 1
       netmask 255.255.255.0
       gateway 192.168.1.1
       dns-nameservers 8.8.8.8 8.8.4.4
   ```

   ```plaintext
   auto wlan0
   iface wlan0 inet static
       address 192.168.1.101   # Machine 2
       netmask 255.255.255.0
       gateway 192.168.1.1
       dns-nameservers 8.8.8.8 8.8.4.4
   ```

4. **Restart Networking**:
   - Restart the networking service to apply changes.
   ```bash
   sudo service networking restart
   ```

### **Step 3: Testing the Network**

1. **Ping Test**:
   - Test connectivity between the two Debian machines by pinging each other.
   ```bash
   ping 192.168.1.100   # From Machine 2 to Machine 1
   ping 192.168.1.101   # From Machine 1 to Machine 2
   ```

2. **SSH Connection** (Optional):
   - If you want to SSH into one machine from the other:
   ```bash
   ssh user@192.168.1.100   # SSH into Machine 1 from Machine 2
   ssh user@192.168.1.101   # SSH into Machine 2 from Machine 1
   ```

### **Step 4: DHCP Server Configuration (Advanced, Optional)**

1. **Install DHCP Server**:
   - On one of the Debian machines, you can set up a DHCP server if needed.
   ```bash
   sudo apt update
   sudo apt install isc-dhcp-server
   ```

2. **Configure DHCP Server**:
   - Edit the DHCP server configuration file.
   ```bash
   sudo nano /etc/dhcp/dhcpd.conf
   ```
   - Add the following configuration:
   ```plaintext
   subnet 192.168.1.0 netmask 255.255.255.0 {
       range 192.168.1.50 192.168.1.100;
       option routers 192.168.1.1;
       option domain-name-servers 8.8.8.8, 8.8.4.4;
   }
   ```

3. **Specify Interfaces**:
   - Specify the network interfaces for the DHCP server in `/etc/default/isc-dhcp-server`.
   ```plaintext
   INTERFACESv4="wlan0"
   ```

4. **Restart DHCP Server**:
   - Restart the DHCP server to apply the changes.
   ```bash
   sudo service isc-dhcp-server restart
   ```

By following these steps, you will have a basic computer network setup with two Debian OS machines connected via Wi-Fi, with IP configurations and DHCP setup handled by the router or one of the machines.