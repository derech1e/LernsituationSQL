USE sql_training;


CREATE OR REPLACE TABLE abteilungen(
	id int NOT NULL,
	name varchar(20) NULL,
PRIMARY KEY 
(
	id ASC
)
)
;

CREATE OR REPLACE TABLE kunde(
	ID int AUTO_INCREMENT NOT NULL,
	Name varchar(50) NULL,
	Vorname varchar(30) NULL,
	Mitarbeiter_ID int NULL,
 CONSTRAINT PK_Kunde PRIMARY KEY 
(
	ID ASC
)
)
;


CREATE OR REPLACE TABLE mitarbeiter(
id int NOT NULL,
name varchar(20) NULL,
vorname varchar(20) NULL,
gebdatum date NULL,
gehalt decimal(10,2) NULL,
bonus decimal(10,2) NULL,
chef_id int NULL,
abteilungen_id int NULL,
PRIMARY KEY 
(
	id ASC
)
)
;
INSERT abteilungen (id, name) VALUES (1, 'Leitung');
INSERT abteilungen (id, name) VALUES (2, 'Vertrieb');
INSERT abteilungen (id, name) VALUES (3, 'Produktion');
INSERT abteilungen (id, name) VALUES (4, 'Konstruktion');
INSERT abteilungen (id, name) VALUES (5, 'IT');


INSERT kunde (ID, Name, Vorname, Mitarbeiter_ID) VALUES (10000, N'Meier', N'Friedbert', 102);
INSERT kunde (ID, Name, Vorname, Mitarbeiter_ID) VALUES (10001, N'Meier', N'Olga', 105);
INSERT kunde (ID, Name, Vorname, Mitarbeiter_ID) VALUES (10002, N'Schultz', N'Peter', 108);
INSERT kunde (ID, Name, Vorname, Mitarbeiter_ID) VALUES (10003, N'Schulz', N'Marion', 110);
INSERT kunde (ID, Name, Vorname, Mitarbeiter_ID) VALUES (10004, N'Wagner', N'Tom', 102);
INSERT kunde (ID, Name, Vorname, Mitarbeiter_ID) VALUES (10005, N'Wegener', N'Marianne', 107);
INSERT kunde (ID, Name, Vorname, Mitarbeiter_ID) VALUES (10006, N'Helmholz', N'Knut', 120);
INSERT kunde (ID, Name, Vorname, Mitarbeiter_ID) VALUES (10007, N';ldbach', N'Dirk', 114);
INSERT kunde (ID, Name, Vorname, Mitarbeiter_ID) VALUES (10008, N'Wagner', N'Helge', 116);
INSERT kunde (ID, Name, Vorname, Mitarbeiter_ID) VALUES (10009, N'Schneider', N'Helge', 110);
INSERT kunde (ID, Name, Vorname, Mitarbeiter_ID) VALUES (10010, N'Schuster', N'Bert', 117);
INSERT kunde (ID, Name, Vorname, Mitarbeiter_ID) VALUES (10011, N'Schulz', N'Maik', 111);


INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (101, N'King', N'Adam', CAST(N'1965-06-01' AS Date), CAST(6689.00 AS Decimal(10, 2)), CAST(1700.00 AS Decimal(10, 2)), NULL, 1);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (102, N'Berger', N'Bernd', CAST(N'1980-05-14' AS Date), CAST(5123.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), 101, 2);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (103, N'Chinski', N'Cris', CAST(N'1970-05-13' AS Date), CAST(2533.00 AS Decimal(10, 2)), CAST(860.00 AS Decimal(10, 2)), 101, 3);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (104, N'Tiger', N'Scott', CAST(N'1965-03-06' AS Date), CAST(1896.00 AS Decimal(10, 2)), NULL, 101, 4);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (105, N'Wolf ', N'Wolfgang', CAST(N'1950-05-05' AS Date), CAST(2100.00 AS Decimal(10, 2)), NULL, 102, 2);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (106, N'Heron', N'Kurt', CAST(N'1966-06-06' AS Date), CAST(3210.00 AS Decimal(10, 2)), NULL, 103, 3);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (107, N'Baumann', N'Klaus', CAST(N'1950-05-05' AS Date), CAST(4150.00 AS Decimal(10, 2)), NULL, 103, 3);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (108, N'Meister', N'Wolfram', CAST(N'1959-08-28' AS Date), CAST(4460.00 AS Decimal(10, 2)), NULL, 106, 3);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (109, N'Meier', N'Gudrun', CAST(N'1960-05-05' AS Date), CAST(4150.00 AS Decimal(10, 2)), NULL, 104, 4);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (110, N'Burger', N'Klaus', CAST(N'1959-08-28' AS Date), CAST(4460.00 AS Decimal(10, 2)), NULL, 103, 3);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (111, N'Weber ', N'Werner', CAST(N'1950-05-05' AS Date), CAST(2100.00 AS Decimal(10, 2)), NULL, 105, 2);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (112, N'Schmidt', N'Jens', CAST(N'1966-06-06' AS Date), CAST(3210.00 AS Decimal(10, 2)), NULL, 103, 3);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (113, N'Schwarzer', N'Peter', CAST(N'1950-05-03' AS Date), CAST(4150.00 AS Decimal(10, 2)), NULL, 108, 3);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (114, N'Meister', N' Susi', CAST(N'1964-09-28' AS Date), CAST(4460.00 AS Decimal(10, 2)), NULL, 108, 3);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (115, N'Feger', N'Klaus', CAST(N'1960-03-05' AS Date), CAST(4150.00 AS Decimal(10, 2)), NULL, 108, 3);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (116, N'Schmidt', N'Gudrun', CAST(N'1969-04-09' AS Date), CAST(4460.00 AS Decimal(10, 2)), NULL, 103, 3);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (117, N'Ober ', N'Gabi', CAST(N'1970-10-05' AS Date), CAST(2100.00 AS Decimal(10, 2)), NULL, 101, 1);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (118, N'Hellmann', N'Kurt', CAST(N'1966-12-31' AS Date), CAST(3210.00 AS Decimal(10, 2)), NULL, 117, 1);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (119, N'Bauer', N'Klaus', CAST(N'1959-01-05' AS Date), CAST(4150.00 AS Decimal(10, 2)), NULL, 102, 2);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (120, N'Just', N'Wolfram', CAST(N'1959-11-13' AS Date), CAST(4460.00 AS Decimal(10, 2)), NULL, 103, 3);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (121, N'Jahn', N'Klaus', CAST(N'1960-06-16' AS Date), CAST(4150.00 AS Decimal(10, 2)), NULL, 111, 2);
INSERT mitarbeiter (id, name, vorname, gebdatum, gehalt, bonus, chef_id, abteilungen_id) VALUES (122, N'Keiler', N'Brigitte', CAST(N'1978-04-18' AS Date), CAST(4460.00 AS Decimal(10, 2)), NULL, 109, 4);

ALTER TABLE kunde ADD CONSTRAINT FK_MA_Kunde FOREIGN KEY(Mitarbeiter_ID) REFERENCES mitarbeiter (id) ON UPDATE CASCADE;
ALTER TABLE mitarbeiter ADD CONSTRAINT FK_ABT_MA FOREIGN KEY(abteilungen_id) REFERENCES abteilungen (id) ON UPDATE CASCADE;

