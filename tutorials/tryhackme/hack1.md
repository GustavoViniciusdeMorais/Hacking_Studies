# Challenge Easy Peasy
- [openvpn instructions](../BasicHackingSteps.md)
- [kali dirb for common lists](https://www.kali.org/tools/dirb/)
- [msfconsole](./msfconsole.md)
### Connect VPN before anything
```bash
openvpn --config gustavocop14dos-regular.ovpn --auth-user-pass auth.txt &
```
### Use kali docker
```bash
docker run -it -d --name kali --network=host kali:local # after commit kalilinux/kali-rolling
docker exec -it -u 0 kali bash
# now inside kali docker can listen to connections in vpn
# example: ping -c 3 10.190.111.11; responder -I tun0 # responder in interface tun0

apt install metasploit-framework -y

apt install john -y
john --list=formats | grep -i 'md5'

```
```bash
nmap -v -sC -sV -T5 [ip] -p- # or port range 60000-65535
# nmap -v -sC -sV -T5 -p 80,6498,65524 10.67.173.154

# apt install gobuster -y
gobuster dir -u http://10.67.173.154:65524 -w openvpn/common.txt

# decode text base64
# apt install base64 -y
echo "ZmxhZ3tmMXJzN19mbDRnfQ==" | base64 -d && echo ""

john passwords.txt --format=raw-MD5
john passwords.txt --show --format=raw-MD5
```
n0th1ng3ls3m4tt3r
### Working hashes
- There is a difference between the hash and base encoded
- If it does not figure with baseN, try to find hash mode with hashid
```bash
echo "ZmxhZ3tmMXJzN19mbDRnfQ==" | base64 -d
apt install hashid -y
hashid -m -e 5d41402abc4b2a76b9719d911017c592 -o hashtypes.txt
```
