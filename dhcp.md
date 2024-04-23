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
   subnet 192.168.1.0 netmask 255.255.255.0 {
       range 192.168.1.100 192.168.1.200;
       option routers 192.168.1.1;
       option domain-name-servers 8.8.8.8, 8.8.4.4;
   }
   ```

3. **Start DHCP Server:**
   After configuring the DHCP server, start the service:
   ```bash
   sudo systemctl start isc-dhcp-server
   ```

### Docker Compose Configuration for Ubuntu

Create a `docker-compose.yml` file for Ubuntu:

```yaml
version: '3'

services:
  ubuntu_dhcp:
    image: ubuntu
    container_name: ubuntu_dhcp_server
    networks:
      - dhcp_bridge

networks:
  dhcp_bridge:
    driver: bridge
```

### Docker Compose Configuration for Arch Linux

Create a `docker-compose.yml` file for Arch Linux:

```yaml
version: '3'

services:
  arch_linux_client:
    image: archlinux
    container_name: arch_linux_client
    networks:
      - dhcp_bridge

networks:
  dhcp_bridge:
    external:
      name: dhcp_bridge
```

### Running the Docker Containers

1. **Ubuntu DHCP Server:**
   Run the Ubuntu DHCP server container:
   ```bash
   docker-compose -f docker-compose-ubuntu.yml up -d
   ```

2. **Arch Linux Client:**
   Run the Arch Linux client container:
   ```bash
   docker-compose -f docker-compose-archlinux.yml up -d
   ```

Now, the Arch Linux client should receive an IP address from the DHCP server running on Ubuntu within the Docker network named `dhcp_bridge`.

### Testing

To verify that the Arch Linux client has received an IP address from the DHCP server, you can check the network settings within the Arch Linux container or try accessing external resources from within the container to confirm connectivity.