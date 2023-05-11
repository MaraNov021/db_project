CREATE TABLE IF NOT EXISTS Rating
(
    title             VARCHAR(200) PRIMARY KEY,
    category	      VARCHAR(200),
    color             VARCHAR(200)
    
);

CREATE TABLE IF NOT EXISTS Orientation
(
    title             VARCHAR(200) PRIMARY KEY,
    emblem            VARCHAR(200),
    color             VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS Beta
(
    beta_id           INTEGER PRIMARY KEY,
    name              VARCHAR(200) NOT NULL,
    literacy_rates    INTEGER
);

CREATE TABLE IF NOT EXISTS Author
(
    author_id         INTEGER PRIMARY KEY,
    name              VARCHAR(200) NOT NULL,
    num_gifts         INTEGER
);


CREATE TABLE IF NOT EXISTS Fandom
(
    fandom_id         INTEGER PRIMARY KEY,
    title             VARCHAR(200) NOT NULL,
    category          VARCHAR(200) NOT NULL,
    num_fanfics       INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Deleted_fanfic
(
    fanfic_id         INTEGER PRIMARY KEY,
    title             VARCHAR(200) NOT NULL,
    fandom            INTEGER NOT NULL,
    author            INTEGER NOT NULL,
    date_of_public    INTEGER NOT NULL,
    date_of_del       INTEGER NOT NULL,
    
    FOREIGN KEY (fandom) REFERENCES Fandom(fandom_id),
    FOREIGN KEY (author) REFERENCES Author(author_id)
);

CREATE TABLE IF NOT EXISTS Application
(
    application_id    INTEGER PRIMARY KEY,
    author            INTEGER NOT NULL,
    title             VARCHAR(200) NOT NULL,
    num_written_fan  INTEGER,
    
    FOREIGN KEY (author) REFERENCES Author(author_id)
);

CREATE TABLE IF NOT EXISTS Fanfic
(
    fanfic_id         INTEGER PRIMARY KEY,
    title             VARCHAR(200) NOT NULL,
    fandom            INTEGER NOT NULL,
    author            INTEGER NOT NULL,
    beta              INTEGER,
    application       INTEGER,
    orientation       VARCHAR(200),
    rating            VARCHAR(200),
    num_likes         INTEGER,
    num_awards        INTEGER,
    date_of_public    INTEGER NOT NULL,
    
    FOREIGN KEY (fandom) REFERENCES Fandom(fandom_id),
    FOREIGN KEY (author) REFERENCES Author(author_id),
    FOREIGN KEY (beta) REFERENCES Beta(beta_id),
    FOREIGN KEY (application) REFERENCES Application(application_id),
    FOREIGN KEY (orientation) REFERENCES Orientation(title),
    FOREIGN KEY (rating) REFERENCES Rating(title)
);

INSERT INTO Rating(title, category, color)
VALUES ('NC-17', 'adult', 'orange'),
       ('NC-21', 'adult', 'red'),
       ('R', 'teenager', 'light-red'),
       ('G', 'child', 'green'),
       ('PG-13', 'child', 'light-green');
       
INSERT INTO Orientation(title, emblem, color)
VALUES ('Jen', '/\', 'brown'),
       ('Slash', 'o/o/', 'blue'),
       ('Femslash', 'o|o|', 'pink'),
       ('Get', 'o|o/', 'green'),
       ('Article', '###', 'grey'),
       ('Mix', '-x-', 'yellow'),
       ('Other', '~~~', 'yellow');

INSERT INTO Beta(beta_id, name, literacy_rates)
VALUES (1, 'Kate', 76),
       (2, 'Sunni', 98),
       (3, 'Lisa', 87),
       (4, 'RAM0', 91),
       (5, 'rinlii', 100);
       
INSERT INTO Author(author_id, name, num_gifts)
VALUES (1, 'Каури-4', 151),
       (2, 'Кукульман', 590),
       (3, 'IRA_SV_GLBR', 165),
       (4, 'Ruusen', 11),
       (5, 'Useless goddes', 58),
       (6, 'm is for mika', 401),
       (7, 'Joy', NULL),
       (8, 'cygne', 210),
       (9, 'Киииса', 68),
       (10, 'katosSnape', 27),
       (11, 'Heika Mitich', 329);
       
INSERT INTO Fandom(fandom_id, title, category, num_fanfics)
VALUES (1, 'Harry Potter', 'Books', 4),
       (2, 'BTS', 'RPF', 3),
       (3, 'Naruto', 'Anime & manga', 4),
       (4, 'iKON', 'RPF', 1),
       (5, 'Kuroko no Basuke', 'Anime & manga', 2);


INSERT INTO Deleted_fanfic(fanfic_id, title, fandom, author, date_of_public, date_of_del)
VALUES (15, 'Дни Мародеров', 1, 7, 06062012, 22092019);
     
INSERT INTO Application(application_id, author, title, num_written_fan)
VALUES (1, 2, 'Хочу попаданку в Молли Прюэтт', 1),
       (2, 11, 'Поколение чудес снова вместе', 1);

INSERT INTO Fanfic(fanfic_id, title, fandom, author, beta, application, orientation, rating, num_likes, num_awards, date_of_public)
VALUES (1, 'Молли навсегда', 1, 1, 2, 1, 'Get', 'R', 6762, 115, 17012015),
       (2, 'В борьбе обретешь ты...', 1, 2, 4, NULL, 'Slash', 'R', 15680, 197, 04052014),
       (3, 'Контраст', 3, 3, 5, NULL, 'Slash', 'NC-17', 804, 13, 10122017),
       (4, 'Две грани', 3, 3, 5, NULL, 'Slash', 'NC-17', 2692, 23, 18042013),
       (5, 'Как скажешь', 3, 3, NULL, NULL,'Slash', 'NC-17', 318, 22, 26062019),
       (6, 'Пролог на небеса', 3, 4, NULL, NULL,'Slash', 'NC-17', 241, 8, 10012018),
       (7, 'Желтые глаза в темноте леса', 2, 5, 2, NULL, 'Slash','NC-17', 18089, 43, 06122020),
       (8, 'Черный пес и серебряная цепь', 2, 5, NULL, NULL,'Slash','NC-17', 462, 4, 24122021),
       (9, 'my heart is so full of you(i barely call it mine)', 2, 6, 1, NULL, 'Slash','NC-17', 15410, 39, 28022021),
       (10, 'История Мародеров', 1, 8, 2, NULL, 'Get','PG-13', 5264, 135, 17112013),
       (11, 'Время идти дальше', 1, 8, 2, NULL, 'Get','PG-13', 483, 0, 14112013),
       (12, 'Давай заключим сделку?', 5, 9, NULL, NULL, 'Get','NC-17', 1983, 36, 01022013),
       (13, 'Осколки', 5, 10, NULL, NULL, 'Jen','R', 1339, 26, 20112014),
       (14, 'Der Schmutz.', 4, 11, NULL, NULL, 'Slash','NC-17', 1321, 7, 12062017);

SELECT title
FROM Fanfic
WHERE fandom = 1;

SELECT sum(num_awards)
FROM Fanfic
WHERE fandom = 3;

UPDATE Beta
SET literacy_rates = 0
WHERE literacy_rates < 80;

SELECT literacy_rates
FROM Beta;

SELECT count(author_id)
FROM Author
WHERE num_gifts > 200;

DELETE 
FROM Orientation
WHERE title = 'Femslash';

SELECT title
FROM Orientation;
       
/* GROUP BY + HAVING
Должен выводить количество фанфиков каждого жанра, кроме Mix*/
SELECT orientation, count(fanfic_id)
FROM Fanfic
GROUP BY orientation
HAVING orientation != 'Mix';


/* ORDER BY
Должен вывести фендомы отсортированные по количеству лайков */
SELECT Fandom.title, sum(num_likes)
FROM Fanfic JOIN Fandom 
ON fandom = fandom_id
GROUP BY fandom, fandom_id
ORDER BY sum DESC;

/* OVER + PARTITION BY
Должен вывести id фантиков, названия и общее количество лайков у каждого автора */
SELECT fanfic_id, title, sum(num_likes) OVER(PARTITION BY author)
FROM Fanfic;

/* OVER + ORDER BY
Cортирует авторов в алфавитном порядке и выводит их имена и номер в данном порядке*/
SELECT ROW_NUMBER() OVER(ORDER BY name), name
FROM Author;

/* OVER + PARTITION BY + ORDER BY
Группирует фантики по фендомам и выводит самые популярные по количеству лайков*/
SELECT fandom, count(fanfic_id) OVER(PARTITION BY fandom ORDER BY num_likes), title, num_likes
FROM Fanfic;

/*  все 3 типа функций - агрегирующие, ранжирующие, смещения
Должен выводить id автора, его фанфики, отсортированные по алфавиту, а также общее количество наград автора*/
SELECT first_value(author) OVER(PARTITION BY author ORDER BY title),title, sum(num_awards) OVER(PARTITION BY author) 
FROM Fanfic;

