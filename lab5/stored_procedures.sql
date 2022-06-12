--SP to update the full name of the user with the given ID
alter table userr
add full_name character varying;

create or replace procedure fill_fullname (uid integer)
as 
$$ 
begin 
	update userr set full_name = f_name ||' '|| l_name where id = uid;
end;
$$ language plpgsql;

Call fill_fullname (1);

select * from userr;

--SP to update the age of the user with the given ID


create or replace procedure fill_age(uid integer)
as 
$$ 
declare 
	year_now integer;
	year_birth integer;
begin 
	select date_part('year', now()) into year_now;
	select date_part('year', dob) into year_birth from userr where id = uid; 
	update userr set age = year_now-year_birth  where id = uid;
end;
$$ language plpgsql;

Call fill_age (6);

select * from userr;




