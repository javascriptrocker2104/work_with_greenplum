CREATE TABLE sales 
(
	sale_id varchar(64) NOT NULL,
	sale_date date NOT NULL,
	product_id varchar(64) NOT NULL,
	amount integer NOT NULL
)
DISTRIBUTED BY (sale_id)
PARTITION BY RANGE (sale_date) 
( 
  START (date '2023-01-01') INCLUSIVE 
  END (date '2024-01-01') EXCLUSIVE 
  EVERY (INTERVAL '1 month') 
);

INSERT INTO sales (sale_id, sale_date, product_id, amount)
VALUES
(1, '2023-01-08', 1, 90000),
(2, '2023-02-28', 1, 50000),
(3, '2023-01-21', 2, 50000),
(4, '2023-03-29', 2, 90000),
(5, '2023-05-12', 3, 90087),
(6, '2023-05-31', 3, 89867),
(7, '2023-04-08', 1, 54321),
(8, '2023-06-28', 1, 56543),
(9, '2023-07-21', 2, 59871),
(10, '2023-08-29', 2, 92222),
(11, '2023-08-12', 3, 93456),
(12, '2023-10-20', 3, 99871),
(13, '2023-11-10', 3, 81110);

CREATE TABLE products 
(
	product_id varchar(64) NOT NULL,
	product_name varchar(200) NOT NULL,
	price integer NOT NULL
)
DISTRIBUTED BY (product_id);

INSERT INTO products (product_id, product_name, price)
VALUES
(1, 'Испорченный телефон', 100),
(2, 'Сарафанное радио', 200),
(3, 'Патефон', 300);

SET optimizer = ON;

EXPLAIN
SELECT 
	to_char(s.sale_date::timestamp, 'YYYY-Mon') AS "monthly sales",
	sum(s.amount * p.price) AS "sales amount"
FROM sales s 
	JOIN products p USING(product_id)
GROUP BY to_char(s.sale_date::timestamp, 'YYYY-Mon')
ORDER BY 1;