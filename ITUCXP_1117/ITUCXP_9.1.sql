ALTER TABLE alkatresz ADD ( ar INT CHECK (ar > 0))

SELECT nev FROM gyarto g LEFT OUTER JOIN termek t ON
g.adoszam = t.gyarto) WHERE tkod IS NULL

UPDATE termek SET ear = 1.1*ear WHERE tkod IN ( SELECT
termek FROM komponens WHERE alkatresz = (SELECT akod FROM
alkatresz WHERE nev = ‘X’))

CREATE VIEW et AS SELECT MAX(t.nev) nev, t.tkod, COUNT(*) db

FROM termek t INNER JOIN egysegek e ON e.aru = t.tkod

GROUP BY t.tkod

SELECT nev FROM et WHERE db = (SELECT MAX(db) FROM et)