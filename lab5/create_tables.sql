create table userr(
id serial ,
username Character varying(40), 
email Character varying(40), 
f_name Character varying(50), 
l_name Character varying(50), 
dob date, 
age integer, 
primary key (id)
);

drop table userr;

create table user_logs (
id serial ,
old_value Character varying(50), 
new_value Character varying(50), 
description text, 
log_time time, 
primary key (id)
);


insert into userr (username, email, f_name, l_name, dob) values
('uuu1', 'p1@t.com', 'Abc', 'Cde', '1999-03-02'),
('uuu2', 'p2@t.com', '22', 'Cde', '2000-03-02'),
('uuu3', 'p3@t.com', '33', 'Cde', '1999-03-02'),
('uuu4', 'p4@t.com', '44', 'Cde', '2000-03-02'),
('uuu5', 'p5@t.com', '55', 'Cde', '1998-03-02'),
('uuu6', 'p6@t.com', '66', 'Cde', '1997-03-02');



insert into userr (username, email, f_name, l_name, dob) values 
('uuu7', 'p7@t.com', '77', 'Cde', '1999-03-02'),
('uuu8', 'p8@t.com', '88', 'Cde', '2000-03-02');


select  * from userr;


drop table userr;








