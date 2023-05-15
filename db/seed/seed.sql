INSERT INTO customer (id, first_name, last_name, email, password, address, phone_number) 
VALUES (1, 'John', 'Doe', 'johndoe@example.com', 'password123', '123 Main St', '123-456-7890') 
ON CONFLICT DO NOTHING;

INSERT INTO category (id, name, customer_id)
VALUES (1, 'Electronics', 1)
ON CONFLICT DO NOTHING;

INSERT INTO product (id, SKU, description, price, stock, category_id)
VALUES (1, 'P12345', 'Smartphone', 599.99, 10, 1)
ON CONFLICT DO NOTHING;

INSERT INTO cart (quantity, customer_id, product_id)
VALUES (2, 1, 1)
ON CONFLICT DO NOTHING;

INSERT INTO wishlist (customer_id, product_id)
VALUES (1, 1)
ON CONFLICT DO NOTHING;

INSERT INTO payment (id, payment_date, payment_method, amount, customer_id)
VALUES (1, '2023-05-15', 'Credit Card', 199.99, 1)
ON CONFLICT DO NOTHING;

INSERT INTO shipment (id, shipment_date, address, city, state, country, zip_code, customer_id)
VALUES (1, '2023-05-15', '123 Main St', 'New York', 'NY', 'USA', '10001', 1);

INSERT INTO orders (id, order_date, total_price, customer_id, payment_id, shipment_id)
VALUES (1, '2023-05-15', 199.99, 1, 1, 1)
ON CONFLICT DO NOTHING;

INSERT INTO order_item (quantity, price, order_id, product_id)
VALUES (1, 199.99, 1, 1)
ON CONFLICT DO NOTHING;

