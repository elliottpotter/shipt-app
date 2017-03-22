select
customers.id                  'customer_id',
customers.first_name          'customer_first_name',
categories.id                 'category_id',
categories.name               'category_name',
sum(order_products.quantity)  'number_purchased'

from customers
join orders                   on orders.customer_id = customers.id
join order_products           on order_products.order_id = orders.id
join products                 on products.id = order_products.product_id
join categories               on categories.id = products.category_id

group by 1,2,3,4
