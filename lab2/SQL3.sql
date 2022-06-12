

SELECT *  FROM 
publication as p inner join orders as o
on p.id =o.publication_id 
INNER JOIN category as c on c.isbn_issn =p.category_id  
WHERE o.order_type ="normal-order" and c.type_ ="book";



SELECT p.publication_title  
from publication as p 
inner join category as c 
on c.isbn_issn =p.category_id 
where c.type_ ='book' and 
DATE_FORMAT(p.date_published, '%Y') < 2000;


SELECT
	p.publication_title,
	c.genre,
	c.isbn_issn,
	c.total_printed,
	c.available_prints,
	p.price,
	p.date_published,
	a.name as 'Author Name'
from
	written_by wb
inner join author a ON
	wb.author_id = a.id
INNER JOIN category c 
on
	c.isbn_issn = wb.book_id
inner join publication p 
on
	c.isbn_issn = p.category_id
where
	a.id = 1;



SELECT p.publication_title  from
publication as p inner join category as c
on c.isbn_issn =p.category_id 
where c.type_ ='magazine' and 
c.frequency_period = 'weekly';

SELECT p.publication_title  FROM 
publication as p inner join 
orders as o on p.id =o.publication_id 
INNER JOIN category as c on c.isbn_issn =p.category_id  
WHERE o.order_type ="pre-order" and c.type_ ="book";


SELECT p.publication_title  FROM 
publication as p WHERE p.publication_title like 'A%';


SELECT p.publication_title, o.order_date  FROM 
publication as p inner join 
orders as o on p.id =o.publication_id 
INNER JOIN category as c on c.isbn_issn =p.category_id  
WHERE  c.type_ ="book"
ORDER BY o.order_date ;

