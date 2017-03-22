select
customers.id,
customers.first_name,
categories.id,
categories.name,
sum(order_products.quantity)

from customers
join orders                   on orders.customer_id = customers.id
join order_products           on order_products.order_id = orders.id
join products                 on products.id = order_products.product_id
join categories               on categories.id = products.category_id

group by 1,2,3,4
