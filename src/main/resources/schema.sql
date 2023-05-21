create schema netology;

create table netology.CUSTOMERS
(
    id           serial primary key,
    name         varchar(100) not null,
    surname      varchar(100) not null,
    age          int          not null check ( age > 0 ),
    phone_number varchar(12)  not null
);

insert into netology.customers(name, surname, age, phone_number)
values ('Alex', 'Templ', 25, +79854567890),
       ('Alexey', 'Ivanov', 30, +78524589785),
       ('Toma', 'Timina', 41, +79632317845),
       ('Alexey', 'Zimin', 52, +77892584512);

create table netology.ORDERS
(
    id           serial primary key,
    date         date default current_date,
    customer_id  int  not null,
    product_name varchar(255),
    amount       real not null check ( amount > 0 ),
    foreign key (customer_id) references netology.customers (id)
);

insert into netology.orders(customer_id, product_name, amount)
values (1, 'Milk', 85.50),
       (2, 'Coffee', 520.62),
       (3, 'Cat Food', 125),
       (4, 'Apples', 97.43);

