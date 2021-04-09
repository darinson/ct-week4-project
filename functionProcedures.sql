-- add customer function
CREATE OR REPLACE FUNCTION add_customer(
	_customer_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR,
	_billing_info VARCHAR,
	_address VARCHAR
)
RETURNS void
AS $$
BEGIN
	INSERT INTO customer(customer_id, first_name, last_name, billing_info, address)
	VALUES(_customer_id, _first_name, _last_name, _billing_info, _address);
END;
$$
LANGUAGE plpgsql;

SELECT add_customer(2,'Donna','Troy','9876-9876-9876-9876 543 06/06', '354 Star Blvd Palace, Themyscira 99999');
SELECT add_customer(3, 'Darin','Son','1234-1234-1234-1234 495 09/09', '930 Champion Irvine, CA 92610');
SELECT add_customer(4, 'Jim','Halpert','2345-2345-2345-2345 845 03/03', '234 Paper St Scranton, PA 23455');

-- generates an invoice function

CREATE OR REPLACE FUNCTION new_invoice(
	_invoice_id INTEGER,
	_invoice_date DATE,
	_sales_id INTEGER,
	_dealer_id INTEGER,
	_customer_id INTEGER
)
RETURNS void
AS $IN$
BEGIN
	INSERT INTO invoice(invoice_id, invoice_date, sales_id, dealer_id, customer_id)
	VALUES (_invoice_id, _invoice_date, _sales_id, _dealer_id, _customer_id);
END;
$IN$
LANGUAGE plpgsql;

SELECT new_invoice(1,'2021-01-01',1,5,3);
SELECT new_invoice(2,'2020-01-31',2,4,4);

-- creates an entry for customer's car (for service)

CREATE OR REPLACE FUNCTION add_c_car(
	_car_id INTEGER,
	_make VARCHAR,
	_model VARCHAR,
	_year_ INTEGER,
	_color VARCHAR,
	_mileage INTEGER,
	_customer_id INTEGER
)
RETURNS void
AS $$
BEGIN
	INSERT INTO c_car(car_id, make, model, year_, color, mileage, customer_id)
	VALUES(_car_id, _make, _model, _year_, _color, _mileage, _customer_id);
END;
$$
LANGUAGE plpgsql;

SELECT add_c_car(2,'Hyundai','Genesis',2019,'silver',12993,2);

-- generates a new service ticket function

CREATE OR REPLACE FUNCTION add_service_ticket(
	_service_id INTEGER,
	_service_type VARCHAR,
	_service_cost DECIMAL,
	_status VARCHAR,
	_service_date DATE,
	_car_id INTEGER,
	_mechanic_id INTEGER,
	_parts_id INTEGER

)
RETURNS void
AS $M$
BEGIN
	INSERT INTO service_ticket(service_id,service_type,service_cost,status,service_date,car_id,mechanic_id,parts_id)
	VALUES(_service_id,_service_type,_service_cost,_status,_service_date,_car_id,_mechanic_id,_parts_id);
END;
$M$
LANGUAGE plpgsql;

SELECT add_service_ticket(2,'add AC compressor',0, 'incomplete', '2021-04-08',2,2,2);

-- procedure to update the status and amount of an incomplete service

CREATE OR REPLACE PROCEDURE update_service(
	_service_id INTEGER,
	_status VARCHAR
)
LANGUAGE plpgsql
AS $L$
BEGIN
	UPDATE service_ticket
	SET status = _status
	WHERE service_id = _service_id;
	
	UPDATE service_ticket
	SET service_cost = parts.cost
	FROM parts
	WHERE service_ticket.parts_id = parts.parts_id;
	COMMIT;
END;
$L$

CALL update_service(2,'complete');

DROP FUNCTION add_customer;
DROP FUNCTION new_invoice;
DROP FUNCTION add_c_car;
DROP FUNCTION add_service_ticket;
DROP PROCEDURE update_service;