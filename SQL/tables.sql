--The code here creates tables for the database
CREATE TABLE postal(
	postal_code varchar(10),
	region varchar(20) NOT NULL,
	city varchar(20) NOT NULL,
	PRIMARY KEY (postal_code)
);

CREATE TABLE address(
	address_id SERIAL PRIMARY KEY,
	country varchar(20) NOT NULL,
	address varchar(30) NOT NULL,
	postal_code varchar(10) NOT NULL,
	FOREIGN KEY (postal_code) REFERENCES postal(postal_code)
);
CREATE TABLE bookstore(
	bookstore_id SERIAL PRIMARY KEY,
	address_id int UNIQUE NOT NULL,
	owner_fName varChar(20) NOT NULL,
	owner_lName varChar(20) NOT NULL,
	contact_email varchar(50) NOT NULL,
	url varchar(100) NOT NULL,
	username varChar(30) UNIQUE NOT NULL,
	password varChar(30) NOT NULL,
	FOREIGN KEY (address_id) REFERENCES address(address_id),
	CONSTRAINT is_valid_email CHECK (contact_email LIKE '%_@_%.__%'),
	CONSTRAINT is_valid_url CHECK (url LIKE '%_._%.__%')
);

CREATE TABLE billing(
	billing_id SERIAL PRIMARY KEY, 
	card_num bigint NOT NULL,
	name_on_card varchar(40) NOT NULL,
	expiry_month int NOT NULL,
	expiry_year int NOT NULL,
	CVC int NOT NULL,
	CONSTRAINT is_valid_credit_card CHECK (999999999999999 < card_num and card_num < 10000000000000000),
	CONSTRAINT is_valid_exp_month CHECK (0 < expiry_month and expiry_month < 13),
	CONSTRAINT is_not_expired CHECK (expiry_year + 2000 > extract( year from NOW()) or (expiry_year + 2000 = extract(year from NOW()) and expiry_month > extract( month from NOW()))),
	CONSTRAINT is_valid_cvc CHECK (99 < CVC and CVC < 1000)
);

CREATE TABLE publisher(
	publisher_id SERIAL PRIMARY KEY,
	company_name varChar (20) UNIQUE NOT NULL,
	account_num bigint NOT NULL, 
	routing_num bigint NOT NULL,
	account_size numeric(10,2) DEFAULT 0,
	email varchar(50) NOT NULL,
	address_id int NOT NULL,
	FOREIGN KEY (address_id) REFERENCES address(address_id),
	CONSTRAINT is_valid_email CHECK (email LIKE '%_@_%.__%'),
	CONSTRAINT is_valid_routing CHECK(9999999 < routing_num and routing_num < 1000000000),
	CONSTRAINT is_valid_account_num CHECK(9999999 < account_num and account_num < 1000000000000)
);

CREATE TABLE user_account(
	user_id SERIAL PRIMARY KEY,
	fName varchar(20) NOT NULL,
	lName varchar(20) NOT NULL,
	email varchar(50) UNIQUE NOT NULL,
	username varchar(30) UNIQUE NOT NULL,
	password varchar(30) NOT NULL,
	CONSTRAINT is_valid_email CHECK (email LIKE '%_@_%.__%'),
	CONSTRAINT is_valid_password CHECK (length(password) >= 8)
);

CREATE TABLE book(
	ISBN bigint, 
	title varchar(50) NOT NULL,
	price numeric(5,2) NOT NULL,
	pub_date date,
	genre varchar(20),
	author varchar(20) NOT NULL,
	description varchar(500),
	page_count int NOT NULL,
	publisher int NOT NULL,
	PRIMARY KEY (ISBN),
	FOREIGN KEY (publisher) REFERENCES publisher(publisher_id),
	CONSTRAINT is_valid_isbn CHECK ((999999999 < ISBN and ISBN < 10000000000) or (999999999999 < ISBN and ISBN < 10000000000000))
);

CREATE TABLE sells (
	bookstore_id int,
	ISBN bigint NOT NULL,
	stock int NOT NULL default (0),
	PRIMARY KEY (bookstore_id, ISBN),
	FOREIGN KEY (bookstore_id) REFERENCES bookstore(bookstore_id),
	FOREIGN KEY (ISBN) REFERENCES book(ISBN)
);

CREATE TABLE owns (
	ISBN bigint,
	user_id int,
	review varchar(2000),
	PRIMARY KEY (ISBN, user_id),
	FOREIGN KEY (ISBN) REFERENCES book(ISBN),
	FOREIGN KEY (user_id) REFERENCES user_account(user_id)
);

CREATE TABLE registered_at (
	cart_id SERIAL PRIMARY KEY,
	bookstore_id int NOT NULL,
	user_id int NOT NULL,
	billing_id int NOT NULL,
	address_id int NOT NULL,
	FOREIGN KEY (bookstore_id) REFERENCES bookstore(bookstore_id),
	FOREIGN KEY (user_id) REFERENCES user_account(user_id),
	FOREIGN KEY (billing_id) REFERENCES billing(billing_id),
	FOREIGN KEY (address_id) REFERENCES address(address_id),
	CONSTRAINT user_billing_unique UNIQUE (bookstore_id, user_id)
);

CREATE TABLE book_in_cart (
	ISBN bigint,
	cart_id int,
	quantity int,
	PRIMARY KEY (ISBN, cart_id),
	FOREIGN KEY (ISBN) REFERENCES book(ISBN),
	FOREIGN KEY (cart_id) REFERENCES registered_at(cart_id)
);

CREATE TABLE order_info(
	order_id SERIAL PRIMARY KEY,
	curr_location varchar(25) NOT NULL default ('Unknown'),
	eta date NOT NULL,
	order_date date NOT NULL default now(),
	user_id int NOT NULL,
	bookstore_id int NOT NULL,
	billing_id int NOT NULL,
	address_id int NOT NULL,
	FOREIGN KEY (user_id) REFERENCES user_account(user_id),
	FOREIGN KEY (bookstore_id) REFERENCES bookstore(bookstore_id),
	FOREIGN KEY (billing_id) REFERENCES billing(billing_id),
	FOREIGN KEY (address_id) REFERENCES address(address_id)
);

CREATE TABLE book_in_order (
	ISBN bigint,
	order_id int,
	quantity int,
	PRIMARY KEY (ISBN, order_id),
	FOREIGN KEY (ISBN) REFERENCES book(ISBN),
	FOREIGN KEY (order_id) REFERENCES order_info(order_id)
);