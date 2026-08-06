# Hash Basics
```bash
# get the sha256 hash for a file
sha256sum file.txt

apt install hashid -y
hashid 5b31f93c09ad1d065c0491b764d04933
```
- Rainbow Table
  - Is a table of columns hash => password
  - To avoid this, generate a salt for each pass, store the salt in user table to later compare
```
```
