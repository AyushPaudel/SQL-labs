use lab;
show tables;



select * from author a ; 

INSERT INTO distributor  (id, name, linked_stores)
VALUES 
(1, 'Ayush', 8),
(2, 'Ashish', 10),
(3, 'Prakash', 20) ;

DELETE FROM author where id >0;

INSERT Into author (id, name, nationality,details)
VALUES
(1, 'George Orwell', 'American', 'George Orwell  was born in DD-MM-YYYY. He has written X books.'),
(2, 'Author 2', 'Indian', 'Author 2 was born in DD-MM-YYYY. He has written X books.'),
(3, 'Subin Bhattarai', 'Nepali', 'Subin Bhattarai was born in DD-MM-YYYY. He has written X books.');

INSERT INTO category (type_, genre, isbn_issn, frequency_period, total_printed, available_prints, print_necessary)
VALUES 
('book', 'fiction', '11004488', NULL , 800, 200, 0 ),
('book', 'fiction', '22004488', NULL , 800, 20 , 1 ),
('book', 'novel', '44004488', NULL , 800, 10, 1 ),
('book', 'novel', '66004488', NULL , 800, 0, 1 ),
('book', 'memoir', '55004488', NULL , 800, 200, 0 ),
('book', 'non-fiction', '33004488', NULL , 800, 200, 0 ),
('magazine', NULL, '166004488', 'weekly', 800, 200, 0 ),
('magazine', NULL, '266004488', 'weekly', 800, 200, 0 ),
('magazine', NULL, '366004488', 'weekly', 800, 200, 0 ),
('magazine', NULL, '466004488', 'daily', 800, 200, 0 ),
('magazine', NULL, '566004488', 'monthly', 800, 200, 0 );





INSERT INTO publication (id, publication_title, category_id, price, date_published)
VALUES (1, 'Kantipur Mag', '166004488', 50, '2022-02-13'),
 (2, 'Sptahik', '266004488', 20, '2021-12-11'),
 (3, 'Living', '366004488', 100, '2021-11-12'),
 (4, 'Republic', '466004488', 10, '2022-02-20'),
 (5, 'Himal', '566004488', 30, '2022-02-13'),
 (6, 'Nineteen Eighty-Four', '11004488', 350, '2022-02-13'),
 (7, 'Animal Farm', '22004488', 200, '1999-02-13'),
 (8, 'Saaya', '44004488', 400, '2022-02-13'),
 (9, 'Summer Love', '66004488', 400, '2022-02-13'),
 (10, 'Book 3', '55004488', 200, '1990-02-13'),
 (11, 'Book 4', '33004488', 200, '2022-02-13');

INSERT INTO orders  (id, distributor_id, order_type, paid_amount, quantity, order_date, receiving_date, publication_id)
VALUES (1,1,'pre-order',1000, 20, '2022-02-18', '2022-12-11', 1 ),
(2,1,'pre-order',2000, 100, '2022-02-18', '2022-12-11', 2 ),
(3,1,'pre-order',1500, 15, '2022-02-18', '2022-12-11', 3 ),
(4,1,'pre-order',900, 90, '2022-02-18', '2022-12-11', 4 ),
(5,2,'pre-order',600, 20, '2022-02-18', '2022-12-11', 5 ), 
(6,2,'normal-order',3500, 10, '2022-02-18', '2022-12-11', 6 ),
(7,2,'normal-order',4000, 20, '2022-02-18', '2022-12-11', 7 ), 
(8,3,'normal-order',8000, 20, '2022-02-18', '2022-12-11', 8 ), 
(9,3,'normal-order',8000, 20, '2022-02-18', '2022-12-11', 9 ), 
(10,3,'pre-order',4000, 10, '2022-02-18', '2022-12-11', 10 ), 
(11,3,'pre-order',4000, 10, '2022-02-18', '2022-12-11', 11 ), 
(12,3,'normal-order',2000, 10, '2022-02-18', '2022-12-11', 7 );

INSERT INTO prints (publication_id, printing_date, quantity)
VALUES 
('22004488', '2022-02-10', 20),
('44004488', '2022-01-10', 30),
('66004488', '2022-12-10', 40);




INSERT INTO sales (id, credit_amount, transaction_history, total_orders)
VALUES (1, 7000, 100000, 5000),
(2, 8000, 200000, 5000),
(3, 7000, 300000, 5000);

INSERT INTO sales_info (id, distributor_id, sales_id)
VALUES (1, 1, 1),
(2, 2, 2),
(3, 3, 3);

INSERT
	INTO
	written_by (id,
	book_id,
	author_id)
VALUES 
(1,'11004488',1),
(2,'22004488',1),
(3,'33004488',2),
(4,'44004488',3),
(5,'55004488',2),
(6,'66004488',3);



