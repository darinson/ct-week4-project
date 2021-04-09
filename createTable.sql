CREATE TABLE salesperson(
	sales_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

CREATE TABLE dealer_car(
	dealer_id SERIAL PRIMARY KEY,
	make VARCHAR(100),
	model VARCHAR(100),
	year_ INTEGER,
	color VARCHAR(100),
	price NUMERIC(8,2),
	status VARCHAR(15)
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

CREATE TABLE parts(
	parts_id SERIAL PRIMARY KEY,
	type VARCHAR(100),
	cost NUMERIC(6,2)
);

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	billing_info VARCHAR(150),
	address VARCHAR(150)
);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	invoice_date DATE DEFAULT CURRENT_DATE,
	sales_id INTEGER NOT NULL,
	dealer_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(sales_id) REFERENCES salesperson(sales_id),
	FOREIGN KEY(dealer_id) REFERENCES dealer_car(dealer_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE c_car(
	car_id SERIAL PRIMARY KEY,
	make VARCHAR(100),
	model VARCHAR(100),
	year_ INTEGER,
	color VARCHAR(100),
	mileage INTEGER,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE service_ticket(
	service_id SERIAL PRIMARY KEY,
	service_type VARCHAR(100),
	service_cost NUMERIC(6,2),
	status VARCHAR(100),
	service_date DATE DEFAULT CURRENT_DATE,
	car_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	parts_id INTEGER NULL,
	FOREIGN KEY(car_id) REFERENCES c_car(car_id),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	FOREIGN KEY(parts_id) REFERENCES parts(parts_id)
);
