--Create the following triggers
--Trigger that populates full name on adding a new user
--Trigger that populates age on adding a new user
--Trigger that inserts a new row in user_logs if any value is updated in users table. If last name of a user is updated, the following values must be inserted into the user_logs table:
--<old last name>, <new last name>, 'Last name updated', current time

--Trigger that populates full name on adding a new user
CREATE OR REPLACE FUNCTION fill_fullname()
	RETURNS trigger
	AS
	$$
	DECLARE fullname character varying;
	BEGIN
		SELECT f_name || ' ' || l_name INTO fullname FROM userr WHERE id = new.id;
		UPDATE userr SET full_name = fullname WHERE ID = NEW.id;
		RETURN NEW;
	END;
	$$ LANGUAGE plpgsql;


create  trigger add_fullname after insert
on userr for each  row
execute  function fill_fullname();

insert into userr (username, email, f_name, l_name, dob) values
('trigger1', 't1@g.com', 'trigger', 'one', '1999-03-02');

select * from userr;

-- --------------------------------------------------------------------------------------


--Trigger that populates age on adding a new user
create or replace function fill_age()
	returns trigger
	as
	$$
	
	declare 
	year_now integer;
	year_birth integer;
begin 
	select date_part('year', now()) into year_now;
	select date_part('year', dob) into year_birth from userr where id = new.id; 
	update userr set age = year_now-year_birth  where id = new.id;
	return new;
end;
$$ language plpgsql;


create  trigger add_age after insert
on userr for each  row
execute  function fill_age();

insert into userr (username, email, f_name, l_name, dob) values
('trigger2', 't2@g.com', 'trigger', 'two', '2010-03-02');

-- --------------------------------------------------------------------------------------

create or replace function updated_log()
returns trigger
AS $$
	begin 
		if old.f_name != new.f_name then 
			insert into user_logs (old_value, new_value, description, log_time)
			values (old.f_name  , new.f_name , 'First name changed', now());
		end if;
	
		if old.l_name != new.l_name then 
			insert into user_logs (old_value, new_value, description, log_time)
			values (old.f_name  , new.l_name , 'Last name changed', now());
		end if;
	
		if old.username != new.username  then 
			insert into user_logs (old_value, new_value, description, log_time)
			values (old.username  , new.username , 'User name changed', now());
		end if;
	
		if old.email != new.email  then 
			insert into user_logs (old_value, new_value, description, log_time)
			values (old.email  , new.email , 'Email changed', now());
		end if;
	
		if old.dob != new.dob  then 
			insert into user_logs (old_value, new_value, description, log_time)
			values (cast(old.dob as character varying)  , cast(new.dob as character varying) , 'DOBchanged', now());
		end if;
	
	return new;

end;
$$ LANGUAGE plpgsql ;


create TRIGGER update_logs AFTER update
on userr  for each row 
execute function updated_log();

select * from userr;
select * from user_logs;

update userr set f_name = 'dd' where id = 1;
update userr set l_name  = 'trigger' where id = 1;
update userr set dob  = '1995-01-01' where id = 1;
update userr set email  = 'u@t.com' where id = 2;
update userr set username  = 'uptrig' where id = 1;




