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

-- 6.   Write a SELECT statement to display how many songs exist for each album.
--      You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT count(), album.title
FROM Album
JOIN Song on song.albumid = album.albumid
group by album.albumid
order by album.title

-- 7.   Write a SELECT statement to display how many songs exist for each artist.
--      You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT count(), artist.artistname
FROM Artist
JOIN Song on song.artistid = artist.artistid
group by artist.artistid
order by artist.artistname

-- 8.   Write a SELECT statement to display how many songs exist for each genre.
--      You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT count(), genre.label
FROM Genre
JOIN Song on song.genreid = genre.genreid
group by genre.genreid
order by genre.label

-- 9.   Using MAX() function, write a select statement to find the album
        -- with the longest duration. The result should display the album
        -- title and the duration.

SELECT album.title, max(album.albumlength)
FROM Album

-- 10    Using MAX() function, write a select statement to find the song
--       with the longest duration. The result should display the song title
--       and the duration.

SELECT song.title, max(song.songlength)
FROM Song

-- 11.  Modify the previous query to also display the title of the album.

SELECT song.title, max(song.songlength), album.title
FROM SONG
JOIN Album on album.albumid = song.albumid