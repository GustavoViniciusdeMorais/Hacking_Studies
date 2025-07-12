# Simple Honeypot Configuration for SSH/Telnet Bruteforce Monitoring

## Honeypot Server Setup (Ubuntu)

We'll use `cowrie`, a medium-interaction SSH/Telnet honeypot that logs attack attempts.

### 1. Installation

```bash
# On your Ubuntu server (honeypot)
sudo apt update
sudo apt install -y git python3-virtualenv

# Clone cowrie
git clone https://github.com/cowrie/cowrie
cd cowrie

# Set up virtual environment
virtualenv --python=python3 cowrie-env
source cowrie-env/bin/activate

# Install dependencies
pip install -r requirements.txt
```

### 2. Basic Configuration

Edit `etc/cowrie.cfg`:

```ini
[honeypot]
listen_endpoints = tcp:22:interface=0.0.0.0
listen_endpoints = tcp:2223:interface=0.0.0.0  # Telnet

[output_textlog]
enabled = true
logfile = var/log/cowrie/audit.log

[output_jsonlog]
enabled = true
logfile = var/log/cowrie/cowrie.json
```

### 3. Starting the Honeypot

```bash
# Start cowrie (from the cowrie directory)
./bin/cowrie start

# To stop
./bin/cowrie stop
```

### 4. Monitoring Attacks

View logs in real-time:

```bash
tail -f var/log/cowrie/audit.log
```

Or for JSON output:
```bash
tail -f var/log/cowrie/cowrie.json
```

## Attacker Side (Parrot OS)

### 1. Basic SSH Bruteforce Attempt

```bash
# Simple password spray
for password in "password" "123456" "admin" "root"; do
  ssh root@honeypot-ip -p 22 -o StrictHostKeyChecking=no "$password"
done

# Or use hydra for more systematic attacks
hydra -l root -P /usr/share/wordlists/rockyou.txt ssh://honeypot-ip -t 4
```

### 2. Telnet Bruteforce Attempt

```bash
# Manual telnet
telnet honeypot-ip 2223

# Or with hydra
hydra -l root -P /usr/share/wordlists/rockyou.txt telnet://honeypot-ip:2223
```

## Optional Enhancements

1. **Port Forwarding**: If your honeypot is behind NAT, forward ports 22 and 2223 to it
2. **Alerting**: Add email alerts by editing `etc/cowrie.cfg`:
   ```ini
   [output_email]
   enabled = true
   mailserver = your.smtp.server
   mailfrom = honeypot@yourdomain.com
   mailto = your@email.com
   ```
3. **Log Analysis**: Set up ELK stack or similar to visualize attacks

## Key Files to Monitor

- `var/log/cowrie/audit.log` - Human-readable logs
- `var/log/cowrie/cowrie.json` - Machine-readable logs
- `var/lib/cowrie/tty/` - Session recordings

This provides a basic but functional honeypot that will capture and log all SSH/Telnet brute force attempts against your server.