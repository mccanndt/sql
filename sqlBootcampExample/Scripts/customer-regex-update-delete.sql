SELECT * FROM sqlbootcampexample.customer;

select * from customer where name like 'A%';

select * from customer where name like 'A%'
						  or name like 'D%';
                          
select * from customer where name like 'A%'
						 and state = 'NJ';

-- Use Regeex to return all records with names starting with a vowel
select * from customer where name regexp '^[AEIOU].*';

-- insert statement
insert into customer (name, city, state, sales, active) values ('Fender', 'Scottsdale', 'AZ', 12348888, 1);
insert into customer (name, city, state, sales, active) values ('Gibson', 'Memphis', 'TN', 98374498, 1);
insert into customer (name, city, state, sales, active) values ('Ibanez', 'Bensalem', 'PA', 54345734, 1);

-- update statement
update customer
	set	name = 'Pearl',
		city = 'Test',
		state = 'TE'
	where id = 17;

-- delete statement
delete from customer where id in (17,18);