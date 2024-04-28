use api;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;

CREATE TABLE customers (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL
);

CREATE TABLE products (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DOUBLE
);

CREATE TABLE orders (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    total_price DOUBLE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO customers (name, email, cpf) VALUES ('gustavo', 'gustavo@email.com', '04777911199');
INSERT INTO customers (name, email, cpf) VALUES ('Vanessa Veracruz', 'vanessacruz@email.com', '69969969969');
INSERT INTO customers (name, email, cpf) VALUES ('Cory Chase', 'corychase@email.com', '690');

INSERT INTO products (name, price) VALUES ('Coca Cola', 5.50);
INSERT INTO products (name, price) VALUES ('Bra', 205.89);

INSERT INTO orders (customer_id, product_id, total_price) VALUES (1,1,5.50);
INSERT INTO orders (customer_id, product_id, total_price) VALUES (2, 2, (SELECT price FROM products WHERE id = 2));
INSERT INTO orders (customer_id, product_id, total_price) VALUES (3, 2, (SELECT price FROM products WHERE id = 2));
