-- customer schema-ийн "Customers" table-ийн бүх датаг хайх комманд 
select -- Датаг хайх түлхүүр үг
    *  -- Бүх баганын мэдээллийг авах
from customer."Customers"

select -- Датаг хайх түлхүүр үг
    *  -- Бүх баганын мэдээллийг авах
from customer."Contact"

-- product schema-ийн "Products" table-ийн бүх датаг хайх комманд 
select -- Датаг хайх түлхүүр үг 
    *  -- Бүх баганын мэдээллийг 
from product."Products"


-- product schema-ийн "Orders" table-ийн бүх датаг хайх комманд 
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
left join product."Products" products on orders.product_id = products.product_id --  product_id баганаар 2 хүснэгтнийг холбож нийлүүлж байна.
group by customer_id  -- customer_id/Харилцагч -аар бүлэглэх 


select 
   *
from product."Orders" orders -- Худалдан авалтын дата 
left join product."Products" products on orders.product_id = products.product_id --  product_id баганаар 2 хүснэгнийг холбож нийлүүлж байна.

   
--Laptop худалдан авсан харилцагч нарын холбоо барих мэдээлэл
select
   distinct orders.customer_id,
   phone,
   email
from product."Orders" orders -- Худалдан авалтын дата 
left join product."Products" products on orders.product_id = products.product_id --  product_id баганаар 2 хүснэгтнийг холбож нийлүүлж байна.
left join customer."Contact" contact on orders.customer_id=contact.customer_id -- customer_id  баганаар 2 хүснэгтнийг холбож нийлүүлж байна.
where "product_name" = 'Laptop'


--Харилцагч нарын нэг удаагийн худалдан авалтын бүтээгдэхүүний нийт тоо
select
   customer_id,
   session_id,
   sum(product_count) as total_product_count
from product."Orders" orders -- Худалдан авалтын дата 
group by session_id, customer_id -- session_id/Нэг удаагийн худалдан авалт -аар бүлэглэх, customer_id/Харилцагч -аар бүлэглэх 
