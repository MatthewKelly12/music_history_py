-- 1. Query all of the entries in the Genre table
SELECT genre.label
FROM Genre

-- 2. Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT into Artist
values (null, "Fistikuffs", 2011)

-- 3. Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT into Album
select null, "Rock, Paper, Sizurp", 2012, 7323, "Kuffs Up",  artist.artistid, genre.genreid
FROM Artist, Genre
WHERE artist.artistname = "Fistikuffs"
AND genre.label = "Rap"

-- 4. Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT into Song
select null, "615", 324,  "06/12/1982", genre.genreid,  artist.artistid, album.albumid
FROM  Genre, Artist, Album
WHERE  genre.label = "Rap"
AND artist.artistname= "Fistikuffs"
AND album.title = "Rock, Paper, Sizurp"

INSERT into Song
select null, "Cold Hearted Pimp", 545,  "06/12/2012", genre.genreid,  artist.artistid, album.albumid
FROM  Genre, Artist, Album
WHERE  genre.label = "Rap"
AND artist.artistname= "Fistikuffs"
AND album.title = "Rock, Paper, Sizurp"


-- 5.   Write a SELECT query that provides the song titles, album title,
--      and artist name for all of the data you just entered in.
--      Use the LEFT JOIN keyword sequence to connect the tables,
--      and the WHERE keyword to filter the results to the album and artist you added.

SELECT artist.artistname, song.title, album.title
FROM  Song, Album
LEFT JOIN Artist
WHERE song.artistid = album.artistid
AND song.artistid = artist.artistid
AND song.title = "615"

SELECT artist.artistname, song.title, album.title
FROM  Song, Album
LEFT JOIN Artist
WHERE song.artistid = album.artistid
AND song.artistid = artist.artistid
AND artist.artistname = "Fistikuffs"

-- 6. Write a SELECT statement to display how many songs exist for each album.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.