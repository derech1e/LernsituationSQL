USE `Ferienhaus`;
 
/* SQLINES DEMO *** le [dbo].[Adresse]    Script Date: 01.12.2015 11:50:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Adresse(
	`Address_ID` int AUTO_INCREMENT NOT NULL,
	`PLZ` nvarchar(5) NULL DEFAULT (NULL),
	`Stadt` nvarchar(50) NULL DEFAULT (NULL),
	`Bundesland` nvarchar(50) NULL DEFAULT (NULL),
	`Strasse` nvarchar(75) NULL DEFAULT (NULL),
	`Hausnummer` nvarchar(5) NULL DEFAULT (NULL),
	`Zusatz` nvarchar(50) NULL DEFAULT (NULL),
	`Herkunftsland_ID` int NULL DEFAULT (NULL),
 CONSTRAINT `PK_Adresse` PRIMARY KEY 
(
	`Address_ID` ASC
) 
);

/* SQLINES DEMO *** le [dbo].[Eigentuemer]    Script Date: 01.12.2015 11:50:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Eigentuemer(
	`Eigentuemer_ID` int AUTO_INCREMENT NOT NULL,
	`Address_ID` int NULL DEFAULT (NULL),
	`Name` nvarchar(50) NULL,
 CONSTRAINT `PK_Eigentuemer` PRIMARY KEY 
(
	`Eigentuemer_ID` ASC
) 
);

/* SQLINES DEMO *** le [dbo].[Ferienhaus]    Script Date: 01.12.2015 11:50:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Ferienhaus(
	`Ferienhaus_ID` int AUTO_INCREMENT NOT NULL,
	`Eigentuemer_ID` int NULL DEFAULT (NULL),
	`Address_ID` int NULL DEFAULT (NULL),
	`Anzahl_Schlafzimmer` int NULL DEFAULT ((1)),
	`Name` nvarchar(50) NULL,
	`Einstell_dat` date NULL,
 CONSTRAINT `PK_Ferienhaus` PRIMARY KEY 
(
	`Ferienhaus_ID` ASC
) 
);

/* SQLINES DEMO *** le [dbo].[geschlossen]    Script Date: 01.12.2015 11:50:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE geschlossen(
	`Ferienhaus_ID` int NOT NULL,
	`Beginn` date NOT NULL,
	`Ende` date NULL CONSTRAINT [DF_geschlossen_Ende]  DEFAULT (NULL),
	`Bemerkung` nchar(100) NULL,
 CONSTRAINT `PK_geschlossen` PRIMARY KEY 
(
	`Ferienhaus_ID` ASC,
	`Beginn` ASC
) 
);

/* SQLINES DEMO *** le [dbo].[Herkunftsland]    Script Date: 01.12.2015 11:50:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Herkunftsland(
	`Herkunftsland_ID` int AUTO_INCREMENT NOT NULL,
	`Name` nchar(50) NOT NULL,
	`Abkuerzung` nchar(5) NULL,
	`Besonderheiten` nchar(100) NULL,
 CONSTRAINT `PK_Herkunftsland` PRIMARY KEY 
(
	`Herkunftsland_ID` ASC
) 
);

/* SQLINES DEMO *** le [dbo].[Kunde]    Script Date: 01.12.2015 11:50:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Kunde(
	`Kunde_ID` int AUTO_INCREMENT NOT NULL,
	`Address_ID` int NULL DEFAULT (NULL),
	`Name` nvarchar(50) NULL,
 CONSTRAINT `PK_Kunde` PRIMARY KEY 
(
	`Kunde_ID` ASC
) 
);

/* SQLINES DEMO *** le [dbo].[Maengelanzeige]    Script Date: 01.12.2015 11:50:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Maengelanzeige(
	`Maengelanzeige_ID` int AUTO_INCREMENT NOT NULL,
	`Ferienhaus_ID` int NULL DEFAULT (NULL),
	`Meldedatum` date NULL DEFAULT (NULL),
	`Beschreibung` nvarchar(250) NULL DEFAULT (NULL),
 CONSTRAINT `PK_Maengelanzeige` PRIMARY KEY 
(
	`Maengelanzeige_ID` ASC
) 
);

/* SQLINES DEMO *** le [dbo].[Mietvertrag]    Script Date: 01.12.2015 11:50:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Mietvertrag(
	`Mietvertrag_ID` int AUTO_INCREMENT NOT NULL,
	`Ferienhaus_ID` int NULL DEFAULT (NULL),
	`Kunde_ID` int NULL DEFAULT (NULL),
	`Beginn` date NULL DEFAULT (NULL),
	`Ende` date NULL DEFAULT (NULL),
 CONSTRAINT `PK_Mietvertrag` PRIMARY KEY 
(
	`Mietvertrag_ID` ASC
) 
);

SET IDENTITY_INSERT `dbo`.`Adresse` ON 

INSERT [dbo].[Adresse] (`Address_ID`, `PLZ`, `Stadt`, `Bundesland`, `Strasse`, `Hausnummer`, `Zusatz`, `Herkunftsland_ID`) SELECT (1, N'22435', N'Hamburg', N'HH', N'Kolbenstrasse', N'4', NULL, NULL)
INSERT Adresse (`Address_ID`, `PLZ`, `Stadt`, `Bundesland`, `Strasse`, `Hausnummer`, `Zusatz`, `Herkunftsland_ID`) VALUES (2, N'80313', N'Muenchen', N'Bayern', N'Birnengasse', N'68', NULL, NULL)
INSERT Adresse (`Address_ID`, `PLZ`, `Stadt`, `Bundesland`, `Strasse`, `Hausnummer`, `Zusatz`, `Herkunftsland_ID`) VALUES (3, N'01157', N'Dresden', N'Sachsen', N'Am kleinen Teich', N'7', NULL, NULL)
INSERT Adresse (`Address_ID`, `PLZ`, `Stadt`, `Bundesland`, `Strasse`, `Hausnummer`, `Zusatz`, `Herkunftsland_ID`) VALUES (4, N'04109', N'Leipzig', N'Sachsen', N'Lessingstrasse', N'27', NULL, NULL)
INSERT Adresse (`Address_ID`, `PLZ`, `Stadt`, `Bundesland`, `Strasse`, `Hausnummer`, `Zusatz`, `Herkunftsland_ID`) VALUES (5, N'50933', N'Koeln', N'NRW', N'Blumenweg', N'37', NULL, NULL)
INSERT Adresse (`Address_ID`, `PLZ`, `Stadt`, `Bundesland`, `Strasse`, `Hausnummer`, `Zusatz`, `Herkunftsland_ID`) VALUES (6, N'12750', N'Berlin', N'Berlin', N'Spatzenbreite', N'13', NULL, NULL)
INSERT Adresse (`Address_ID`, `PLZ`, `Stadt`, `Bundesland`, `Strasse`, `Hausnummer`, `Zusatz`, `Herkunftsland_ID`) VALUES (7, N'04249', N'Leipzig', N'Sachsen', N'Haufferring', N'1', NULL, NULL)
INSERT Adresse (`Address_ID`, `PLZ`, `Stadt`, `Bundesland`, `Strasse`, `Hausnummer`, `Zusatz`, `Herkunftsland_ID`) VALUES (8, N'20144', N'Hamburg', N'HH', N'Am Hafen', N'23', NULL, NULL)
INSERT Adresse (`Address_ID`, `PLZ`, `Stadt`, `Bundesland`, `Strasse`, `Hausnummer`, `Zusatz`, `Herkunftsland_ID`) VALUES (9, N'45130', N'Essen', N'NRW', N'Kruppstrasse', N'1', NULL, NULL)
INSERT Adresse (`Address_ID`, `PLZ`, `Stadt`, `Bundesland`, `Strasse`, `Hausnummer`, `Zusatz`, `Herkunftsland_ID`) VALUES (10, N'10115', N'Berlin', N'Berlin', N'Kudamm', N'76', NULL, NULL)
INSERT Adresse (`Address_ID`, `PLZ`, `Stadt`, `Bundesland`, `Strasse`, `Hausnummer`, `Zusatz`, `Herkunftsland_ID`) VALUES (11, N'93055', N'Regensburg', N'Bayern', N'Schulstrasse', N'45', NULL, NULL)
INSERT Adresse (`Address_ID`, `PLZ`, `Stadt`, `Bundesland`, `Strasse`, `Hausnummer`, `Zusatz`, `Herkunftsland_ID`) VALUES (12, N'50999', N'Koeln', N'NRW', N'Am Hochrhein', N'2', NULL, NULL)
INSERT Adresse (`Address_ID`, `PLZ`, `Stadt`, `Bundesland`, `Strasse`, `Hausnummer`, `Zusatz`, `Herkunftsland_ID`) VALUES (13, N'44787', N'Bochum', N'NRW', N'Hochofen Allee', N'12', NULL, NULL)
INSERT Adresse (`Address_ID`, `PLZ`, `Stadt`, `Bundesland`, `Strasse`, `Hausnummer`, `Zusatz`, `Herkunftsland_ID`) VALUES (14, N'09125', N'Chemnitz', N'Sachsen', N'Hauptweg', N'21', NULL, NULL)
INSERT Adresse (`Address_ID`, `PLZ`, `Stadt`, `Bundesland`, `Strasse`, `Hausnummer`, `Zusatz`, `Herkunftsland_ID`) VALUES (15, N'06110', N'Halle', N'Sachsen', N'Am Spielplatz', N'17', NULL, NULL)
SET IDENTITY_INSERT `dbo`.`Adresse` OFF
SET IDENTITY_INSERT `dbo`.`Eigentuemer` ON 

INSERT [dbo].[Eigentuemer] (`Eigentuemer_ID`, `Address_ID`, `Name`) SELECT (1, 5, N'Pullmann Hotels')
INSERT Eigentuemer (`Eigentuemer_ID`, `Address_ID`, `Name`) VALUES (2, 1, N'Paul Liebknecht')
INSERT Eigentuemer (`Eigentuemer_ID`, `Address_ID`, `Name`) VALUES (3, 2, N'Alfredo Kruppi')
INSERT Eigentuemer (`Eigentuemer_ID`, `Address_ID`, `Name`) VALUES (4, 8, N'Torsten Köhler')
INSERT Eigentuemer (`Eigentuemer_ID`, `Address_ID`, `Name`) VALUES (5, 9, N'Ferienoase Group')
INSERT Eigentuemer (`Eigentuemer_ID`, `Address_ID`, `Name`) VALUES (6, 4, N'Bella Hotel AG')
INSERT Eigentuemer (`Eigentuemer_ID`, `Address_ID`, `Name`) VALUES (7, 3, N'Angela Schenk')
INSERT Eigentuemer (`Eigentuemer_ID`, `Address_ID`, `Name`) VALUES (8, 7, N'Roswhita Kleinschmidt')
INSERT Eigentuemer (`Eigentuemer_ID`, `Address_ID`, `Name`) VALUES (9, 6, N'Marlene Schulz')
INSERT Eigentuemer (`Eigentuemer_ID`, `Address_ID`, `Name`) VALUES (10, 10, N'Richard Meister')
SET IDENTITY_INSERT `dbo`.`Eigentuemer` OFF
SET IDENTITY_INSERT `dbo`.`Ferienhaus` ON 

INSERT [dbo].[Ferienhaus] (`Ferienhaus_ID`, `Eigentuemer_ID`, `Address_ID`, `Anzahl_Schlafzimmer`, `Name`, `Einstell_dat`) SELECT (1, 4, 7, 3, N'Pension Ambient', CAST(N'2006-11-01' AS Date))
INSERT Ferienhaus (`Ferienhaus_ID`, `Eigentuemer_ID`, `Address_ID`, `Anzahl_Schlafzimmer`, `Name`, `Einstell_dat`) VALUES (2, 1, 3, 3, N'Filou Theater', CAST(N'2007-07-01' AS Date))
INSERT Ferienhaus (`Ferienhaus_ID`, `Eigentuemer_ID`, `Address_ID`, `Anzahl_Schlafzimmer`, `Name`, `Einstell_dat`) VALUES (3, 5, 6, 2, N'Villa Seeufer', CAST(N'2007-02-01' AS Date))
INSERT Ferienhaus (`Ferienhaus_ID`, `Eigentuemer_ID`, `Address_ID`, `Anzahl_Schlafzimmer`, `Name`, `Einstell_dat`) VALUES (4, 8, 4, 4, N'Villa Hügel', CAST(N'2008-04-01' AS Date))
INSERT Ferienhaus (`Ferienhaus_ID`, `Eigentuemer_ID`, `Address_ID`, `Anzahl_Schlafzimmer`, `Name`, `Einstell_dat`) VALUES (5, 10, 9, 5, N'Wellness Ort', CAST(N'2008-01-01' AS Date))
INSERT Ferienhaus (`Ferienhaus_ID`, `Eigentuemer_ID`, `Address_ID`, `Anzahl_Schlafzimmer`, `Name`, `Einstell_dat`) VALUES (6, 9, 1, 3, N'Villa Sonnenschein', CAST(N'2009-12-01' AS Date))
INSERT Ferienhaus (`Ferienhaus_ID`, `Eigentuemer_ID`, `Address_ID`, `Anzahl_Schlafzimmer`, `Name`, `Einstell_dat`) VALUES (7, 3, 5, 1, N'Hotel Bergblick', CAST(N'2009-07-01' AS Date))
INSERT Ferienhaus (`Ferienhaus_ID`, `Eigentuemer_ID`, `Address_ID`, `Anzahl_Schlafzimmer`, `Name`, `Einstell_dat`) VALUES (8, 2, 10, 2, N'Hotel Münchausen', CAST(N'2007-01-01' AS Date))
INSERT Ferienhaus (`Ferienhaus_ID`, `Eigentuemer_ID`, `Address_ID`, `Anzahl_Schlafzimmer`, `Name`, `Einstell_dat`) VALUES (9, 7, 8, 3, N'Pension Waldesruh', CAST(N'2006-10-01' AS Date))
INSERT Ferienhaus (`Ferienhaus_ID`, `Eigentuemer_ID`, `Address_ID`, `Anzahl_Schlafzimmer`, `Name`, `Einstell_dat`) VALUES (10, 6, 2, 3, N'Pension 3 Brüder', CAST(N'2005-09-01' AS Date))
INSERT Ferienhaus (`Ferienhaus_ID`, `Eigentuemer_ID`, `Address_ID`, `Anzahl_Schlafzimmer`, `Name`, `Einstell_dat`) VALUES (11, 1, 4, 4, N'Villa Waldesruh', CAST(N'2012-12-01' AS Date))
SET IDENTITY_INSERT `dbo`.`Ferienhaus` OFF
INSERT geschlossen (`Ferienhaus_ID`, `Beginn`, `Ende`, `Bemerkung`) VALUES (1, CAST(N'2010-01-01' AS Date), CAST(N'2012-06-30' AS Date), N'komplette Rekonstruktion                                                                            ')
INSERT geschlossen (`Ferienhaus_ID`, `Beginn`, `Ende`, `Bemerkung`) VALUES (2, CAST(N'2013-05-27' AS Date), NULL, N'Hochwasserschaden - Gebäudestatik betroffen                                                         ')
INSERT geschlossen (`Ferienhaus_ID`, `Beginn`, `Ende`, `Bemerkung`) VALUES (5, CAST(N'2008-11-02' AS Date), CAST(N'2011-12-31' AS Date), N'Geschäftsaufgabe und Nachfolgersuche                                                                ')
SET IDENTITY_INSERT `dbo`.`Herkunftsland` ON 

INSERT [dbo].[Herkunftsland] (`Herkunftsland_ID`, `Name`, `Abkuerzung`, `Besonderheiten`) SELECT (1, N'Deutschland                                       ', N'D    ', NULL)
SET IDENTITY_INSERT `dbo`.`Herkunftsland` OFF
SET IDENTITY_INSERT `dbo`.`Kunde` ON 

INSERT [dbo].[Kunde] (`Kunde_ID`, `Address_ID`, `Name`) SELECT (1, 11, N'Ehepaar Weigelt')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (2, 10, N'Familie Schorlemmer')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (3, 8, N'Familie Ulzenseg')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (4, 9, N'Angela Bitterfeld')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (5, 12, N'Ehepaar Zander')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (6, 1, N'Ehepaar Merlin')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (7, 4, N'Konrad Tasd')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (8, 3, N'Familie Baskard')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (9, 4, N'Familie Blauholz')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (10, 14, N'Hein Blöd')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (11, 7, N'Ehepaar Scheidhardt')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (12, 5, N'Ehepaar Ahlert')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (13, 2, N'Familie Eimer')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (14, 1, N'Karl Wegener')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (15, 13, N'Familie Haarig')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (16, 5, N'Heiz Sauer')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (17, 6, N'Familie Kotz')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (18, 15, N'Ehepaar Wulf')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (19, 2, N'Siglinde Falz')
INSERT Kunde (`Kunde_ID`, `Address_ID`, `Name`) VALUES (20, 3, N'Fritz Fatz')
SET IDENTITY_INSERT `dbo`.`Kunde` OFF
SET IDENTITY_INSERT `dbo`.`Maengelanzeige` ON 

INSERT [dbo].[Maengelanzeige] (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) SELECT (1, 1, CAST(N'2013-01-24' AS Date), N'Fensterglasschaden')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (2, 1, CAST(N'2013-01-09' AS Date), N'Ausstattung entspricht nicht dem Vertrag')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (3, 1, CAST(N'2012-12-23' AS Date), N'verschmutzte Dusche')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (4, 8, CAST(N'2013-01-01' AS Date), N'Kakerlaken in Küche')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (5, 6, CAST(N'2012-12-31' AS Date), N'Schrank zusammengebrochen')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (6, 10, CAST(N'2013-01-29' AS Date), N'nächtlicher Lärm')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (7, 7, CAST(N'2012-12-28' AS Date), N'unangekündigte Bauarbeiten in Nachbarschaft')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (8, 10, CAST(N'2013-01-18' AS Date), N'Einbruch bei Abwesenheit')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (9, 1, CAST(N'2013-02-15' AS Date), N'Betten verwanzt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (10, 9, CAST(N'2013-01-05' AS Date), N'Wasserrohrbruch')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (11, 5, CAST(N'2012-12-28' AS Date), N'Kaffeemaschine defekt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (12, 3, CAST(N'2013-02-15' AS Date), N'Kaffeemaschine defekt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (13, 8, CAST(N'2012-12-30' AS Date), N'Kühlschrank leckt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (14, 2, CAST(N'2013-01-12' AS Date), N'Schimmelgeruch im Schlafzimmer')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (15, 7, CAST(N'2013-02-04' AS Date), N'Schrank zusammengebrochen')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (16, 9, CAST(N'2013-02-15' AS Date), N'Einbruch bei Abwesenheit')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (17, 5, CAST(N'2013-01-23' AS Date), N'undichtes Dach')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (18, 9, CAST(N'2013-02-18' AS Date), N'Ausstattung entspricht nicht dem Vertrag')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (19, 4, CAST(N'2013-01-26' AS Date), N'Eingangstür klemmt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (20, 7, CAST(N'2013-02-04' AS Date), N'Heizung defekt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (21, 3, CAST(N'2012-12-22' AS Date), N'unangekündigte Bauarbeiten in Nachbarschaft')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (22, 8, CAST(N'2012-12-21' AS Date), N'Ausstattung entspricht nicht dem Vertrag')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (23, 9, CAST(N'2013-01-14' AS Date), N'Kühlschrank leckt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (24, 5, CAST(N'2013-01-09' AS Date), N'unangekündigte Bauarbeiten in Nachbarschaft')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (25, 6, CAST(N'2012-12-27' AS Date), N'Eingangstür klemmt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (26, 9, CAST(N'2012-12-24' AS Date), N'Eingangstür klemmt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (27, 5, CAST(N'2013-01-05' AS Date), N'unangekündigte Bauarbeiten in Nachbarschaft')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (28, 4, CAST(N'2013-01-08' AS Date), N'nächtlicher Lärm')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (29, 7, CAST(N'2013-01-10' AS Date), N'unangekündigte Bauarbeiten in Nachbarschaft')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (30, 8, CAST(N'2013-01-10' AS Date), N'Eingangstür klemmt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (31, 8, CAST(N'2013-01-24' AS Date), N'Kakerlaken in Küche')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (32, 3, CAST(N'2013-01-14' AS Date), N'Rotweinflecken auf Teppich')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (33, 4, CAST(N'2013-01-12' AS Date), N'Kakerlaken in Küche')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (34, 9, CAST(N'2013-02-13' AS Date), N'Kakerlaken in Küche')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (35, 5, CAST(N'2013-02-10' AS Date), N'Wasserrohrbruch')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (36, 2, CAST(N'2012-12-29' AS Date), N'Betten verwanzt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (37, 3, CAST(N'2013-02-12' AS Date), N'Kakerlaken in Küche')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (38, 9, CAST(N'2013-01-10' AS Date), N'Fensterglasschaden')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (39, 7, CAST(N'2013-01-09' AS Date), N'Einbruch bei Abwesenheit')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (40, 6, CAST(N'2013-02-02' AS Date), N'Betten verwanzt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (41, 1, CAST(N'2013-01-13' AS Date), N'Warmwasser nicht vorhanden')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (42, 9, CAST(N'2013-01-21' AS Date), N'Fernsehempfang eingeschränkt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (43, 2, CAST(N'2013-01-09' AS Date), N'Wasserrohrbruch')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (44, 5, CAST(N'2013-01-16' AS Date), N'Zugluft im Wohnbereich')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (45, 1, CAST(N'2013-02-05' AS Date), N'Fensterglasschaden')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (46, 9, CAST(N'2013-02-14' AS Date), N'Fernsehempfang eingeschränkt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (47, 6, CAST(N'2013-01-22' AS Date), N'Wasserrohrbruch')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (48, 3, CAST(N'2013-01-04' AS Date), N'undichtes Dach')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (49, 3, CAST(N'2013-01-30' AS Date), N'Rotweinflecken auf Teppich')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (50, 2, CAST(N'2012-12-28' AS Date), N'Schimmelgeruch im Schlafzimmer')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (51, 4, CAST(N'2012-12-21' AS Date), N'Kühlschrank leckt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (52, 10, CAST(N'2013-01-30' AS Date), N'Stromschlaggefahr im Korridor')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (53, 2, CAST(N'2013-01-30' AS Date), N'Heizung defekt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (54, 7, CAST(N'2013-01-26' AS Date), N'nächtlicher Lärm')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (55, 2, CAST(N'2012-12-23' AS Date), N'Schimmelgeruch im Schlafzimmer')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (56, 8, CAST(N'2012-12-27' AS Date), N'Ausstattung entspricht nicht dem Vertrag')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (57, 1, CAST(N'2013-01-09' AS Date), N'Warmwasser nicht vorhanden')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (58, 9, CAST(N'2013-02-14' AS Date), N'Rotweinflecken auf Teppich')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (59, 6, CAST(N'2013-02-05' AS Date), N'Rotweinflecken auf Teppich')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (60, 6, CAST(N'2013-01-08' AS Date), N'undichtes Dach')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (61, 2, CAST(N'2013-02-16' AS Date), N'Fernsehempfang eingeschränkt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (62, 4, CAST(N'2012-12-31' AS Date), N'verschmutzte Dusche')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (63, 3, CAST(N'2013-02-06' AS Date), N'Stromschlaggefahr im Korridor')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (64, 6, CAST(N'2013-01-08' AS Date), N'Wasserrohrbruch')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (65, 9, CAST(N'2013-01-08' AS Date), N'Fernsehempfang eingeschränkt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (66, 10, CAST(N'2013-02-02' AS Date), N'Warmwasser nicht vorhanden')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (67, 8, CAST(N'2013-01-05' AS Date), N'Zugluft im Wohnbereich')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (68, 7, CAST(N'2013-01-20' AS Date), N'verschmutzte Dusche')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (69, 5, CAST(N'2013-02-16' AS Date), N'Kaffeemaschine defekt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (70, 3, CAST(N'2013-01-12' AS Date), N'Schrank zusammengebrochen')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (71, 6, CAST(N'2012-12-28' AS Date), N'Warmwasser nicht vorhanden')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (72, 8, CAST(N'2013-01-07' AS Date), N'verschmutzte Dusche')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (73, 7, CAST(N'2013-01-25' AS Date), N'Fensterglasschaden')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (74, 4, CAST(N'2013-01-30' AS Date), N'Einbruch bei Abwesenheit')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (75, 8, CAST(N'2012-12-21' AS Date), N'Betten verwanzt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (76, 9, CAST(N'2013-02-04' AS Date), N'Kaffeemaschine defekt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (77, 2, CAST(N'2012-12-25' AS Date), N'Kühlschrank leckt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (78, 3, CAST(N'2013-01-29' AS Date), N'Kaffeemaschine defekt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (79, 5, CAST(N'2013-02-12' AS Date), N'nächtlicher Lärm')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (80, 6, CAST(N'2013-02-07' AS Date), N'Heizung defekt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (81, 4, CAST(N'2013-01-10' AS Date), N'Warmwasser nicht vorhanden')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (82, 5, CAST(N'2013-02-12' AS Date), N'Kühlschrank leckt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (83, 7, CAST(N'2013-02-02' AS Date), N'Stromschlaggefahr im Korridor')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (84, 6, CAST(N'2013-01-27' AS Date), N'Heizung defekt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (85, 10, CAST(N'2012-12-23' AS Date), N'Fernsehempfang eingeschränkt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (86, 9, CAST(N'2013-02-05' AS Date), N'Rotweinflecken auf Teppich')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (87, 8, CAST(N'2013-01-29' AS Date), N'Zugluft im Wohnbereich')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (88, 3, CAST(N'2013-01-14' AS Date), N'Zugluft im Wohnbereich')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (89, 9, CAST(N'2012-12-27' AS Date), N'Heizung defekt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (90, 1, CAST(N'2013-01-03' AS Date), N'Schimmelgeruch im Schlafzimmer')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (91, 8, CAST(N'2013-01-12' AS Date), N'Zugluft im Wohnbereich')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (92, 3, CAST(N'2013-01-14' AS Date), N'Schrank zusammengebrochen')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (93, 2, CAST(N'2012-12-23' AS Date), N'Einbruch bei Abwesenheit')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (94, 6, CAST(N'2013-01-23' AS Date), N'Stromschlaggefahr im Korridor')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (95, 3, CAST(N'2013-02-12' AS Date), N'nächtlicher Lärm')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (96, 10, CAST(N'2013-01-07' AS Date), N'Eingangstür klemmt')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (97, 7, CAST(N'2012-12-22' AS Date), N'Schimmelgeruch im Schlafzimmer')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (98, 4, CAST(N'2013-02-10' AS Date), N'verschmutzte Dusche')
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (99, 3, CAST(N'2013-01-18' AS Date), N'undichtes Dach');
 
INSERT Maengelanzeige (`Maengelanzeige_ID`, `Ferienhaus_ID`, `Meldedatum`, `Beschreibung`) VALUES (100, 6, CAST(N'2013-02-09' AS Date), N'Fensterglasschaden')
SET IDENTITY_INSERT `dbo`.`Maengelanzeige` OFF
SET IDENTITY_INSERT `dbo`.`Mietvertrag` ON 

INSERT [dbo].[Mietvertrag] (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) SELECT (1, 2, 4, CAST(N'2007-08-29' AS Date), CAST(N'2007-09-19' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (2, 8, 2, CAST(N'2007-01-20' AS Date), CAST(N'2007-02-14' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (3, 7, 16, CAST(N'2010-07-12' AS Date), CAST(N'2010-08-02' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (4, 1, 11, CAST(N'2009-08-01' AS Date), CAST(N'2009-10-01' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (5, 8, 12, CAST(N'2008-03-19' AS Date), CAST(N'2008-03-26' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (6, 6, 12, CAST(N'2010-03-03' AS Date), CAST(N'2010-03-27' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (7, 9, 20, CAST(N'2007-06-13' AS Date), CAST(N'2007-06-29' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (8, 4, 2, CAST(N'2008-12-15' AS Date), CAST(N'2009-02-11' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (9, 5, 7, CAST(N'2008-02-22' AS Date), CAST(N'2008-03-05' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (10, 6, 3, CAST(N'2012-06-26' AS Date), CAST(N'2012-07-02' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (11, 8, 18, CAST(N'2010-12-18' AS Date), CAST(N'2011-01-25' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (12, 3, 9, CAST(N'2007-05-05' AS Date), CAST(N'2007-05-15' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (13, 9, 5, CAST(N'2011-10-11' AS Date), CAST(N'2011-10-28' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (14, 3, 13, CAST(N'2010-07-27' AS Date), CAST(N'2010-08-02' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (15, 5, 4, CAST(N'2012-09-03' AS Date), CAST(N'2012-09-28' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (16, 8, 17, CAST(N'2007-05-31' AS Date), CAST(N'2007-07-01' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (17, 1, 19, CAST(N'2007-02-12' AS Date), CAST(N'2007-02-21' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (18, 4, 1, CAST(N'2008-04-11' AS Date), CAST(N'2008-04-14' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (19, 10, 9, CAST(N'2005-12-22' AS Date), CAST(N'2006-01-04' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (20, 3, 16, CAST(N'2012-12-28' AS Date), CAST(N'2013-01-07' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (21, 8, 16, CAST(N'2012-12-24' AS Date), CAST(N'2013-01-24' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (22, 6, 5, CAST(N'2013-01-18' AS Date), CAST(N'2013-01-24' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (23, 5, 4, CAST(N'2012-12-21' AS Date), CAST(N'2012-12-30' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (24, 5, 8, CAST(N'2013-01-15' AS Date), CAST(N'2013-02-10' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (25, 4, 12, CAST(N'2013-01-08' AS Date), CAST(N'2013-02-16' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (26, 3, 10, CAST(N'2012-12-26' AS Date), CAST(N'2013-01-15' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (27, 5, 19, CAST(N'2012-12-21' AS Date), CAST(N'2013-01-13' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (28, 3, 17, CAST(N'2013-01-05' AS Date), CAST(N'2013-01-28' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (29, 5, 3, CAST(N'2013-01-07' AS Date), CAST(N'2013-01-13' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (30, 6, 9, CAST(N'2012-12-30' AS Date), CAST(N'2013-01-02' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (31, 4, 16, CAST(N'2013-01-04' AS Date), CAST(N'2013-01-18' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (32, 7, 7, CAST(N'2013-01-05' AS Date), CAST(N'2013-02-07' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (33, 4, 15, CAST(N'2012-12-27' AS Date), CAST(N'2013-01-28' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (34, 7, 17, CAST(N'2013-01-10' AS Date), CAST(N'2013-01-14' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (35, 8, 3, CAST(N'2012-12-21' AS Date), CAST(N'2013-01-26' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (36, 3, 1, CAST(N'2013-01-10' AS Date), CAST(N'2013-02-17' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (37, 5, 14, CAST(N'2012-12-22' AS Date), CAST(N'2013-01-05' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (38, 6, 15, CAST(N'2013-01-05' AS Date), CAST(N'2013-01-25' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (39, 2, 15, CAST(N'2012-12-30' AS Date), CAST(N'2013-01-08' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (40, 4, 6, CAST(N'2013-01-14' AS Date), CAST(N'2013-02-06' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (41, 1, 6, CAST(N'2012-12-21' AS Date), CAST(N'2013-02-01' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (42, 2, 6, CAST(N'2012-12-21' AS Date), CAST(N'2013-01-08' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (43, 3, 18, CAST(N'2013-01-11' AS Date), CAST(N'2013-01-28' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (44, 8, 8, CAST(N'2013-01-15' AS Date), CAST(N'2013-02-02' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (45, 9, 5, CAST(N'2013-01-15' AS Date), CAST(N'2013-02-07' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (46, 4, 10, CAST(N'2013-01-10' AS Date), CAST(N'2013-02-14' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (47, 7, 2, CAST(N'2013-01-09' AS Date), CAST(N'2013-01-15' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (48, 3, 8, CAST(N'2013-01-10' AS Date), CAST(N'2013-02-02' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (49, 2, 10, CAST(N'2012-12-21' AS Date), CAST(N'2012-12-24' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (50, 3, 19, CAST(N'2012-12-23' AS Date), CAST(N'2013-01-25' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (51, 6, 3, CAST(N'2013-01-05' AS Date), CAST(N'2013-01-23' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (52, 8, 2, CAST(N'2012-12-29' AS Date), CAST(N'2013-02-09' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (53, 7, 5, CAST(N'2013-01-04' AS Date), CAST(N'2013-02-11' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (54, 9, 9, CAST(N'2013-01-06' AS Date), CAST(N'2013-01-31' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (55, 1, 4, CAST(N'2012-12-21' AS Date), CAST(N'2013-02-03' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (56, 7, 9, CAST(N'2013-01-18' AS Date), CAST(N'2013-02-26' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (57, 2, 14, CAST(N'2012-12-30' AS Date), CAST(N'2013-01-13' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (58, 3, 15, CAST(N'2013-01-12' AS Date), CAST(N'2013-02-11' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (59, 10, 8, CAST(N'2013-01-10' AS Date), CAST(N'2013-01-26' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (60, 6, 11, CAST(N'2012-12-27' AS Date), CAST(N'2013-01-08' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (61, 8, 14, CAST(N'2013-01-01' AS Date), CAST(N'2013-01-14' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (62, 2, 7, CAST(N'2012-12-22' AS Date), CAST(N'2013-02-04' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (63, 4, 13, CAST(N'2013-01-06' AS Date), CAST(N'2013-02-07' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (64, 9, 20, CAST(N'2013-01-03' AS Date), CAST(N'2013-01-09' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (65, 8, 8, CAST(N'2012-12-28' AS Date), CAST(N'2013-01-28' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (66, 9, 18, CAST(N'2013-01-03' AS Date), CAST(N'2013-02-16' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (67, 5, 12, CAST(N'2013-01-10' AS Date), CAST(N'2013-02-13' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (68, 3, 1, CAST(N'2013-01-04' AS Date), CAST(N'2013-02-15' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (69, 7, 1, CAST(N'2013-01-06' AS Date), CAST(N'2013-01-09' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (70, 3, 20, CAST(N'2013-01-17' AS Date), CAST(N'2013-02-18' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (71, 4, 6, CAST(N'2012-12-27' AS Date), CAST(N'2013-01-03' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (72, 7, 14, CAST(N'2012-12-27' AS Date), CAST(N'2013-02-07' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (73, 2, 11, CAST(N'2013-01-07' AS Date), CAST(N'2013-01-13' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (74, 7, 13, CAST(N'2013-01-14' AS Date), CAST(N'2013-02-19' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (75, 10, 11, CAST(N'2013-01-02' AS Date), CAST(N'2013-01-20' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (76, 9, 2, CAST(N'2012-12-29' AS Date), CAST(N'2013-01-06' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (77, 1, 12, CAST(N'2013-01-01' AS Date), CAST(N'2013-01-28' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (78, 7, 13, CAST(N'2013-01-10' AS Date), CAST(N'2013-02-22' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (79, 10, 15, CAST(N'2013-01-12' AS Date), CAST(N'2013-01-30' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (80, 5, 5, CAST(N'2013-01-08' AS Date), CAST(N'2013-02-11' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (81, 7, 3, CAST(N'2013-01-12' AS Date), CAST(N'2013-01-21' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (82, 5, 18, CAST(N'2013-01-04' AS Date), CAST(N'2013-01-10' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (83, 2, 10, CAST(N'2012-12-30' AS Date), CAST(N'2013-01-21' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (84, 4, 14, CAST(N'2013-01-11' AS Date), CAST(N'2013-01-27' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (85, 9, 19, CAST(N'2012-12-24' AS Date), CAST(N'2013-01-01' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (86, 1, 17, CAST(N'2012-12-22' AS Date), CAST(N'2012-12-29' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (87, 7, 4, CAST(N'2012-12-31' AS Date), CAST(N'2013-02-11' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (88, 8, 1, CAST(N'2013-01-13' AS Date), CAST(N'2013-02-22' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (89, 7, 7, CAST(N'2012-12-22' AS Date), CAST(N'2012-12-31' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (90, 8, 10, CAST(N'2013-01-10' AS Date), CAST(N'2013-01-26' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (91, 7, 20, CAST(N'2013-01-06' AS Date), CAST(N'2013-01-21' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (92, 8, 7, CAST(N'2013-01-08' AS Date), CAST(N'2013-02-08' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (93, 10, 11, CAST(N'2013-01-14' AS Date), CAST(N'2013-01-31' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (94, 4, 17, CAST(N'2013-01-08' AS Date), CAST(N'2013-02-20' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (95, 5, 20, CAST(N'2012-12-28' AS Date), CAST(N'2013-01-12' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (96, 1, 18, CAST(N'2013-01-01' AS Date), CAST(N'2013-01-25' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (97, 4, 19, CAST(N'2013-01-10' AS Date), CAST(N'2013-01-26' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (98, 2, 16, CAST(N'2013-01-18' AS Date), CAST(N'2013-02-04' AS Date))
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (99, 3, 6, CAST(N'2012-12-27' AS Date), CAST(N'2013-02-07' AS Date));
 
INSERT Mietvertrag (`Mietvertrag_ID`, `Ferienhaus_ID`, `Kunde_ID`, `Beginn`, `Ende`) VALUES (100, 5, 13, CAST(N'2012-12-26' AS Date), CAST(N'2013-01-07' AS Date))
SET IDENTITY_INSERT `dbo`.`Mietvertrag` OFF
ALTER TABLE `dbo`.`Adresse`  ADD  CONSTRAINT `FK_Adresse_Herkunftsland` FOREIGN KEY(`Herkunftsland_ID`)
REFERENCES Herkunftsland (`Herkunftsland_ID`)
ON DELETE SET NULL;
 
ALTER TABLE `dbo`.`Adresse` CHECK CONSTRAINT [FK_Adresse_Herkunftsland];
 
ALTER TABLE `dbo`.`Eigentuemer`  ADD  CONSTRAINT `FK_Adresse_Eigentuemer` FOREIGN KEY(`Address_ID`)
REFERENCES Adresse (`Address_ID`);
 
ALTER TABLE `dbo`.`Eigentuemer` CHECK CONSTRAINT [FK_Adresse_Eigentuemer];
 
ALTER TABLE `dbo`.`Ferienhaus`  ADD  CONSTRAINT `FK_Adresse_Ferienhaus` FOREIGN KEY(`Address_ID`)
REFERENCES Adresse (`Address_ID`);
 
ALTER TABLE `dbo`.`Ferienhaus` CHECK CONSTRAINT [FK_Adresse_Ferienhaus];
 
ALTER TABLE `dbo`.`Ferienhaus`  ADD  CONSTRAINT `FK_Eigentuemer_Ferienhaus` FOREIGN KEY(`Eigentuemer_ID`)
REFERENCES Eigentuemer (`Eigentuemer_ID`)
ON UPDATE SET DEFAULT
ON DELETE SET DEFAULT;
 
ALTER TABLE `dbo`.`Ferienhaus` CHECK CONSTRAINT [FK_Eigentuemer_Ferienhaus];
 
ALTER TABLE `dbo`.`geschlossen`  ADD  CONSTRAINT `FK_geschlossen_Ferienhaus` FOREIGN KEY(`Ferienhaus_ID`)
REFERENCES Ferienhaus (`Ferienhaus_ID`);
 
ALTER TABLE `dbo`.`geschlossen` CHECK CONSTRAINT [FK_geschlossen_Ferienhaus];
 
ALTER TABLE `dbo`.`Kunde`  ADD  CONSTRAINT `FK_Adresse_Kunde` FOREIGN KEY(`Address_ID`)
REFERENCES Adresse (`Address_ID`);
 
ALTER TABLE `dbo`.`Kunde` CHECK CONSTRAINT [FK_Adresse_Kunde];
 
ALTER TABLE `dbo`.`Maengelanzeige`  ADD  CONSTRAINT `FK_Maengelanzeige_Ferienhaus` FOREIGN KEY(`Ferienhaus_ID`)
REFERENCES Ferienhaus (`Ferienhaus_ID`);
 
ALTER TABLE `dbo`.`Maengelanzeige` CHECK CONSTRAINT [FK_Maengelanzeige_Ferienhaus];
 
ALTER TABLE `dbo`.`Mietvertrag`  ADD  CONSTRAINT `FK_Mietvertrag_Ferienhaus` FOREIGN KEY(`Ferienhaus_ID`)
REFERENCES Ferienhaus (`Ferienhaus_ID`);
 
ALTER TABLE `dbo`.`Mietvertrag` CHECK CONSTRAINT [FK_Mietvertrag_Ferienhaus];
 
ALTER TABLE `dbo`.`Mietvertrag`  ADD  CONSTRAINT `FK_Mietvertrag_Kunde` FOREIGN KEY(`Kunde_ID`)
REFERENCES Kunde (`Kunde_ID`);
 
ALTER TABLE `dbo`.`Mietvertrag` CHECK CONSTRAINT [FK_Mietvertrag_Kunde];
 
