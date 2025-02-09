CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    name TEXT,
    price REAL
);

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products (name, price) VALUES ('Product1', 10.99);
INSERT INTO products (name, price) VALUES ('Product2', 15.99);

INSERT INTO customers (name, email) VALUES ('John Doe', 'john@example.com');
INSERT INTO customers (name, email) VALUES ('Jane Smith', 'jane@example.com');

INSERT INTO orders (customer_id, product_id, quantity) VALUES (1, 1, 2);
INSERT INTO orders (customer_id, product_id, quantity) VALUES (2, 2, 1);