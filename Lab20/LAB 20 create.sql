create database cars;
use cars;
create table car_model (auto_id INT NOT NULL AUTO_INCREMENT, VIN varchar(255), manufacturer varchar(255), model varchar(255), year YEAR, color varchar(255), primary key (auto_id)) ;
create table customers (auto_id INT NOT NULL AUTO_INCREMENT,customer_id INT, name varchar(255), phone_number varchar(255), email varchar(255), address varchar(255), city varchar(255), state varchar(255), country varchar(255), zipcode varchar(255),primary key (auto_id)) ;
create table salesperson (auto_id INT NOT NULL AUTO_INCREMENT, STAFF_ID varchar(255), name varchar(255), store varchar(255),primary key (auto_id)) ;
create table invoices (auto_id INT NOT NULL AUTO_INCREMENT, invoice_num varchar(255) not null, date date, car INT, customer INT, salesperson INT, 
primary key (auto_id));
ALTER TABLE invoices
ADD CONSTRAINT fk_cust 
FOREIGN KEY (customer) 
REFERENCES customers(auto_id);
ALTER TABLE invoices
ADD CONSTRAINT fk_car 
FOREIGN KEY (car) 
REFERENCES car_model(auto_id);
ALTER TABLE invoices
ADD CONSTRAINT fk_sales 
FOREIGN KEY (salesperson) 
REFERENCES salesperson(auto_id);