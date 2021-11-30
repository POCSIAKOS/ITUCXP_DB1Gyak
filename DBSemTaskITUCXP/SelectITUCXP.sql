Listázza ki azokat a termékeket amelyek drágábbak mint 350.
SELECT Nev FROM Termek WHERE Ar > 350;

? nev ? ar > 350 termek

Listázza azon vásárlók nevét és telefonszámát, akik rendelkeznek pontgyûjtõ kártyával.

SELECT Nev, Telefonszam FROM Pontgyujto_kartya ORDER BY Nev ASC;

? nev ? nev, telefonszam pontgyujto_kartya

Listázza azon vásárlók nevét, akik rendelkeznek pontgyûjtõ kártyával és tiszalúciak.

SELECT Nev FROM Pontgyujto_kartya WHERE Varos = "Tiszaluc";

? nev ? varos = "Tiszaluc" pontgyujto_kartya

Listázza azt az üzletet amelyik minden nap 6-18 óráig van nyitva.

SELECT * FROM Uzlet WHERE Nyitvatartas = "6-18";

? nyitvatartas = "6-18" uzlet

Listázza ki azokat a termékeket melyek tejtermékek.

SELECT * FROM Termek WHERE Nev LIKE '%tej%';

? nev LIKE "%tej%" termek

Listázza ki azokat a termékeket melyek 2021-02-15 elõtt érkeztek.

SELECT * FROM Termek LEFT JOIN Szallitas ON Szallitas.Termek_ID = Termek.Termek_ID WHERE Szallitas.Datum < "2021-02-15";

? Szallitas.Datum < "2021-02-15"? Szallitas.Termek_ID = Termek.Termek_ID Szallitas

Listázza ki azon dolgozók összes adatát, akik a Báziscsemege üzletben dolgoznak.

SELECT * FROM Dolgozo LEFT JOIN Uzlet ON Dolgozo.Uzlet_ID = Uzlet.Uzlet_ID WHERE Uzlet.Nev = "Baziscsemege";

? Uzlet.Nev = "Baziscsemege"? Dolgozo.Uzlet_ID = Uzlet.Uzlet_ID Uzlet

Listázza ki az átlagosnál drágább termékek összes adatát.

SELECT * FROM Termek WHERE Ar > (SELECT AVG(Ar) FROM Termek);

? ar  > ? AVG (ar) ? AVG (ar) termek

Listázza ki üzletenként a dolgozók számát csökkenõ sorrendben.

SELECT Uzlet.Nev, (SELECT COUNT(*) FROM Dolgozo WHERE Dolgozo.Uzlet_ID=Uzlet.Uzlet_ID) as Dolgozok_Szama FROM Uzlet ORDER BY Dolgozok_Szama DESC;

? dolgozok_szama ? (? COUNT (*) ? COUNT (*) ? dolgozo . uzlet_id = uzlet . uzlet_id dolgozo)? uzlet . nev ? dolgozok_szama uzlet 

Listázza ki melyik beszállító melyik üzletbe szállított már termékeket.

SELECT DISTINCT Uzlet.Nev, Nagyker.Nev FROM Uzlet JOIN Termek ON Termek.Uzlet_ID = Uzlet.Uzlet_ID JOIN Szallitas ON Szallitas.Termek_ID = Termek.Termek_ID JOIN Nagyker ON Nagyker.Nagyker_ID = Szallitas.Nagyker_ID;

? ? uzlet . nev, nagyker . nev (uzlet ? termek . uzlet_id = uzlet . uzlet_id termek ? szallitas . termek_id = termek . termek_id szallitas ? nagyker . nagyker_id = szallitas . nagyker_id nagyker)
