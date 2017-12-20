DROP TABLE transactions CASCADE;
DROP TABLE tags CASCADE;
DROP TABLE vendors CASCADE;
DROP TABLE budget_limit;

CREATE TABLE tags(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(20) NOT NULL
);

CREATE TABLE vendors(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(40) NOT NULL
);

CREATE TABLE transactions(
  id SERIAL4 PRIMARY KEY,
  amount INT4 NOT NULL,
  tag_id INT4 REFERENCES tags(id),
  vendor_id INT4 REFERENCES vendors(id)
);

CREATE TABLE budget_limit(
  id SERIAL4 PRIMARY KEY,
  amount INT4 NOT NULL
)
