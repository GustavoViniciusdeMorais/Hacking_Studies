-- Database creation
CREATE DATABASE IF NOT EXISTS `api` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `api`;

-- Table structure for table `customers`
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data into `customers`
INSERT INTO `customers` (`id`, `name`, `email`, `cpf`) VALUES (1, 'gustavo', 'gustavo@email.com', '04777911199');

-- Table structure for table `orders`
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `total_price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data into `orders`
INSERT INTO `orders` (`id`, `customer_id`, `product_id`, `total_price`) VALUES (1, 1, 1, 5.5);

-- Table structure for table `products`
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data into `products`
INSERT INTO `products` (`id`, `name`, `price`) VALUES (1, 'Coca Cola', 5.5);

SELECT 
c.email,
p.name AS product_name,
o.id AS order_code,
o.total_price
FROM customers AS c
JOIN orders AS o ON c.id = o.customer_id
JOIN products AS p ON o.product_id = p.id;