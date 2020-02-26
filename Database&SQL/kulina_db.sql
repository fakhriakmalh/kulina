CREATE DATABASE fakhri
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Indonesian_Indonesia.1252'
    LC_CTYPE = 'Indonesian_Indonesia.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
CREATE TABLE ku_user_status(
	id int NOT NULL PRIMARY KEY , 
	name varchar(255) NOT NULL , 
	created_at date,
	updated_at date) ;
	
CREATE TABLE ku_user_location_type(
	id int NOT NULL PRIMARY KEY , 
	name varchar(255) NOT NULL , 
	created_at date,
	updated_at date) ;
	
CREATE TABLE ku_user_location_status(
	id int NOT NULL PRIMARY KEY , 
	name varchar(255) NOT NULL , 
	created_at date,
	updated_at date) ;
	
CREATE TABLE ku_user(
	id int NOT NULL PRIMARY KEY , 
	name varchar(255) , 
	email varchar(255) , 
	phone varchar(255) , 
	password_hash varchar(255) , 
	salt varchar(255), 
	photo varchar(255) , 
	status int,
	created_at date,
	updated_at date,
	FOREIGN KEY (status) REFERENCES ku_user_status(id))

CREATE TABLE ku_order_status(
	id int NOT NULL PRIMARY KEY , 
	name varchar(255) NOT NULL , 
	created_at date,
	updated_at date) ; 

CREATE TABLE ku_product_status(
	id int NOT NULL PRIMARY KEY , 
	name varchar(255) NOT NULL , 
	created_at date,
	updated_at date) ; 

CREATE TABLE ku_user_location(
	id int NOT NULL PRIMARY KEY , 
	type int , 
	status int,
	user_id int,
	location varchar (255),
	address varchar (255),
	created_at date,
	updated_at date, 
	FOREIGN KEY (type) REFERENCES ku_user_location_type(id),
	FOREIGN KEY (status) REFERENCES ku_user_location_status(id),
	FOREIGN KEY (user_id) REFERENCES ku_user(id));
	
CREATE TABLE ku_order(
	id int NOT NULL PRIMARY KEY , 
	user_id int , 
	status int ,  
	created_at date,
	updated_at date,
	FOREIGN KEY (user_id) REFERENCES ku_user(id), 
	FOREIGN KEY (status) REFERENCES ku_user_status(id)
	) ; 
	
CREATE TABLE ku_product(
	id int NOT NULL PRIMARY KEY , 
	user_id int , 
	status int ,  
	created_at date,
	updated_at date,
	FOREIGN KEY (user_id) REFERENCES ku_user(id), 
	FOREIGN KEY (status) REFERENCES ku_user_status(id)
	) ; 

CREATE TABLE ku_category(
	id int NOT NULL PRIMARY KEY , 
	name varchar(255) NOT NULL , 
	created_at date,
	updated_at date) ; 

CREATE TABLE ku_order_detail_status(
	id int NOT NULL PRIMARY KEY , 
	name varchar(255) NOT NULL , 
	created_at date,
	updated_at date) ; 
	
CREATE TABLE ku_product(
	id int NOT NULL PRIMARY KEY , 
	name varchar(255), 
	effective_date date , 
	effective_until date, 
	photo varchar(255), 
	price int, 
	status int, 
	created_at date,
	updated_at date, 
	FOREIGN KEY (status) REFERENCES ku_product_status(id))

CREATE TABLE ku_product_category(
	id int NOT NULL PRIMARY KEY , 
	product_id int, 
	category_id int, 
	created_at date,
	updated_at date,
	FOREIGN KEY (product_id) REFERENCES ku_product(id), 
	FOREIGN KEY (category_id) REFERENCES ku_category(id))

CREATE TABLE ku_order_detail(
	id int NOT NULL PRIMARY KEY , 
	user_location_id int, 
	order_id int, 
	product_id int, 
	quantity int, 
	delivery_date date, 
	status int, 
	created_at date,
	updated_at date,
	FOREIGN KEY (product_id) REFERENCES ku_product(id), 
	FOREIGN KEY (category_id) REFERENCES ku_category(id))
