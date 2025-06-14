CREATE DATABASE ToysGroup;

USE ToysGroup;

CREATE TABLE region (
regionID INT AUTO_INCREMENT PRIMARY KEY,
region_name VARCHAR(50)
);

CREATE TABLE country (
countryID INT AUTO_INCREMENT PRIMARY KEY,
country_name VARCHAR(50),
regionID INT,
FOREIGN KEY (regionID) REFERENCES region(regionID)
);

CREATE TABLE category (
categoryID INT AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR (50)
);

CREATE TABLE product (
productID INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(50),
categoryID INT,
FOREIGN KEY (categoryID) REFERENCES category(categoryID)
);

CREATE TABLE sales (
salesID INT AUTO_INCREMENT PRIMARY KEY,
productID INT,
quantity INT,
countryID INT,
sales_date DATE,
FOREIGN KEY (productID) REFERENCES product(productID),
FOREIGN KEY (countryID) REFERENCES country(countryID)
);

INSERT INTO region (region_name) VALUES
('WestEurope'),
('SouthEurope'),
('NorthAmerica'),
('Asia');

INSERT INTO country (country_name, regionID) VALUES
('France', 1),
('Germany', 1),
('Italy', 2),
('Greece', 2),
('USA', 3),
('Canada', 3),
('Japan', 4),
('India', 4);

INSERT INTO category (category_name) VALUES
('Bikes'),
('Clothing'),
('Electronics'),
('Games'),
('Books');

INSERT INTO product (product_name, categoryID) VALUES
('Mountain Bike 3000', 1),
('City Bike 500', 1),
('Bike Gloves M', 2),
('Bike Helmet', 2),
('Drone FlyX', 3),
('Smartwatch Pro', 3),
('Puzzle 1000', 4),
('Board Game Deluxe', 4),
('E-Book Reader', 5),
('Children Story Book', 5);

INSERT INTO sales (productID, quantity, countryID, sales_date) VALUES
(1, 3, 1, '2024-01-15'),
(2, 2, 2, '2024-01-20'),
(3, 5, 3, '2024-02-03'),
(4, 1, 4, '2024-02-10'),
(5, 3, 5, '2024-02-15'),
(6, 2, 6, '2024-03-01'),
(7, 4, 7, '2024-03-10'),
(8, 1, 8, '2024-03-12'),
(9, 6, 7, '2024-03-15'),
(10, 6, 8, '2024-03-18');








