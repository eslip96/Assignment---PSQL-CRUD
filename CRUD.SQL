
-- this will create a table called companie if none exist
CREATE TABLE IF NOT EXISTS companies (
  company_id UUID PRIMARY KEY,
  company_name VARCHAR UNIQUE NOT NULL
); 


-- This is creating a column for companies
CREATE TABLE companies (
company_name VARCHAR
);

-- This allows you to add a company in companie table with its own paramaters listed below Ive made some generated UUIDS below for use in for create,post,deleting

INSERT INTO companies (company_id, company_name)
VALUES ('f6f40c9d-eaba-43f7-8732-0a7feee6d36a', 'coke');

-- allows updates for company table

UPDATE companies
SET company_name = 'coke'
WHERE company_id = 'f6f40c9d-eaba-43f7-8732-0a7feee6d36a';

-- This adds a foreign key for the company_id column of the products table, referencing the company_id column in the companies table.

ALTER TABLE products
ADD CONSTRAINT fk_company_id FOREIGN KEY (company_id) REFERENCES companies(company_id);

-- this creates a product table 

CREATE TABLE products (
  product_id SERIAL,
  company_id UUID,
  company_name VARCHAR(255),
  price INTEGER,
  description VARCHAR(255),
  active BOOLEAN,
  PRIMARY KEY (product_id),
  FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

-- this allows a single record into products

INSERT INTO products (company_id, company_name, price, description, active)
VALUES ('f6f40c9d-eaba-43f7-8732-0a7feee6d36a', 'coke', 36.00, 'bulk soda', true);

-- updates products table
UPDATE products
SET price = 1200, active = false
WHERE product_id = '1';

-- this is inserting a base laptop for products as some kinda demo-data for product tables so heres something there

INSERT INTO products (
  company_id,
  company_name,
  price,
  description,
  active
)VALUES(144bb55f-f22e-4516-b257-b0dce988d59a,250,coke,500,laptop)

-- this creates a products_categories_xref table

CREATE TABLE products_categories_xref (
  product_id SERIAL,
  category_id SERIAL,
  FOREIGN KEY (product_id) REFERENCES products(product_id),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- this creates a table for categories
CREATE TABLE categories (
  category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(255) NOT NULL
);

-- creates a record for products_categories_xref
INSERT INTO products_categories_xref (product_id, category_id)
VALUES ('', );

INSERT INTO products_categories_xref (product_id, category_id)
VALUES ('', category id here);

-- there is no fields in xref to update but if there were here is a simple start to up date it fields

SET field_name = 'new value'

-- this is my foreign key connecting products xref and products

ALTER TABLE products
ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES products(product_id);


-- another forign key for products xref and categories

ALTER TABLE categories
ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES companies(category_id);

-- This adds a record to the categories page

INSERT INTO categories (category_name)
VALUES ('Rescue');

-- for deleting a single record and if needing to delete a table or the whole thing
DELETE FROM products WHERE product_id = 'product id'

DROP DATABASE your_database_name;

DROP TABLE products;

-- These are the read commads for all tables
SELECT * FROM products;
SELECT * FROM products_categories_xref;
SELECT * FROM categories;
SELECT * FROM companies;

-- active read for all products that are active:

SELECT * FROM products WHERE active = true;

-- read product with comp id
SELECT * FROM products WHERE company_id = '1';

-- read a single company record by id
SELECT * FROM companies WHERE company_id = 'f6f40c9d-eaba-43f7-8732-0a7feee6d36a';

-- read single category record by id with left join for all records on both matching sides of the table
SELECT categories.*, products.*
FROM categories
LEFT JOIN products_categories_xref ON categories.category_id = products_categories_xref.category_id
LEFT JOIN products ON products_categories_xref.product_id = products.product_id
WHERE categories.category_id = 1;


-- this does the thing as the table above but with product id
SELECT products.*, categories.*
FROM products
LEFT JOIN products_categories_xref ON products.product_id = products_categories_xref.product_id
LEFT JOIN categories ON products_categories_xref.category_id = categories.category_id
WHERE products.product_id = 'product id here';




UUIDS: 

dfd19711-4bac-4342-a992-f84d94ce5a4e, f6f40c9d-eaba-43f7-8732-0a7feee6d36a , 6256455d-ca9a-434b-9032-6d2322df342f, d0d49554-c583-4f64-b8b9-1392771151b6, 1825de65-c846-45cd-8a45-dd91baeeaa22, bc72d80a-9c87-4266-8bba-03ff4a7115ff, 
96f9fb2d-0f34-4177-8192-7e003c7a8323, d1b73c21-b2cb-4d7c-97e3-4c6c16fa4ebe,
d1b73c21-b2cb-4d7c-97e3-4c6c16fa4ebe, 5201d7d4-96d2-4258-a3e4-6271596f4109