use classicmodels;
select * from customers;
select * from customers where customerNumber = 175;
explain select * from customers where customerNumber = 175;
alter table customers add index idx_full_name(contactFirstName,contactLastName);
explain select * from customers where contactFirstName = 'jean' or contactFirstName = 'king';
alter table customers drop index idx_full_name;