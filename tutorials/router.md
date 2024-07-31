# Configuring Ubuntu OS as Network Gateway and Router

In this guide, we'll walk through the steps to configure an Ubuntu OS as a network gateway and router.

- [Static Route](./static_routing.md)

## Step 1: Update and Upgrade

Ensure your Ubuntu system is up to date by running:

```bash
sudo apt update
sudo apt upgrade
```

## Step 2: Enable IP Forwarding

IP forwarding allows the Ubuntu system to route packets between interfaces. Open `/etc/sysctl.conf` and uncomment the line:

```bash
#net.ipv4.ip_forward=1
```

To apply the changes immediately, run:

```bash
sudo sysctl -p
```

## Step 3: Configure Network Interfaces

Edit `/etc/network/interfaces` to configure network interfaces. Here's an example for two interfaces (eth0 for WAN, eth1 for LAN):

```plaintext
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 10.0.0.1
    netmask 255.255.255.0
```

Replace `10.0.0.1` with the desired IP address for the LAN interface.

## Step 4: Configure DHCP Server

Install and configure DHCP server to assign IP addresses to devices on the LAN. Install DHCP server:

```bash
sudo apt install isc-dhcp-server
```

Edit the configuration file `/etc/dhcp/dhcpd.conf`:

```plaintext
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

Adjust the range and options as needed.

## Step 5: Enable NAT (Network Address Translation)

Use `iptables` to enable NAT:

```bash
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```

To make the NAT rules persistent, install `iptables-persistent`:

```bash
sudo apt install iptables-persistent
```

## Step 6: Restart Services

Restart networking and DHCP server for changes to take effect:

```bash
sudo systemctl restart networking
sudo systemctl restart isc-dhcp-server
```

Your Ubuntu system should now be configured as a network gateway and router, providing internet access to devices connected to the LAN.

Remember to adjust firewall settings and security measures according to your network requirements.