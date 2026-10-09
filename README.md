# OnlineBookStore_SQL_Practice_Project

An end-to-end data analytics project showcasing relational database design, data normalization across CSV files, and advanced SQL querying to extract critical business metrics for an e-commerce online bookstore.   


# Tools Used

* Microsoft Excel
* MySQL 

# Project Architecture

The project establishes a relational structure across three core entities linked via common identifiers (Book_ID, Customer_ID) :   

* Books Table: Tracks inventory details (Book_ID, Title, Author, Genre, Published_Year, Price, Stock).
* Customers Table: Manages user demographics (Customer_ID, Name, Email, City, Country).   
* Orders Table: Captures transactional data linking buyers and items (Order_ID, Customer_ID, Book_ID, Quantity, Order_Date, Total_Amount).   

# Key Business Insights & Solved SQL Queries

* Inventory Valuation & Stock Levels: Retrieved total system stock and calculated remaining book quantities post-order fulfillment using LEFT JOIN and COALESCE to handle items with zero orders safely.   
* Financial Performance: Computed total aggregate revenue generated across all transactional orders.   
* Product Extremes: Identified high-value inventory items, top-selling titles, and low-stock warnings to streamline supply chain re-ordering.   
* Genre-wise Sales Performance: Joined orders and books tables to aggregate total unit sales by genre.   
* Customer Segmentation: Filtered high-value customer segments (e.g., locating buyers spending above specific monetary thresholds across cities and isolating repeat buyers with ≥2 orders using HAVING clauses).   
* Author Popularity Analytics: Calculated cumulative quantities sold per author by mapping relational order volumes back to primary book metadata.   

# Repository Structure

1. Books.csv - Raw bookstore inventory dataset.
2. Customers.csv - Raw customer demographics dataset.
3. Orders.csv - Raw transaction logs dataset.
4. Questions.pdf - Project specification and problem statements.
5. SQL_Script.sql - Complete documented SQL script containing table creation and queries.
