# README

Welcome to Elliott Potter's Shipt Engineering application, application: *shipt-app*. This is a simple API application that allows for customers to create orders containing products.

## Setup
To get started, clone this repo locally and run the following commands from the root directory:
* rails db:create
* rails db:migrate
* rails db:seed
* rails s

Open up your favorite HTTP request-er, I prefer Postman myself, and start appending some endpoints to your rails server's host address!

## Endpoints and behavior
### Create an account:
**Method:** `POST`  
**Endpoint:** `/customers/create`

In order to interact with shipt-app, you must first create your customer account. To do so, send the appropriate params to the customer/create endpoint. This will return your **api_key**. Keep this safe, as you'll use it to interact with the rest of the application.

**Body parameters:**
* first_name
* last_name
* email


### Create an order:
**Method:** `POST`  
**Endpoint:** `/orders/create`

Now that you're a paying customer, you can start creating orders! To so post your api_key to this endpoint. Your response will contain your **order_id** and an array of available products. Keep both of these as a reference for adding products to your order.

**Body parameters:**
* api_key


### Add products to an order:
**Method:** `PUT`  
**Endpoint:** `/orders/update`

Now that your order is created, you can add products to it with the orders/update endpoint. Simply provide your api_key and order_id, along with the product_id and quantity of the product you'd like to add.

**Body parameters:**
* api_key
* order_id
* product_id
* quantity


### See all of your orders:
**Method:** `GET`  
**Endpoint:** `/orders/index`

You're a seasoned customer at this point, and you'd like to look over all of your past orders. No problem. Simply send over your api_key to this endpoint and **get** all of your orders in a nicely-formatted JSON object.

**Query parameters:**
* api_key


### See product sales data:
**Method:** `POST`  
**Endpoint:** `/products/index`

Perhaps you're attracted to shipt-app for it's shiny data analytics capabilities. We totally understand where you're coming from, and the products/index endpoint is for you. By providing a valid api_key, along with a start_date and end_date formatted like *'YYYY-MM-DD'*, you'll receive a the product_id and total quantity sold for each product sold during that date range.

If you'd rather receive this information in a .csv format, simply PUT to /products/index.csv

#### Body parameters:
* api_key
* start_date
* end_date
