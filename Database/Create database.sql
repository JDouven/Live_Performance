--Drop existing tables with same names.
DROP TABLE Containertruckingbedrijf CASCADE CONSTRAINTS;
DROP TABLE Container CASCADE CONSTRAINTS;
DROP TABLE Schip CASCADE CONSTRAINTS;
DROP TABLE Bestemming CASCADE CONSTRAINTS;

--Create table Containertruckingbedrijf
CREATE TABLE Containertruckingbedrijf(
	Naam varchar2(50) PRIMARY KEY,
	ContactpersoonNaam varchar2(50) NOT NULL,
	KvKNummer number(10) NOT NULL UNIQUE,
	IsDochterVan varchar2(50)
);

--Create table Container
CREATE TABLE Container(
	ID number(10) PRIMARY KEY,
	NaamBedrijf varchar2(50) NOT NULL,
	Bestemming varchar2(50) NOT NULL,
	Type varchar2(1) NOT NULL CHECK(Type='C' OR Type='V' OR Type='E'),
	Ingeplanned varchar2(1) DEFAULT 'n' CHECK(Ingeplanned='y' OR Ingeplanned='n') ,
	GPS varchar2(50),
	CONSTRAINT fk_Container FOREIGN KEY (NaamBedrijf)
		REFERENCES Containertruckingbedrijf(Naam)
);

--Create table Schip
CREATE TABLE Schip(
	Type varchar2(20) PRIMARY KEY,
	Hoogte number(4) NOT NULL,
	Rijen number(4) NOT NULL,
	ContainersPerRij number(4) NOT NULL,
	StroomAansluitingen number(4)
);

--Create table Bestemming
CREATE TABLE Bestemming(
	Naam varchar2(50) PRIMARY KEY,
	Land varchar2(50) NOT NULL
);

--Een aantal voorbeeldbedrijven invoeren.
INSERT INTO Containertruckingbedrijf VALUES ('Container Transport International', 'Bill Tuckerman', 123456789, null);
INSERT INTO Containertruckingbedrijf VALUES ('Flame In The Pipe', 'John Wheeler', 987654321, null);
INSERT INTO Containertruckingbedrijf VALUES ('ITC', 'Simon Trailer', 567891234, null);
INSERT INTO Containertruckingbedrijf VALUES ('Moar Containers', 'Kim Ondaroad', 214365879, 'Flame In The Pipe');

--30 containers van verscheidene types invoeren
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(1, 'Container Transport International', 'Port of Antwerp', 'C');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(2, 'Container Transport International', 'Port of Antwerp', 'C');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(3, 'Container Transport International', 'Port of Antwerp', 'C');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(4, 'Container Transport International', 'Port of Antwerp', 'C');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(5, 'Container Transport International', 'Port of Antwerp', 'C');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(6, 'Container Transport International', 'Port of Antwerp', 'C');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(7, 'Container Transport International', 'Port of Antwerp', 'C');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(8, 'Container Transport International', 'Port of Antwerp', 'C');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(9, 'Flame In The Pipe', 'Port of Antwerp', 'V');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(10, 'Flame In The Pipe', 'Port of Antwerp', 'V');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(11, 'Flame In The Pipe', 'Port of Antwerp', 'V');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(12, 'Flame In The Pipe', 'Port of Antwerp', 'V');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(13, 'Flame In The Pipe', 'Port of Antwerp', 'V');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(14, 'Flame In The Pipe', 'Port of Antwerp', 'V');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(15, 'ITC', 'Port of Antwerp', 'C');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(16, 'ITC', 'Port of Antwerp', 'C');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(17, 'ITC', 'Port of Antwerp', 'C');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(18, 'ITC', 'Port of Antwerp', 'C');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(19, 'ITC', 'Port of Antwerp', 'C');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(20, 'ITC', 'Port of Antwerp', 'C');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(21, 'ITC', 'Port of Antwerp', 'C');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(22, 'ITC', 'Port of Antwerp', 'C');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(23, 'Moar Containers', 'Port of Antwerp', 'E');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(24, 'Moar Containers', 'Port of Antwerp', 'E');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(25, 'Moar Containers', 'Port of Antwerp', 'E');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(26, 'Moar Containers', 'Port of Antwerp', 'E');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(27, 'Moar Containers', 'Port of Antwerp', 'E');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(28, 'Moar Containers', 'Port of Antwerp', 'E');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(29, 'Moar Containers', 'Port of Antwerp', 'E');
INSERT INTO Container(ID, NaamBedrijf, Bestemming, Type) VALUES(30, 'Moar Containers', 'Port of Antwerp', 'E');

--Schepen invoeren
INSERT INTO Schip VALUES('MPP-XSF1', 3, 3, 5, 9);
INSERT INTO Schip VALUES('MPP-SF1', 4, 7, 10, 21);
INSERT INTO Schip VALUES('MPP-F3', 5, 9, 12, 27);
INSERT INTO Schip VALUES('FM-A-MC', 6, 9, 15, 27);

--Bestemmingen invoeren
INSERT INTO Bestemming VALUES('Port of Antwerp', 'Belgie');
INSERT INTO Bestemming VALUES('Rotterdam', 'Nederland');
INSERT INTO Bestemming VALUES('Bergen', 'Noorwegen');
INSERT INTO Bestemming VALUES('Toronto', 'Canada');
INSERT INTO Bestemming VALUES('Montreal', 'Canada');
INSERT INTO Bestemming VALUES('Horta', 'Portugal');