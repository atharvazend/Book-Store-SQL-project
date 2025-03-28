-- Basic quaries

-- 1. retrieve all books in the 'fiction' genre 
SELECT 
    *
FROM
    books
WHERE
    Genre = 'Fiction';


-- 2. find books published after the year 1950
SELECT 
    *
FROM
    books
WHERE
    Published_Year > 1950;


-- 3. list all customers from the Canada
SELECT 
    *
FROM
    customers
WHERE
    country = 'canada';

-- 4. show orderds placed in November 2023

SELECT 
    *
FROM
    orders
WHERE
    YEAR(order_date) = 2023
        AND MONTH(Order_date) = 11;

-- 5. retrieve the total stock of books available
SELECT 
    SUM(stock) AS total_stock
FROM
    books; 


-- 6. find the details of the most expensive book
SELECT 
    *
FROM
    books
WHERE
    price = (SELECT 
            MAX(price) AS most_expensive_book
        FROM
            books);
					-- OR ---
SELECT 
    *
FROM
    books
ORDER BY price DESC
LIMIT 1;
-- 7. show all customer who ordered more than 1 quantity of a book

SELECT 
    customers.name AS customer_name, orders.Quantity
FROM
    customers
        JOIN
    orders ON customers.Customer_ID = orders.Customer_ID
WHERE
    orders.Quantity > 1;

-- 8. retrieve all orders where the total amount exceeds $20

SELECT 
    *
FROM
    orders
WHERE
    orders.Total_Amount > 20;

-- 9. list all generes available in the book table

SELECT DISTINCT
    genre
FROM
    books;

-- 10. find the book with lowest stock

SELECT 
    title, stock
FROM
    books
ORDER BY books.stock
LIMIT 1; 

-- 11. calculate the total revenue generated from all orders

SELECT 
    SUM(total_amount) AS total_revenue
FROM
    orders; 