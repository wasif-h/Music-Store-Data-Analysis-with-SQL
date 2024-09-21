-- github username -> wasif-h
/*	Question Set 1 - Easy */

/* Q1: Who is the senior most employee based on job title? */


SELECT EmployeeId,
    FirstName || ' ' || LastName,
    Title,
    BirthDate
from employees
GROUP BY Title
ORDER BY min(BirthDate)
   
   
    /* Q2: Which countries have the most Invoices? */

SELECT BillingCountry,
    count(InvoiceId) as Total_Invoice
from invoices
GROUP BY BillingCountry
ORDER BY count(InvoiceId) DESC
    
    
    /* Q3: What are top 3 values of total in invoice? */

SELECT Total
FROM invoices
order by Total DESC
limit 3
    
    
    /* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
     Write a query that returns one city that has the highest sum of invoice totals. 
     Return both the city name & sum of all invoice totals */

SELECT BillingCity,
    BillingCountry,
    sum(Total) as Total_Collection
FROM invoices
GROUP BY BillingCity
ORDER BY sum(Total) DESC
    
    
    /* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
     Write a query that returns the person who has spent the most money.*/

SELECT c.CustomerId,
    c.FirstName || " " || c.LastName as Name,
    c.Email,
    sum(i.Total) as Total_spent
From customers as c
    INNER JOIN invoices as i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY sum(i.Total) DESC