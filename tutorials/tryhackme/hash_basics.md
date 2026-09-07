# Hash Basics
- [crackstation online tool](https://crackstation.net/)
```bash
# get the sha256 hash for a file
sha256sum file.txt

apt install hashid -y
hashid [hash string]
```
- Rainbow Table
  - Is a table of columns hash => password
  - To avoid this, generate a salt for each pass, store the salt in user table to later compare

### Cracking with hashcat
```bash
apt install hashid -y
# try find hash type
hashid [hash string]

apt install hashcat -y
# try find hash type with hashcat
hashcat --identify b6b0d451bbf6fed658659a9e7e5598fe

# m is mode, a is atack mode 0 for wordlist, -O lower salt
# kali wordlist path is /usr/share/wordlists/rockyou.txt
hashcat -m 1400 -a 0 -O hashs.txt wordlist.txt

# to see the result
hashcat -m 1400 --show hashs.txt
```
### Example
```bash
hashcat -m 1400 Hashing-Basics/Task-6/hash2.txt /usr/share/wordlists/rockyou.txt
hashcat -m 1400 --show Hashing-Basics/Task-6/hash2.txt
```
