-- Advanced quaries
-- 1. retrieve the total number of books sold for each genre
SELECT 
    books.genre, SUM(orders.quantity) AS total_quantity_books
FROM
    books
        JOIN
    orders ON books.Book_ID = orders.Book_ID
GROUP BY books.Genre; 

-- 2. find the average price of books in the "Fantasy" genre
SELECT 
    ROUND(AVG(price), 2) AS avg_price_of_Fantasy_books
FROM
    books
WHERE
    genre = 'Fantasy';

-- 3. list customers who have placed at least 2 orders

SELECT 
     customers.name, COUNT(orders.Order_ID) AS no_of_orders
FROM
    customers
        JOIN
    orders ON customers.Customer_ID = orders.Customer_ID
GROUP BY customers.name
HAVING no_of_orders >=2; 

-- 4. find the most frequently ordered book
SELECT 
    books.title, COUNT(order_ID) AS order_quantity
FROM
    books
        JOIN
    orders ON books.book_id = orders.Book_ID
GROUP BY books.title
ORDER BY order_quantity DESC
LIMIT 1; 

-- 5. show the top 3 most expensive books of 'fantasy' genre

SELECT 
    title AS most_expensive_book, price
FROM
    books
WHERE
    genre = 'fantasy'
ORDER BY price DESC
LIMIT 3;

-- 6. retrieve the total quantity of books soled by each author

SELECT 
    books.author, SUM(orders.Quantity) AS total_quantity
FROM
    books
        JOIN
    orders ON books.book_id = orders.Book_ID
GROUP BY books.author;

-- 7. list the cities where customers who spend over $30 are location

SELECT 
    customers.city, orders.Total_Amount
FROM
    customers
        JOIN
    orders ON orders.Customer_ID = customers.Customer_ID
WHERE orders.Total_Amount > 30;


-- 8 find the customer who spent the most on orders
SELECT 
    customers.Customer_ID,
    customers.name,
    SUM(orders.Total_Amount) AS total_spent
FROM
    customers
        JOIN
    orders ON orders.Customer_ID = customers.Customer_ID
GROUP BY customers.Customer_ID , customers.name
ORDER BY total_spent DESC
LIMIT 1;

-- 9. calculate the stock remaining after fulfilling all orders

SELECT 
    books.Book_ID,
    books.Title,
    COALESCE(SUM(orders.quantity), 0) AS order_quantity,
    books.stock - COALESCE(SUM(orders.quantity), 0) AS remaining_stock
FROM
    books
        LEFT JOIN
    orders ON books.Book_ID = orders.Book_ID
GROUP BY books.Book_ID;
