DROP TABLE products;
DROP TABLE manufacturers;


CREATE TABLE manufacturers
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  country VARCHAR(255),
  description TEXT,
  deactivated VARCHAR(255)
);

CREATE TABLE products
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  stock_quantity INT,
  buying_cost FLOAT,
  selling_price FLOAT,
  genre VARCHAR(255),
  type VARCHAR(255),
  manufacturers_id INT,
  deactivated VARCHAR(255)
);
