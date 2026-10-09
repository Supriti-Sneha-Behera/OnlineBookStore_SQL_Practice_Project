SELECT * FROM onlinebookstore_sql_project.books;
SELECT * FROM onlinebookstore_sql_project.customers;
SELECT * FROM onlinebookstore_sql_project.orders;

#---1. RETRIEVE ALL BOOKS IN THE "FICTION" GENRE---
SELECT *
FROM onlinebookstore_sql_project.books
WHERE Genre ="Fiction"
;

#---2. FIND BOOKS PUBLISHED AFTER THE YEAR 1950---
SELECT *
FROM onlinebookstore_sql_project.books
WHERE Published_Year >1950
;

#---3. LIST ALL CUSTOMERS FROM CANADA---
SELECT *
FROM onlinebookstore_sql_project.customers
WHERE Country = "Canada"
;

#---4. SHOW ORDERS PLACED IN NOVEMBER 2023---
SELECT *
FROM onlinebookstore_sql_project.orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30'
;

#---5. RETRIEVE THE TOTAL STOCK OF BOOKS AVAILABLE---
SELECT SUM(Stock) AS total_stock 
FROM onlinebookstore_sql_project.books
;

#---6. FIND THE DETAILS OF THE MOST EXPENSIVE BOOK---
SELECT *
FROM onlinebookstore_sql_project.books
ORDER BY Price DESC
LIMIT 1
;

#---7. SHOW ALL THE CUSTOMERS WHO ORDERED MORE THAN 1 QUANTITY OF A BOOK---
SELECT *
FROM onlinebookstore_sql_project.orders
WHERE Quantity > 1
;

#---8. RETRIEVE ALL ORDERS WHERE THE TOTAL AMOUNT EXCEEDS 520---
SELECT *
FROM onlinebookstore_sql_project.orders
WHERE Total_Amount > 20
;

#---9. LIST ALL GENRES AVAILABLE IN THE BOOKS TABLE---
SELECT Genre
FROM onlinebookstore_sql_project.books
GROUP BY Genre
;

#---10. FIND THE BOOK WITH THE LOWEST STOCK---
SELECT *
FROM onlinebookstore_sql_project.books
ORDER BY Stock
LIMIT 1
;

#---11. CALCULATE THE TOTAL REVENUE GENERATED FROM ALL ORDERS---
SELECT SUM(Total_Amount) AS total_revenue
FROM onlinebookstore_sql_project.orders
;

#---12. RETRIEVE THE TOTAL NUMBER OF BOOKS SOLD BY EACH GENRE---
SELECT b.Genre, SUM(o.Quantity)
FROM orders o
JOIN books b 
ON o.Book_ID = b.Book_ID 
GROUP BY b.Genre
;

#---13. FIND THE AVERAGE PRICE OF BOOKS IN THE "FANTASTY" GENRE---
SELECT AVG(Price) AS Avg_price
FROM onlinebookstore_sql_project.books
WHERE Genre="Fantasy"
;

#---14. LIST CUSTOMERS WHO HAVE PLACED ATELAST 2 ORDERS---
SELECT Customer_ID,COUNT(Order_ID)AS order_count
FROM onlinebookstore_sql_project.orders
GROUP BY Customer_ID
HAVING COUNT(Order_ID) >=2
;

SELECT o.Customer_ID,c.Name,COUNT(o.Order_ID)AS order_count
FROM orders o
JOIN customers c
ON o.Customer_ID = c.Customer_ID
GROUP BY o.Customer_ID,c.Name
HAVING COUNT(o.Order_ID) >=2
;

#---15. FIND THE MOST FREQUENTLY ORDER BOOK---
SELECT o.Book_ID,b.Title,COUNT(o.Order_ID) AS Order_count
FROM books b
JOIN orders o
ON b.Book_ID = o.Book_ID
GROUP BY o.Book_ID 
ORDER BY Order_count DESC
LIMIT 1
;

#---16. SHOW THE TOP 3 MOST EXPENSIVE BOOKS OF "FANTASY" GENRE---
SELECT * 
FROM onlinebookstore_sql_project.books
WHERE Genre ="Fantasy"
ORDER BY PRICE DESC
LIMIT 3
;

#---17. RETRIEVE THE TOTAL QUANTITY OF BOOKS SOLD BY EACH AUTHOR---
SELECT b.Author,SUM(o.Quantity) AS Total_quantity
FROM books b
JOIN orders o
ON b.Book_ID = o. Book_ID
GROUP BY b.Author
;

#---18. LIST THE CITIES WHERE CUSTOMERS WHO SPENT OVER 30 ARE LOCATED
SELECT DISTINCT c.City,c.Country,o.Total_Amount
FROM customers c
JOIN orders o
ON c.Customer_ID = o.Customer_ID
WHERE o.Total_Amount > 30
;

#---18. FIND THE CUSTOMER WHO SPENT THE MOST ON ORDERS
SELECT c.Customer_ID,c.Name, SUM(o.Total_Amount) AS Most_amount
FROM customers c
JOIN orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Name
ORDER BY Most_amount DESC
LIMIT 1
;

#---19. CALCULATE THE STOCK REMAINING AFTER FULFILLING ALL THE ORDERS---
SELECT b.Book_ID,b.Title,b.Stock,
COALESCE(SUM(o.Quantity),0) AS Order_quantity,
b.Stock-COALESCE(SUM(o.Quantity),0) AS Remaining_quantity
FROM books b
LEFT JOIN orders o
ON b.Book_ID = o. Book_ID
GROUP BY b.Book_ID
ORDER BY b.Book_ID
;



