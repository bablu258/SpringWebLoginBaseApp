--  ****************** START OF SCHEMA ****************************
-- create the database
DROP DATABASE IF EXISTS bookshop;
CREATE DATABASE bookshop;
use bookshop;



CREATE TABLE `users` (

    `username` VARCHAR(50) NOT NULL  primary key,
    `password` VARCHAR(100) NOT NULL  ,
    `enabled` boolean not null
   
);

CREATE TABLE `authorities` (
    `username` VARCHAR(50) NOT NULL,
    `authority` VARCHAR(50) NOT NULL,
   FOREIGN KEY (username)
        REFERENCES users (username)

   
);

CREATE TABLE customers(
    customer_id bigint auto_increment primary key,
    name varchar(64) not null,
    contact_name varchar(128) not null,
    email varchar(128) not null,
    phone varchar(24) not null
);

CREATE TABLE orders(
    order_id bigint auto_increment primary key,
    customer_id bigint not null,
    order_info varchar (2048) not null,
    foreign key (customer_id) references customers(customer_id)
);



-- for customer

INSERT INTO `users` VALUES ('as42@mailinator.com','{bcrypt}$2a$10$XlkdPQQhYcolx8bgp6nL3uNvDs8ZwDXA4KFaDencZsIhjMQO3j5lq',true),
('admin','{bcrypt}$2a$10$XlkdPQQhYcolx8bgp6nL3uNvDs8ZwDXA4KFaDencZsIhjMQO3j5lq',true),
('aswewe42@mailinator.com','{bcrypt}$2a$10$XlkdPQQhYcolx8bgp6nL3uNvDs8ZwDXA4KFaDencZsIhjMQO3j5lq',true);

insert into `authorities` values ('as42@mailinator.com','ROLE_USER'),('admin','ROLE_ADMIN'),('aswewe42@mailinator.com','ROLE_USER');


INSERT INTO customers (name, contact_name, email, phone) values ('Acme', 'Wylie Coyote', 'wcoyote@acme.com', '1-515-555-2348');
INSERT INTO customers (name, contact_name, email, phone) values ('Spacely Space Sprockets', 'George Jettson', 'gjettson@spacely.com', '1-515-555-2350');
INSERT INTO customers (name, contact_name, email, phone) values ('Callahan Auto', 'Thomas Callhan', 'tcallahan@callhhanauto.com', '1-515-555-2333');
INSERT INTO customers (name, contact_name, email, phone) values ('Dundler Mifflin Inc', 'Michael Scott', 'mscott@dundlermifflin.com', '1-515-555-2320');
INSERT INTO customers (name, contact_name, email, phone) values ('Stark Industries', 'Tony Stark', 'tstark@stark.com', '1-515-555-7777');
INSERT INTO customers (name, contact_name, email, phone) values ('Initech', 'Peter Gibbons', 'pgibbons@initec.com', '1-515-555-0666');
INSERT INTO customers (name, contact_name, email, phone) values ('Wayne Enterprises', 'Bruce Wayne', 'bwayne@wayne.com', '1-515-555-1111');

INSERT INTO orders (customer_id, order_info) values ((SELECT customer_id FROM customers where name = 'Acme'), '1500 Widgets');
INSERT INTO orders (customer_id, order_info) values ((SELECT customer_id FROM customers where name = 'Acme'), '3000 Widgets');
INSERT INTO orders (customer_id, order_info) values ((SELECT customer_id FROM customers where name = 'Callahan Auto'), '200 Widgets');

