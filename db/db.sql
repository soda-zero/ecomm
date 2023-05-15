-- Done
CREATE TABLE IF NOT EXISTS customer(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    password TEXT,
    address TEXT,
    phone_number TEXT
);

-- Done
CREATE TABLE IF NOT EXISTS category(
    id SERIAL PRIMARY KEY,
    name TEXT,
    customer_id INTEGER NOT NULL REFERENCES customer(id)
    );

-- Done
CREATE TABLE IF NOT EXISTS product(
    id SERIAL PRIMARY KEY,
    SKU TEXT,
    description TEXT,
    price NUMERIC,
    stock INTEGER,
    category_id INTEGER REFERENCES category(id)
);

-- Done
CREATE TABLE IF NOT EXISTS cart(
    id SERIAL,
    quantity INTEGER,
    customer_id INTEGER NOT NULL REFERENCES customer(id),
    product_id INTEGER NOT NULL REFERENCES product(id),
    PRIMARY KEY(id, customer_id)
);

-- Done
CREATE TABLE IF NOT EXISTS wishlist(
    id SERIAL,
    customer_id INTEGER NOT NULL REFERENCES customer(id),
    product_id INTEGER NOT NULL REFERENCES product(id),
    PRIMARY KEY(id, customer_id)
);

-- Done
CREATE TABLE IF NOT EXISTS payment(
    id SERIAL PRIMARY KEY,
    payment_date DATE,
    payment_method TEXT,
    amount NUMERIC,
    customer_id INTEGER NOT NULL REFERENCES customer(id)
);

-- Done
CREATE TABLE IF NOT EXISTS shipment(
    id SERIAL PRIMARY KEY,
    shipment_date DATE,
    address TEXT, 
    city TEXT,
    state TEXT,
    country TEXT,
    zip_code TEXT,
    customer_id INTEGER NOT NULL REFERENCES customer(id)
);

-- Done
CREATE TABLE IF NOT EXISTS orders(
    id SERIAL PRIMARY KEY,
    order_date DATE,
    total_price NUMERIC,
    customer_id INTEGER NOT NULL REFERENCES customer(id),
    payment_id INTEGER NOT NULL REFERENCES payment(id),
    shipment_id INTEGER NOT NULL REFERENCES shipment(id)
);


-- Done
CREATE TABLE IF NOT EXISTS order_item(
    id SERIAL,
    quantity INTEGER,
    price NUMERIC,
    order_id INTEGER NOT NULL REFERENCES orders(id),
    product_id INTEGER NOT NULL REFERENCES product(id),
    PRIMARY KEY (id, order_id)
);



