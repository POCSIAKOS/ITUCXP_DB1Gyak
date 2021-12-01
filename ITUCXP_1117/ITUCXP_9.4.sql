ALTER TABLE termek ADD (kategoria CHAR(50))
CREATE VIEW kgy AS SELECT g.adoszam, t.kategoria FROM gyarto g LEFT
OUTER JOIN termek t ON g.adoszam = t.gyarto GROUP BY
g.adoszam, t.kategoria

CREATE VIEW kgy2 AS SELECT kategoria, COUNT(adoszam) db FROM
kgy GROUP BY kategoria

SELECT kategoria FROM kgy2 WHERE db = (SELECT COUNT(*) FROM
gyarto)