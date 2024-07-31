# Adding a Static Route on Debian OS

This guide will walk you through configuring a static route on a Debian system using the `/etc/network/if-up.d/` directory. This approach makes the route persistent, ensuring it is applied automatically when the network interface comes up.

## Prerequisites

- A Debian-based system with root or sudo access
- Basic knowledge of networking

## Step 1: Enable IP Forwarding (Optional)

If you're setting up the Debian system as a gateway or router, ensure IP forwarding is enabled. Open `/etc/sysctl.conf` and uncomment the line:

```bash
net.ipv4.ip_forward=1
```

To apply the changes immediately, run:

```bash
sudo sysctl -p
```

## Step 2: Configure the Static Route

### 2.1. **Create the Script**

Create a script in the `/etc/network/if-up.d/` directory. This script will add the static route whenever the specified network interface is brought up.

**Example:** Create a script named `static-route`:

```bash
sudo nano /etc/network/if-up.d/static-route
```

### 2.2. **Add the Route Configuration**

In the script, add the following configuration to set up a static route. Replace the values with those specific to your network setup.

```bash
#!/bin/sh

# Add a static route when the interface comes up
ip route add 192.168.2.0/24 via 192.168.1.2 dev eth0
```

- `192.168.2.0/24`: The destination network and its subnet mask.
- `192.168.1.2`: The next-hop address (the IP address of the gateway/router through which the traffic should be routed).
- `eth0`: The network interface to use for the route.

### 2.3. **Make the Script Executable**

Ensure the script is executable:

```bash
sudo chmod +x /etc/network/if-up.d/static-route
```

## Step 3: Testing the Configuration

To verify that the static route is added correctly, you can bring down and then bring up the network interface:

```bash
sudo ifdown eth0 && sudo ifup eth0
```

After the interface is up, check the routing table to confirm that the static route has been added:

```bash
ip route
```

You should see the route `192.168.2.0/24 via 192.168.1.2 dev eth0` listed.

## Conclusion

By following these steps, you've configured a persistent static route on a Debian system. The script in `/etc/network/if-up.d/` ensures that the route is automatically added whenever the specified network interface is activated. This method provides a reliable way to manage static routes across reboots and network reconfigurations.

Always ensure that the gateway specified in the static route is reachable and properly configured to forward traffic.