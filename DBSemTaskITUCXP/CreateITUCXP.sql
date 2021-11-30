CREATE TABLE Uzlet
(
  Nev TINYTEXT NOT NULL,
  Uzlet_ID INT NOT NULL,
  Weboldal TINYTEXT NOT NULL,
  Telefonszam CHAR(12) NOT NULL,
  Nyitvatartas TINYTEXT NOT NULL,
  Iranyitoszam INT NOT NULL,
  Varos TINYTEXT NOT NULL,
  Utca TINYTEXT NOT NULL,
  Hazszam TINYTEXT NOT NULL,
  PRIMARY KEY (Uzlet_ID)
);

CREATE TABLE Nagyker
(
  Nagyker_ID INT NOT NULL,
  Iranyitoszam INT NOT NULL,
  Utca TINYTEXT NOT NULL,
  Hazszam TINYTEXT NOT NULL,
  Varos TINYTEXT NOT NULL,
  Nev TINYTEXT NOT NULL,
  Telefonszam CHAR(12) NOT NULL,
  Email TINYTEXT NOT NULL,
  PRIMARY KEY (Nagyker_ID)
);

CREATE TABLE Termek
(
  Termek_ID INT NOT NULL,
  Mennyiseg INT NOT NULL,
  Ar INT NOT NULL,
  Uzlet_ID INT NOT NULL,
  PRIMARY KEY (Termek_ID),
  FOREIGN KEY (Uzlet_ID) REFERENCES Uzlet(Uzlet_ID)
);

CREATE TABLE Vevo
(
  Vevo_ID INT NOT NULL,
  Uzlet_ID INT NOT NULL,
  PRIMARY KEY (Vevo_ID),
  FOREIGN KEY (Uzlet_ID) REFERENCES Uzlet(Uzlet_ID)
);

CREATE TABLE Pontgyujto_kartya
(
  Pontgyujto_ID INT NOT NULL, 
  Nev TINYTEXT NOT NULL,
  Varos TINYTEXT NOT NULL,
  Utca TINYTEXT NOT NULL,
  Hazszam TINYTEXT NOT NULL,
  Iranyitoszam INT NOT NULL,
  Email TINYTEXT NOT NULL,
  Telefonszam CHAR(12) NOT NULL,
  Vevo_ID INT NOT NULL,
  PRIMARY KEY (Pontgyujto_ID),
  FOREIGN KEY (Vevo_ID) REFERENCES Vevo(Vevo_ID)
);


CREATE TABLE Szallitas
(
  Datum DATE NOT NULL,
  Nagyker_ID INT NOT NULL,
  Termek_ID INT NOT NULL,
  FOREIGN KEY (Nagyker_ID) REFERENCES Nagyker(Nagyker_ID),
  FOREIGN KEY (Termek_ID) REFERENCES Termek(Termek_ID)
);

CREATE TABLE Dolgozo
(
  Nev TINYTEXT NOT NULL,
  Dolgozo_ID INT NOT NULL,
  Iranyitoszam INT NOT NULL,
  Telepules TINYTEXT NOT NULL,
  Utca TINYTEXT NOT NULL,
  Hazszam TINYTEXT NOT NULL,
  Adoszam CHAR(13) NOT NULL,
  Bankszamlaszam CHAR(26) NOT NULL,
  TB_szam CHAR(11) NOT NULL,
  Uzlet_ID INT NOT NULL,
  PRIMARY KEY (Dolgozo_ID),
  FOREIGN KEY (Uzlet_ID) REFERENCES Uzlet(Uzlet_ID)
);

CREATE TABLE Vesz_Eseten_ertesitendo
(
  Vesz_ID INT NOT NULL,
  Nev TINYTEXT NOT NULL,
  Telefonszam CHAR(12) NOT NULL,
  Dolgozo_ID INT NOT NULL,
  PRIMARY KEY (Vesz_ID),
  FOREIGN KEY (Dolgozo_ID) REFERENCES Dolgozo(Dolgozo_ID)
);

CREATE TABLE Dolgozo_Telefonszam
(
  Telefonszam CHAR(12) NOT NULL,
  Dolgozo_ID INT NOT NULL,
  PRIMARY KEY (Telefonszam, Dolgozo_ID),
  FOREIGN KEY (Dolgozo_ID) REFERENCES Dolgozo(Dolgozo_ID)
);

