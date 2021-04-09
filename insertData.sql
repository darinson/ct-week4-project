INSERT INTO salesperson(
	sales_id,
	first_name,
	last_name
) VALUES(
	1,
	'Clark',
	'Kent'
),(
	2,
	'Martian',
	'Manhunter'
);

INSERT INTO dealer_car(
	dealer_id,
	make,
	model,
	year_,
	color,
	price,
	status
) VALUES(
	1,
	'Toyota',
	'Prius',
	2011,
	'white',
	11599,
	'used'
),(
	2,
	'Acura',
	'TSX',
	2010,
	'white',
	11998,
	'used'
),(
	3,
	'Hyundai',
	'Kona',
	2021,
	'red',
	20500,
	'new'
),(
	4,
	'Nissan',
	'LEAF',
	2021,
	'blue',
	31670,
	'new'
),(
	5,
	'Kia',
	'Niro Hybrid',
	2021,
	'blue',
	24690,
	'new'
);

INSERT INTO mechanic(
	mechanic_id,
	first_name,
	last_name
) VALUES(
	1,
	'Bob',
	'Builder'
),(
	2,
	'Kevin',
	'Malone'
);

INSERT INTO parts(
	parts_id,
	type_,
	cost
) VALUES(
	1,
	'brake roter',
	25.00	
),(
	2,
	'AC compressor',
	152.99
),(
	3,
	'rear view mirror',
	25.00
);

INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	billing_info,
	address
) VALUES(
	1,
	'Diana',
	'Prince',
	'1234-1234-1234-1234 567 01/01',
	'123 Pine St Palace, Themyscira 99999'
);
-- Will add another customer via function in separate file.

INSERT INTO c_car(
	car_id,
	make,
	model,
	year_,
	color,
	mileage,
	customer_id
) VALUES(
	1,
	'ferrari',
	'portofino',
	2020,
	'gray',
	100000,
	1
);

INSERT INTO service_ticket(
	service_id,
	service_type,
	service_cost,
	status,
	service_date,
	car_id,
	mechanic_id,
	parts_id
) VALUES(
	1,
	'clean a fuel injector nozzle',
	500,
	'complete',
	'2021-04-07',
	1,
	1,
	NULL
)
-- will add another service ticket via function in separate file