-- github username -> wasif-h
/* Question Set 3 - Advance */
/* Q1: Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent */

-- CTE 
WITH best_selling_artist AS(
    SELECT artists.ArtistId,
        artists.Name,
        sum(invoice_items.Quantity * invoice_items.UnitPrice) as Total
    From invoice_items
        JOIN tracks ON tracks.TrackId = invoice_items.TrackId
        JOIN albums ON albums.AlbumId = tracks.AlbumId
        JOIN artists ON artists.ArtistId = albums.ArtistId
    GROUP BY 1,
        2
    ORDER BY 3 DESC
)
SELECT customers.CustomerId,
    customers.FirstName,
    best_selling_artist.Name,
    sum(invoice_items.Quantity * invoice_items.UnitPrice) as Total
From customers
    JOIN invoices ON
    customers.CustomerId = invoices.CustomerId
    JOIN invoice_items ON
    invoices.InvoiceId = invoice_items.InvoiceId
    JOIN tracks ON tracks.TrackId = invoice_items.TrackId
    JOIN albums ON albums.AlbumId = tracks.AlbumId
    JOIN best_selling_artist ON
    albums.ArtistId = best_selling_artist.ArtistId
    GROUP BY 1,2,3
    ORDER BY 4 DESC




    /* Q2: We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre 
     with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where 
     the maximum number of purchases is shared return all Genres. */

     
    /* Q3: Write a query that determines the customer that has spent the most on music for each country. 
     Write a query that returns the country along with the top customer and how much they spent. 
     For countries where the top amount spent is shared, provide all customers who spent this amount. */
    /* Thank You :) */