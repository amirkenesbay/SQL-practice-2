CREATE TABLE Movies (
    Code INTEGER PRIMARY KEY NOT NULL,
    Title TEXT NOT NULL,
    Rating TEXT
);

CREATE TABLE MovieTheaters (
    Code INTEGER PRIMARY KEY NOT NULL,
    Name TEXT NOT NULL,
    Movie INTEGER
        CONSTRAINT fk_Movies_Code REFERENCES Movies(Code)
);

INSERT INTO Movies (Code, Title, Rating) VALUES (9, 'Citizen King', 'G');
INSERT INTO Movies (Code, Title, Rating) VALUES (1, 'Citizen Kane', 'PG');
INSERT INTO Movies (Code, Title, Rating) VALUES (2, 'Singin'' in the Rain', 'G');
INSERT INTO Movies (Code, Title, Rating) VALUES (3, 'The Wizard of Oz', 'G');
INSERT INTO Movies (Code, Title, Rating) VALUES (4, 'The Quiet Man', NULL);
INSERT INTO Movies (Code, Title, Rating) VALUES (5, 'North by Northwest', NULL);
INSERT INTO Movies (Code, Title, Rating) VALUES (6, 'The Last Tango in Paris', 'NC-17');
INSERT INTO Movies (Code, Title, Rating) VALUES (7, 'Some Like it Hot', 'PG-13');
INSERT INTO Movies (Code, Title, Rating) VALUES (8, 'A Night at the Opera', NULL);

INSERT INTO MovieTheaters (Code, Name, Movie) VALUES (1, 'Odeon', 5);
INSERT INTO MovieTheaters (Code, Name, Movie) VALUES (2, 'Imperial', 1);
INSERT INTO MovieTheaters (Code, Name, Movie) VALUES (3, 'Majestic', NULL);
INSERT INTO MovieTheaters (Code, Name, Movie) VALUES (4, 'Royale', 6);
INSERT INTO MovieTheaters (Code, Name, Movie) VALUES (5, 'Paraiso', 3);
INSERT INTO MovieTheaters (Code, Name, Movie) VALUES (6, 'Nickelodeon', NULL);


SELECT Title FROM Movies;

SELECT DISTINCT Rating FROM Movies;

SELECT * FROM Movies WHERE Rating IS NULL;

SELECT * FROM MovieTheaters WHERE Movie IS NULL;

SELECT * FROM MovieTheaters LEFT JOIN Movies M on M.Code = MovieTheaters.Movie;

SELECT * FROM MovieTheaters RIGHT JOIN Movies M on M.Code = MovieTheaters.Movie;

SELECT M.Title FROM MovieTheaters RIGHT JOIN Movies M on M.Code = MovieTheaters.Movie WHERE MovieTheaters.Movie IS NULL;

INSERT INTO Movies (Code, Title, Rating) VALUES (10, 'One, Two, Three', null);

UPDATE Movies SET Rating = 'G' WHERE Rating IS NULL;

DELETE FROM MovieTheaters WHERE Movie IN (SELECT Code From Movies WHERE Rating = 'NC-17');