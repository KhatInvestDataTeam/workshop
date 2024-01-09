CREATE SCHEMA customer;

-- Create the customer table
CREATE TABLE customer."Customers" (
    customer_id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    primary key(customer_id)
);

create table customer."Contact" (
  cont_id SERIAL primary key, 
  customer_id int,
  Phone varchar(10),
  email varchar(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  constraint fk_customer
      foreign key(customer_id)
          references customer."Customers"(customer_id)
);

create schema product;

create table product."Products" (
    product_id int generated always as identity,
    product_name varchar(100),
    price int,
    created_at timestamp default current_timestamp,
    primary key(product_id)
);

create table product."Sessions" (
    session_id int generated always as identity, 
    started_at timestamp,
    ended_at timestamp, 
    created_at timestamp default current_timestamp,
    primary key(session_id)
);


create table product."Orders" (
    order_id int generated always as identity,
    product_id int,
    customer_id int,
    product_count int,
    created_at timestamp default current_timestamp,
    session_id int, 
    primary key(order_id, product_id),
    constraint fk_products
        foreign key(product_id)
            references product."Products",
    constraint fk_customers
        foreign key(customer_id)
            references customer."Customers",
    constraint fk_sessions
        foreign key(session_id)
            references product."Sessions"
);

