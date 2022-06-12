CREATE DATABASE IF NOT EXISTS lab;

Use lab;

CREATE TABLE If Not Exists distributor (
  id int NOT NULL,
  name varchar(150) NOT NULL,
  linked_stores int NOT NULL,
  PRIMARY KEY (id)
);

CREATE table If Not Exists author (
	id int not null, 
	name varchar(100), 
	nationality varchar(50),
	details text, 
	PRIMARY KEY (id)
);

CREATE table If Not Exists category (
	type_ varchar(100) not null,
	genre varchar (100),
	isbn_issn varchar(30) not null, 
	frequency_period VARCHAR(100),
	total_printed int, 
	available_prints int,
	print_necessary int(1),
	PRIMARY KEY (isbn_issn)	
);

CREATE TABLE If Not Exists sales (
	id int not null,
	credit_amount int,
	transaction_history text,
	total_orders int,
	PRIMARY KEY (id)
);

CREATE table If Not Exists sales_info(
	id int not null,
	distributor_id int, 
	sales_id int,
	PRIMARY KEY (id),
	FOREIGN KEY (distributor_id) REFERENCES distributor(id) ON DELETE CASCADE,
    FOREIGN KEY (sales_id) REFERENCES sales(id) ON DELETE SET NULL  
);

CREATE table If Not Exists publication(
	id int not null,
	publication_title varchar(250),
	category_id varchar(30),
	price int,
	date_published date,
	PRIMARY KEY (id),
	FOREIGN KEY (category_id) REFERENCES category(isbn_issn) ON DELETE CASCADE
);

CREATE table If Not Exists orders(
	id int not null,
	distributor_id int,
	order_type varchar(100),
	paid_amount int,
	quantity int,
	order_date date,
	receiving_date date,
	publication_id int,
	PRIMARY KEY (id),
	FOREIGN KEY (publication_id) REFERENCES publication(id) ON DELETE SET NULL,
	FOREIGN KEY (distributor_id) REFERENCES distributor(id) ON DELETE CASCADE
);

CREATE table If Not Exists written_by(
	id int not null,
	book_id varchar(30),
	author_id int,
	PRIMARY KEY (id),
	FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE CASCADE,
	FOREIGN KEY (book_id) REFERENCES category(isbn_issn) ON DELETE CASCADE
);

CREATE table if not Exists prints (
	publication_id varchar(30),
	printing_date Date,
	quantity int,
	FOREIGN KEY (publication_id) REFERENCES category(isbn_issn) ON DELETE CASCADE
);

