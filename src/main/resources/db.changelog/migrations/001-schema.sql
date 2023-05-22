--liquibase formatted sql

--changeset daria_suntcova:1
create schema netology;

--changeset daria_suntcova:2
create table netology.CUSTOMERS
(
    id           serial primary key,
    name         varchar(100) not null,
    surname      varchar(100) not null,
    age          int          not null check ( age > 0 ),
    phone_number varchar(12)  not null
);


--changeset daria_suntcova:3
create table netology.ORDERS
(
    id           serial primary key,
    date         date default current_date,
    customer_id  int  not null,
    product_name varchar(255),
    amount       real not null check ( amount > 0 ),
    foreign key (customer_id) references netology.customers (id)
);