--1.Identify which columns have partial dependencies and what they depend on.--

--The TABLE has the FOLLOWING partial dependencies:
  --a.customer_name depends only on order_id.--
  --b.product_name depends only on product_id.--
  --c.unit_price depends only on product_id--

--2.Design a 2NF-compliant schema: customers, products, orders, order_items.--

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

--3.Write CREATE TABLE statements for all four tables.





