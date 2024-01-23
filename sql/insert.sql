DO $$ 
DECLARE
    first_names VARCHAR[] := ARRAY['John', 'Brad', 'Alice', 'Bob', 'Emily', 'Michael', 'Emma', 'Daniel', 'Olivia', 'Ethan', 'Sophia', 'Matthew', 'Ava', 'William'];
    last_names VARCHAR[] := ARRAY['Walter', 'Jr', 'Smith', 'Johnson', 'Davis', 'Clark', 'Miller', 'Wilson', 'Brown', 'Jones', 'Taylor', 'Moore', 'Anderson', 'White'];
    i INT := 1;
BEGIN
    WHILE i <= 50 LOOP
        INSERT INTO customer."Customers" (first_name, last_name, created_at)
        VALUES
            (
                first_names[1 + floor(random() * array_length(first_names, 1))], 
                last_names[1 + floor(random() * array_length(last_names, 1))], 
                NOW() - (floor(random() * 365) || ' days')::interval
            );
        i := i + 1;
    END LOOP;
END $$;

DO $$ 
DECLARE
    i INT := 1;
BEGIN
    WHILE i <= 50 LOOP
        INSERT INTO customer."Contact" (customer_id, phone, email)
        VALUES
            (i, '1234567' || lpad(i::text, 2, '0'), 'customer' || i || '@example.com');
        i := i + 1;
    END LOOP;
END $$;
---------------------------------------------------------------------------------------------

--TRUNCATE TABLE product."Sessions", product."Orders" RESTART IDENTITY;


------------------------------

DO $$ 
DECLARE
    i INT := 12;
BEGIN
    WHILE i <= 20 LOOP
        INSERT INTO customer."Contact" (customer_id, phone, email)
        VALUES
            (i, '765432' || lpad(i::text, 2, '0'), 'customer' || i + 50 || '@example.com');
        i := i + 3;
    END LOOP;
END $$;

---------------------------------------------------------------------------------------------




------------------------------ Insert into product."Products" -------------------------------

INSERT INTO product."Products" (product_name, price)
VALUES 
    ('Laptop', 1200),
    ('Smartphone', 800),
    ('Coffee Maker', 50),
    ('Headphones', 100),
    ('TV', 1500),
    ('Desk Chair', 200),
    ('Tablet', 500),
    ('Bluetooth Speaker', 80),
    ('Fitness Tracker', 70),
    ('Microwave Oven', 100),
    ('Digital Camera', 400),
    ('External Hard Drive', 120);
   
---------------------------------------------------------------------------------------------

   
   

------------------------------ Insert into product."Sessions" ------------------------------
    
with sessions(started_at, ended_at, created_at) as (
    select 
	    *,
	    ended_at as created_at
	from 
		(select
		     *,
		     started_at + (floor(random()*120) ||' minutes')::interval as ended_at
		from 
			(select 
			    make_timestamp(2023, 12,ceil(random()*30)::int, ceil(random()*22)::int, ceil(random()*59)::int, ceil(random()*59)::int) as started_at
			from generate_series(1,200)	) timestamp_
			) timestamp__
		order by started_at
		)
insert into product."Sessions" (started_at, ended_at, created_at) 
select * from sessions
    
---------------------------------------------------------------------------------------------
		



------------------------------ Insert into product."Orders" ---------------------------------

with products_ as (
    select 
	    ceil(random()*93)::int + 6 as session_id,
	    ceil(random()*12)::int as product_id,
	    ceil(random()*10)::int as product_count
	from generate_series(1,500) order by session_id
	) 
insert into product."Orders" (session_id, customer_id, product_id, product_count)
select 
    session_products.*,
    products_.product_id, 
    products_.product_count
from
	(select 
	    *,
	    ceil(random()*50)::int as customer_id
	from
		(select 
		    distinct session_id
		from products_
		) sessions_ids 
	) session_products
left join products_ on session_products.session_id = products_.session_id

---------------------------------------------------------------------------------------------




