-- customer schema-ийн "Customers" table-ийн бүх датаг хайх комманд 
select -- Датаг хайх түлхүүр үг
    *  -- Бүх баганын мэдээллийг авах
from customer."Customers"

select -- Датаг хайх түлхүүр үг
    *  -- Бүх баганын мэдээллийг авах
from customer."Contact"

-- customer schema-ийн "Customers" table-ийн бүх датаг хайх комманд 
select -- Датаг хайх түлхүүр үг 
    *  -- Бүх баганын мэдээллийг 
from product."Products"


-- customer schema-ийн "Customers" table-ийн бүх датаг хайх комманд 
select -- Датаг хайх түлхүүр үг
    *  -- Бүх баганын мэдээллийг  авах
from product."Orders"


select -- Датаг хайх түлхүүр үг
    *  -- Бүх баганын мэдээллийг авах
from product."Sessions"


-- table/ хүснэгтээс багануудыг сонгох

select 
    product_id, 
    product_name, 
    price
from product."Products" 



-- Харилцагчийн худалдан авалт хийсэн нийт дүн
select 
    customer_id, -- Харилцагчийн дугаар
    sum(product_count*price) as total_price --Худалдан авалт хийсэн нийлбэр дүн 
from product."Orders" orders -- Худалдан авалтын дата 
left join product."Products" products on orders.product_id = products.product_id --  product_id баганаар 2 хүснэгнийг холбож нийлүүлж байна.
group by customer_id  -- customer_id/Харилцагч -аар бүлэглэх 




select 
*
from product."Orders" orders -- Худалдан авалтын дата 
left join product."Products" products on orders.product_id = products.product_id --  product_id баганаар 2 хүснэгнийг холбож нийлүүлж байна.


