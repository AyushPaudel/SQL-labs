create or replace function fullname2(uid integer)
	returns character varying 
	as 
	$$
	declare 
		fname character varying ;
		lname character varying ;
		
	begin 
		select f_name, l_name into fname , lname from userr where id=uid;
		return fname ||' '|| lname;
	end;
	$$ language plpgsql
;

create or replace function fullname(fname character varying, lname character varying)
	returns character varying 
	as 
	$$	
	begin 
		return fname ||' '|| lname;
	end;
	$$ language plpgsql
;


select fullname('Ayush', 'Paudel');
select fullname2 (2);

--Function that returns the number of users

create or replace function countusers()
returns integer 
as 
$$ 
declare 
	all_ integer;
begin 
	select count(id) into all_ from userr;
	return all_;
end;
$$ language plpgsql
;

select countusers();


--Function that returns the age of the user with the given ID

create or replace function get_age(uid integer)
returns integer 
as 
$$
declare u_age integer;
begin 
	select age into u_age from userr where id = uid;
	return u_age ;
	
end;
$$ language plpgsql
;

select get_age(1);









