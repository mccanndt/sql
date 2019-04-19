use bmdb;

SELECT m.Title,
	   m.Year,
       m.Rating,
       g.Name as 'Genre'
	FROM movie m
    JOIN moviegenre mg ON m.ID = mg.movieID
    JOIN genre g ON mg.genreID = g.ID
ORDER BY m.Title;
    
SELECT m.Title,
	   m.Year,
       m.Rating,
       concat(a.FirstName, ' ', a.LastName) as 'Actor',
       c.Role
	FROM movie m
    JOIN credit c ON m.ID = c.movieID
    JOIN actor a ON c.actorID = a.ID
ORDER BY m.Title, 'Actor';