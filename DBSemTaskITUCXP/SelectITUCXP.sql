List�zza ki azokat a term�keket amelyek dr�g�bbak mint 350.
SELECT Nev FROM Termek WHERE Ar > 350;

?�nev ?�ar�> 350�termek

List�zza azon v�s�rl�k nev�t �s telefonsz�m�t, akik rendelkeznek pontgy�jt� k�rty�val.

SELECT Nev, Telefonszam FROM Pontgyujto_kartya ORDER BY Nev ASC;

?�nev ?�nev,�telefonszam�pontgyujto_kartya

List�zza azon v�s�rl�k nev�t, akik rendelkeznek pontgy�jt� k�rty�val �s tiszal�ciak.

SELECT Nev FROM Pontgyujto_kartya WHERE Varos = "Tiszaluc";

?�nev ?�varos�= "Tiszaluc"�pontgyujto_kartya

List�zza azt az �zletet amelyik minden nap 6-18 �r�ig van nyitva.

SELECT * FROM Uzlet WHERE Nyitvatartas = "6-18";

?�nyitvatartas�= "6-18"�uzlet

List�zza ki azokat a term�keket melyek tejterm�kek.

SELECT * FROM Termek WHERE Nev LIKE '%tej%';

?�nev�LIKE�"%tej%"�termek

List�zza ki azokat a term�keket melyek 2021-02-15 el�tt �rkeztek.

SELECT * FROM Termek LEFT JOIN Szallitas ON Szallitas.Termek_ID = Termek.Termek_ID WHERE Szallitas.Datum < "2021-02-15";

?�Szallitas.Datum < "2021-02-15"? Szallitas.Termek_ID = Termek.Termek_ID Szallitas

List�zza ki azon dolgoz�k �sszes adat�t, akik a B�ziscsemege �zletben dolgoznak.

SELECT * FROM Dolgozo LEFT JOIN Uzlet ON Dolgozo.Uzlet_ID = Uzlet.Uzlet_ID WHERE Uzlet.Nev = "Baziscsemege";

?�Uzlet.Nev = "Baziscsemege"? Dolgozo.Uzlet_ID = Uzlet.Uzlet_ID Uzlet

List�zza ki az �tlagosn�l dr�g�bb term�kek �sszes adat�t.

SELECT * FROM Termek WHERE Ar > (SELECT AVG(Ar) FROM Termek);

?�ar� > ?�AVG�(ar) ?�AVG�(ar)�termek

List�zza ki �zletenk�nt a dolgoz�k sz�m�t cs�kken� sorrendben.

SELECT Uzlet.Nev, (SELECT COUNT(*) FROM Dolgozo WHERE Dolgozo.Uzlet_ID=Uzlet.Uzlet_ID) as Dolgozok_Szama FROM Uzlet ORDER BY Dolgozok_Szama DESC;

?�dolgozok_szama ? (? COUNT�(*) ?�COUNT�(*) ?�dolgozo�.�uzlet_id =�uzlet�.�uzlet_id�dolgozo)?�uzlet�.�nev�?�dolgozok_szama�uzlet 

List�zza ki melyik besz�ll�t� melyik �zletbe sz�ll�tott m�r term�keket.

SELECT DISTINCT Uzlet.Nev, Nagyker.Nev FROM Uzlet JOIN Termek ON Termek.Uzlet_ID = Uzlet.Uzlet_ID JOIN Szallitas ON Szallitas.Termek_ID = Termek.Termek_ID JOIN Nagyker ON Nagyker.Nagyker_ID = Szallitas.Nagyker_ID;

? ?�uzlet�.�nev,�nagyker�.�nev�(uzlet ?�termek�.�uzlet_id =�uzlet�.�uzlet_id�termek�?�szallitas�.�termek_id =�termek�.�termek_id�szallitas�?�nagyker�.�nagyker_id =�szallitas�.�nagyker_id�nagyker)
