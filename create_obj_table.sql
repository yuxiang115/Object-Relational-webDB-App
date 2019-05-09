CREATE TYPE address_obj AS OBJECT(
	street 				VARCHAR2(200),
	city				VARCHAR2(200),
	state				VARCHAR2(2),
	zipcode 			VARCHAR2(20)
)FINAL;
/

CREATE TYPE customer_obj AS OBJECT(
	customer_name 		VARCHAR2(32),
	address				address_obj
)FINAL;
/

CREATE TYPE software_obj AS VARRAY(100) OF VARCHAR2(64);
/

CREATE TYPE computer_obj AS OBJECT(
	serial_no			number(5),
	speed				VARCHAR2(32),
	price				number(5),
	memory				VARCHAR2(32),
	customer_name	REF	customer_obj,
	facturer_name	REF	microchip_manufacturer_obj,
	softwares			software_obj
)NOT FINAL;
/

CREATE TYPE laptop_obj UNDER computer_obj(
	weight				VARCHAR2(32)
);
/

CREATE TYPE desktop_obj UNDER computer_obj(
	monitor_type		VARCHAR2(32)
);
/

CREATE TYPE microchip_manufacturer_obj AS OBJECT(
	facturer_name		VARCHAR2(32),
	address				address_obj
)FINAL;
/

CREATE TYPE date_obj AS OBJECT(
	month				number(2),
	year				number(4)
)FINAL;
/

CREATE TYPE order_obj AS OBJECT(
	order_no			number(5),
	customer_name	REF customer_obj,
	com_serial_no	REF	computer_obj,
	order_date			data_obj
)FINAL;
/


CREATE TABLE customer_tab OF customer_obj(
	PRIMARY KEY(customer_name)
) OBJECT IDENTIFIER IS PRIMARY KEY;
/

CREATE TABLE computer_tab OF computer_obj(
	PRIMARY KEY(serial_no),
	FOREIGN KEY(customer_name) REFERENCES customer_tab,
	FOREIGN KEY(facturer_name) REFERENCES microchip_manufacturer_tab
	
)OBJECT IDENTIFIER IS PRIMARY KEY;
/


CREATE TABLE microchip_manufacturer_tab OF microchip_manufacturer_obj(
	PRIMARY KEY(facturer_name)
)OBJECT IDENTIFIER IS PRIMARY KEY;
/

CREATE TABLE order_tab OF order_obj(
	PRIMARY KEY(order_no),
	FOREIGN KEY(customer_name) REFERENCES customer_tab,
	FOREIGN KEY(com_serial_no) REFERENCES computer_tab
)OBJECT IDENTIFIER IS PRIMARY KEY;
/

CREATE TABLE laptop_tab OF laptop_obj(
	FOREIGN KEY(customer_name) REFERENCES customer_tab,
	FOREIGN KEY(facturer_name) REFERENCES microchip_manufacturer_tab
);
/
CREATE TABLE desktop_tab OF desktop_obj(
	FOREIGN KEY(customer_name) REFERENCES customer_tab,
	FOREIGN KEY(facturer_name) REFERENCES microchip_manufacturer_tab
);
/
COMMIT;




