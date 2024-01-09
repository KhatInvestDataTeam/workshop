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


--TRUNCATE TABLE product."Sessions", product."Orders" RESTART IDENTITY;

do $$ 
declare 
    i int := 1
begin 
	while 



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


insert into product."Sessions" (started_at, ended_at, created_at)
values
    ('2023-11-08 04:05:06'::timestamp, '2023-11-08 05:02:05'::timestamp, '2023-11-08 05:02:05'::timestamp),
    ('2023-11-09 12:05:06'::timestamp, '2023-11-09 12:10:05'::timestamp, '2023-11-09 12:10:05'::timestamp),
    ('2023-11-09 13:12:00'::timestamp, '2023-11-09 13:21:02'::timestamp, '2023-11-09 13:21:02'::timestamp),
    ('2023-11-09 15:05:06'::timestamp, '2023-11-09 15:42:15'::timestamp, '2023-11-09 15:42:15'::timestamp),
    ('2023-11-10 10:05:01'::timestamp, '2023-11-10 10:02:01'::timestamp, '2023-11-10 10:02:01'::timestamp),
    ('2023-11-10 11:06:32'::timestamp, '2023-11-10 11:09:19'::timestamp, '2023-11-10 11:09:19'::timestamp)
    
INSERT INTO product."Orders" (product_id, customer_id, product_count, created_at, session_id)
values
    (1, 2, 2, CURRENT_TIMESTAMP, 1),
    (2, 2, 1, CURRENT_TIMESTAMP, 1),
    (3, 2, 3, CURRENT_TIMESTAMP, 1),
    (6, 2, 1, CURRENT_TIMESTAMP, 1),
    (12, 2, 2, CURRENT_TIMESTAMP, 1),
    (1, 4, 2, CURRENT_TIMESTAMP, 3),
    (2, 4, 2, CURRENT_TIMESTAMP, 3),
    (3, 4, 1, CURRENT_TIMESTAMP, 3),
    (6, 4, 1, CURRENT_TIMESTAMP, 3),
    (12,4, 3, CURRENT_TIMESTAMP, 3),
    (1, 1, 2, CURRENT_TIMESTAMP, 4),
    (2, 1, 1, CURRENT_TIMESTAMP, 4),
    (3, 1, 3, CURRENT_TIMESTAMP, 4),
    (12, 2, 2, CURRENT_TIMESTAMP, 4),
    (1, 2, 2, CURRENT_TIMESTAMP, 5),
    (1, 5, 2, CURRENT_TIMESTAMP, 6),
    (2, 5, 1, CURRENT_TIMESTAMP, 6),
    (3, 2, 3, CURRENT_TIMESTAMP, 6),
    (12, 2, 2, CURRENT_TIMESTAMP, 6),
    (1, 2, 2, CURRENT_TIMESTAMP, 6)
