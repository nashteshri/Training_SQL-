create table customers_2025(
customer_id int primary key,
first_name varchar(30) not null,
last_name varchar(30) not null,
email varchar(100) unique not null,
phone varchar(20),
address text
)


create table books2_2025(
book_id int primary key,
title varchar(255) not null,
author varchar(255) not null,
genre varchar(255) not null,
price decimal (10,2) not null,

)



create table orders2_2025(
order_id int primary key,
customer_id int,
book_id int,
quantity int not null,
total_amount decimal(10,2) not null ,
status varchar(30)
);



-- Insert additional data into customers table
INSERT INTO customers_2025 (customer_id, first_name, last_name, email, phone, address) VALUES
(4, 'Michael', 'Brown', 'michael.brown@example.com', '2345678901', '321 Pine Street'),
(5, 'Emily', 'Davis', 'emily.davis@example.com', '3456789012', '654 Birch Street'),
(6, 'David', 'Wilson', 'david.wilson@example.com', '4567890123', '987 Cedar Street'),
(7, 'Laura', 'Miller', 'laura.miller@example.com', '5678901234', '123 Spruce Street'),
(8, 'Sarah', 'Taylor', 'sarah.taylor@example.com', '6789012345', '456 Aspen Street'),
(9, 'James', 'Anderson', 'james.anderson@example.com', '7890123456', '789 Fir Street'),
(10, 'Olivia', 'Thomas', 'olivia.thomas@example.com', '8901234567', '321 Willow Street');

-- Insert additional data into books table
INSERT INTO books2_2025 (book_id, title, author, genre, price) VALUES
(4, 'Brave New World', 'Aldous Huxley', 'Dystopian', 9.99),
(5, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 11.99),
(6, 'Pride and Prejudice', 'Jane Austen', 'Romance', 14.99),
(7, 'Moby-Dick', 'Herman Melville', 'Adventure', 13.99),
(8, 'The Odyssey', 'Homer', 'Epic', 15.99),
(9, 'War and Peace', 'Leo Tolstoy', 'Historical', 19.99),
(10, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 12.99);

-- Insert additional data into orders table
INSERT INTO orders2_2025 (order_id, customer_id, book_id, quantity, total_amount, status) VALUES
(4, 4, 4, 1, 9.99, 'Shipped'),
(5, 5, 5, 2, 23.98, 'Processing'),
(6, 6, 6, 1, 14.99, 'Delivered'),
(7, 7, 7, 2, 27.98, 'Processing'),
(8, 8, 8, 1, 15.99, 'Delivered'),
(9, 9, 9, 1, 19.99, 'Shipped'),
(10, 10, 10, 2, 25.98, 'Processing');



SELECT 
    customer_id,
    first_name,
    last_name,
    email
FROM 
    customers_2025
WHERE 
    customer_id IN (SELECT DISTINCT customer_id FROM orders2_2025);





SELECT 
    book_id,
    title,
    author,
    genre,
    price
FROM 
    books2_2025
WHERE 
    book_id NOT IN (SELECT DISTINCT book_id FROM orders2_2025);
