SELECT tipus, AVG(ar), MAX(ar) - MIN(ar) FROM tanfolyam GROUP BY tipus

SELECT megnevezes, CASE WHEN ar > 100000 THEN ‘drága’ ELSE ‘olcsó’

END arkategoria FROM termek

CREATE VIEW tdb AS SELECT MAX(t.megnevezes) nev, COUNT (*) db
FROM tanfolyam t INNER JOIN befizetes b ON b.kurzus = t.tkod GROUP BY
t.tkod

SELECT nev, CASE WHEN db > 10 THEN ‘népszerű’ ELSE ‘nem népszerű’
END letszam FROM tdb