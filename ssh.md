# SSH Server and Client on Debian Linux

This tutorial will guide you through the installation and basic configuration of an SSH server and client on a Debian-based Linux operating system. Additionally, we will cover how to configure a user for SSH connections.

## Prerequisites

- A system running Debian or a Debian-based distribution
- Administrative (root) access to the system

## Step 1: Update Your System

Before installing any new packages, it’s good practice to update your system’s package list. Open a terminal and run:

```sh
sudo apt update
```

## Step 2: Install OpenSSH Server

To install the OpenSSH server, use the following command:

```sh
sudo apt install openssh-server
```

## Step 3: Verify the SSH Server Status

After installation, the SSH server should start automatically. To check its status, run:

```sh
sudo systemctl status ssh
```

You should see an output indicating that the SSH server is active and running.

## Step 4: Configure the SSH Server

The main configuration file for the SSH server is located at `/etc/ssh/sshd_config`. To edit this file, use a text editor like `nano`:

```sh
sudo nano /etc/ssh/sshd_config
```

### Common Configuration Options

- **Change the default port** (Optional): For added security, you can change the default SSH port (22) to another port. Uncomment and modify the following line:

  ```sh
  Port 2222
  ```

- **Permit root login**: It is recommended to disable root login for security reasons. Change the following line:

  ```sh
  PermitRootLogin no
  ```

- **Password authentication**: Ensure that password authentication is enabled. Uncomment or add the following line:

  ```sh
  PasswordAuthentication yes
  ```

After making the desired changes, save the file and exit the text editor (in `nano`, you can do this by pressing `CTRL + X`, then `Y`, and `Enter`).

## Step 5: Restart the SSH Service

For the changes to take effect, restart the SSH service:

```sh
sudo systemctl restart ssh
```

## Step 6: Create and Configure a User for SSH

To add a new user who can connect via SSH, use the following steps:

1. **Create a new user**:

   ```sh
   sudo adduser username
   ```

   Replace `username` with your desired username. Follow the prompts to set the user's password and other information.

2. **Add the user to the sudo group** (Optional): If you want the new user to have administrative privileges, add them to the `sudo` group:

   ```sh
   sudo usermod -aG sudo username
   ```

## Step 7: Install OpenSSH Client

The OpenSSH client is usually installed by default on Debian systems. If it’s not installed, you can install it with:

```sh
sudo apt install openssh-client
```

## Step 8: Connect to an SSH Server

To connect to an SSH server, use the following command:

```sh
ssh username@hostname_or_ip_address
```

- Replace `username` with the actual user name on the remote machine.
- Replace `hostname_or_ip_address` with the host name or IP address of the remote machine.

If you have changed the default SSH port, specify the port number with the `-p` option:

```sh
ssh username@hostname_or_ip_address -p 2222
```

## Additional Tips

- **Copying SSH Keys**: For passwordless login, you can copy your SSH key to the remote server using:

  ```sh
  ssh-copy-id username@hostname_or_ip_address
  ```

- **Testing Configuration**: You can test your SSH configuration for syntax errors with:

  ```sh
  sudo sshd -t
  ```

## Conclusion

You have now installed and configured an SSH server and client on your Debian system, and created a user for SSH connections. You can further secure your SSH server by implementing key-based authentication and other advanced configurations. For more information, refer to the [OpenSSH manual](https://www.openssh.com/manual.html).