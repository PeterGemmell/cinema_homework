
DROP TABLE tickets;
DROP TABLE customers;
DROP TABLE films;


CREATE TABLE customers( -- always plural of the Customer class.
  id SERIAL8 PRIMARY KEY, -- will generate a unique key each time.
  name VARCHAR(255),
  funds NUMERIC   --allows us to work with numbers with decimal places.
);

CREATE TABLE films(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  price NUMERIC
);

CREATE TABLE tickets(
  id SERIAL8 PRIMARY KEY,
  customer_id INT REFERENCES customers(id),  -- so this is referencing the table customers, specifcally the id.
  film_id INT REFERENCES films(id)
);
