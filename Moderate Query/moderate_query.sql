-- github username -> wasif-h

/* Question Set 2 - Moderate */
/* Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
 Return your list ordered alphabetically by email starting with A. */


SELECT DISTINCT Email,
    FirstName,
    LastName,
    genres.Name
FROM customers
    JOIN invoices ON customers.CustomerId = invoices.CustomerId
    JOIN invoice_items ON invoices.InvoiceId = invoice_items.InvoiceId
    JOIN tracks ON invoice_items.TrackId = tracks.TrackId
    JOIN genres ON genres.GenreId = tracks.GenreId
WHERE genres.Name LIKE 'Rock'


    /*  Q2: Let's  invite  the  artists  who  have  written  the  most  rock  music  in  our  dataset.  Write  a 
     query that returns the Artist name and total track count of the top 10 rock bands */

     
SELECT artists.Name,
    count(artists.ArtistId) as total_rock
FROM tracks
    JOIN genres ON tracks.TrackId = genres.GenreId
    JOIN albums ON tracks.AlbumId = albums.AlbumId
    JOIN artists ON albums.AlbumId = artists.ArtistId
WHERE genres.Name LIKE 'Rock'
GROUP BY artists.Name
ORDER BY total_rock DESC


    /* Q3: Return all the track names that have a song length longer than the average song length. 
     Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

SELECT tracks.Name,
    tracks.Milliseconds
FROM tracks
where tracks.Milliseconds > (
        select AVG(Milliseconds)
        from tracks
    )
ORDER BY tracks.Milliseconds DESC