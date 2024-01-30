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
group by session_id, customer_id -- session_id/Нэг сагсны худалдан авалт -аар бүлэглэх, customer_id/Харилцагч -аар бүлэглэх 


--Худалдан авалт хийгээгүй session_id -н хугацааг минутаар гаргах
select
   sessions.session_id,
   extract(minute from ended_at-started_at)as session_time
from product."Sessions" sessions 
left join product."Orders" orders on orders.session_id=sessions.session_id
where product_id is null

--Худалдан авалтад зарцуулсан хугацааг ол. Гол table -ээ product."Sessions"-г сонгох
select
   sessions.session_id,
   (ended_at-started_at)as session_time
from product."Sessions" sessions
inner join product."Orders" orders on orders.session_id=sessions.session_id


--нэг удаагийн худалдан авалтын дүн нь 2500 болон түүнээс дээш хэрэглэгчдийн худалдан авалтын нийт дүн, холбоо барих мэдээлэл, барааны төрлийн тоо, худалдан авалт хийсэн сагсны тоог ол
select 
	once.customer_id,
	contact.phone,
	contact.email,
	count(once.product_id) as product_count,
	count(once.session_id) as session_count,
	sum (once.One_total_price) as total_price
from (select 
	orders.customer_id as customer_id  ,
	orders.product_id as product_id ,
	sum(orders.product_count*products.price) as one_total_price, --Нэг удаагийн худалдан авалт хийсэн дүн 
	orders.session_id as session_id
from product."Orders" orders -- Худалдан авалтын дата 
left join product."Products" products on products.product_id =orders.product_id 
group by orders.session_id ,orders.customer_id, orders.product_id) once
left join customer."Contact" contact on contact.customer_id=once.customer_id
where once.one_total_price >=2500
group by once.customer_id, contact.phone, contact.email
