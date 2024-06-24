# Database
```sh
service mariadb start

mysql_secure_installation # redefine password

mariadb -u root -p
1234
```

```sql
source /var/www/html/Configurations/database.sql;

SELECT c.name AS customer_name, p.name as product_name, sale.total_price AS order_price
FROM customers AS c
INNER JOIN orders AS sale ON c.id = sale.customer_id
INNER JOIN products AS p ON sale.product_id = p.id;
```
