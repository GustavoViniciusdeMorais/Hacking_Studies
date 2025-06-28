# PHP Connect
### At server
```bash
tail -n 2 /etc/passwd
passwd gustavo # redefine pass
```
### PHP
```php
$ftp_user_name="gustavo";
$ftp_user_pass="gustavo";
$ftp_server="172.20.0.3";
$ftp = ftp_connect($ftp_server);
$login_result = ftp_login($ftp, $ftp_user_name, $ftp_user_pass);
echo ftp_pwd($ftp);
$result = ftp_raw($ftp ,"pwd");
print_r($result);
```