--1.Identify which columns have partial dependencies and what they depend on.--

--The TABLE has the FOLLOWING partial dependencies:
  --a.customer_name depends only on order_id.--
  --b.product_name depends only on product_id.--
  --c.unit_price depends only on product_id--

--2.Design a 2NF-compliant schema: customers, products, orders, order_items.--
 --The design is in a document called Question 2.--

--3.Write CREATE TABLE statements for all four tables.--

CREATE TABLE customers(
    customer_id INTEGER PRIMARY KEY,
	customer_name TEXT NOT NULL
);

CREATE TABLE products(
     product_id INTEGER PRIMARY KEY,
	 product_name TEXT NOT NULL,
	 unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders(
    order_id INTEGER PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items(
      order_id INTEGER NOT NULL,
	  product_id INTEGER NOT NULL,
	  qty INTEGER NOT NULL,
	  PRIMARY KEY (order_id, product_id),
	  FOREIGN KEY (order_id) REFERENCES orders(order_id),
	  FOREIGN KEY (product_id) REFERENCES products(product_id)
);


--4.Insert the data from the original table into your 2NF schema.

INSERT INTO customers(customer_id, customer_name) VALUES
(1,'Alice'),
(2,'Bob');

INSERT INTO products(product_id, product_name, unit_price) VALUES
(42,'Keyboard',49.99),
(77,'Mouse',29.99);

INSERT INTO orders(order_id, customer_id) VALUES
(1001,1),
(1002,2);

INSERT INTO order_items(order_id, product_id, qty) VALUES
(1001,42,2),
(1001,77,1),
(1002,42,1);

--5.Write a query to reproduce the original table's data using JOINs.--

SELECT
   o.order_id,
   p.product_id,
   oi.qty,
   c.customer_name,
   p.product_name,
   p.unit_price
FROM order_items oi
JOIN orders o ON oi.order_id=o.order_id
JOIN customers c ON o.customer_id=c.customer_id
JOIN products p ON oi.product_id = p.product_id;

--6.Bonus: rename "Keyboard" to "Mechanical Keyboard" — in the bad table vs the 2NF table. How many rows changed in each?--

--bad table-keyboard appears in multiple rows, so 2 rows must be updated.--
--2NF table-keyboard appears only once in products table, so only 1 row must be updated--
[2NF reduces redundancy by storing product information only once.]






