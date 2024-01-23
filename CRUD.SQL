CREATE TABLE IF NOT EXISTS companies (
  company_id UUID PRIMARY KEY,
  company_name VARCHAR UNIQUE NOT NULL
);SELECT 


CREATE TABLE companies (
company_name VARCHAR
);

ALTER TABLE products(
  ADD CONSTRAINT fk_company_id,
  FOREIGN KEY(company_id)
  REFERENCES
  companies(company_id)
)

CREATE TABLE products (
  product_id SERIAL,
  company_id INTEGER,
  company_name VARCHAR,
  price INTEGER,
  description VARCHAR,
  active BOOLEAN,
  PRIMARY KEY (product_id),
  FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

INSERT INTO products (
  product_id,
  company_id,
  company_name,
  price,
  description,
  active
)VALUES(144bb55f-f22e-4516-b257-b0dce988d59a,250,microsoft,500,laptop)

CREATE TABLE products_categories_xref (
 product_id SERIAL
 category_id SERIAL
 FOREIGN KEY (product_id)
 FOREIGN KEY (category_id)
);

ALTER TABLE products(
  ADD CONSTRAINT fk_product_id,
  FOREIGN KEY(product_id)
  REFERENCES
  companies(product_id)
)

ALTER TABLE categories(
  ADD CONSTRAINT fk_category_id,
  FOREIGN KEY(category_id)
  REFERENCES
  companies(category_id)
)


CREATE TABLE categories (
  category_name VARCHAR
);


DELETE FROM products WHERE product_id = '144bb55f-f22e-4516-b257-b0dce988d59a'


SELECT * FROM products;
SELECT * FROM products_categories_xref;
SELECT * FROM categories;
SELECT * FROM companies;

