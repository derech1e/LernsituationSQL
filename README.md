
# Dokumentation Lernsituation SQL 
Diese Dokumentation erklärt die Grundlegenden Sprachbestanteile von SQL. Im Zusammenhang mit einem Ferienhaus-Auftrag werden diese anschaulich dargestellt und verdeutlicht.

# Inhaltsverzeichnis
- [Auftragsanalyse](#Auftragsanalyse)
- [Arbeitsplanung](#Arbeitsplanung)
	- [Thomas](#Thomas)
	- [Anton](#Anton)
	- [Louis](#Louis)
- [SOLL-IST Auswertung](#SOLL-IST-Auswertung)
- [Hinweise zum Verständnis](#Hinweise-zum-Verständnis)
- [SQL Bestandteile](#SQL-Bestandteile)
	- [DDL](#DDL)
	- [DML](#DML)
	- [DQL](#DQL)
	- [DCL](#DCL)
- [Quellen](#Quellen)
- [TODO](#TODO)

# Hinweise zum Verständnis
In den folgenden Punkten, werden zunächst die verschiedene Sprachbestandteile von SQL erklärt. Die Allgemeine Syntax des Befehls orientiert sich immer am Standard von SQL. Darüber hinaus sind die [Anwendungsbeispiele](#User-Storys)  für die im [MS-Server Mangament Studio](https://docs.microsoft.com/de-de/sql/ssms/sql-server-management-studio-ssms?view=sql-server-ver15) enthaltene [T-SQL](https://de.wikipedia.org/wiki/Transact-SQL) Sprache angepasst.

# Auftragsanalyse

# Arbeitsplanung
## Louis
- Schutzbedarfsanalyse
## Anton
- DML
- DCL
## Thomas
- DDL
- DQL
- Auftragsanalyse

# SOLL-IST Auswertung

# SQL Bestandteile
Die User-Stories umfassen Erklärungen und Anwendungsfälle der Standart-Query-Language im Bezug auf den Auftrag "Ferienhaus".

## DDL
Die **D**ata **D**efinition **L**anguage (dt. Datendefinitionssprache) dient zum beschreiben von Datenstrukturen und Elementen. Die Sprache beschreibt die Struktur und den Aufbau einer Datenbank.

**Befehlsübersicht**
- [Create](#Create)
- [Alter](#Alter)
- [Drop](#Drop)

### Create
Das `CREATE` Statement wird in SQL benutzt um eine neue Datenbank oder Tabelle zu erstellen.
Für die Erzeugung einer Tabelle gilt ein standardisierter Syntax. Datenbank abhängig kann es eigene Erweiterungen geben.

**Syntax des Statements**
```sql
CREATE TABLE <name> [<column>(,...) <constraint>(,...)];
```

**User-Storys**

Im folgendem Beispiel wird eine Tabelle erstellt, die alle Adressen von Kunden, Eigentümern und den Ferienhäusern enthält. Über die Address_ID kann die jeweilige Adresse mithilfe eines [Join's](#Join) ermittelt werden.
```sql 
CREATE TABLE Adresse (
	Address_ID int IDENTITY(1,1) NOT NULL,
	PLZ nvarchar(5) NULL DEFAULT (NULL),
	Stadt nvarchar(50) NULL DEFAULT (NULL),
	Bundesland nvarchar(50) NULL DEFAULT (NULL),
	Strasse nvarchar(75) NULL DEFAULT (NULL),
	Hausnummer nvarchar(5) NULL DEFAULT (NULL),
	Zusatz nvarchar(50) NULL DEFAULT (NULL),
	Herkunftsland_ID int NULL DEFAULT (NULL));
```

Im Beispiel sollen alle Kunden aus Dresden in der Tabelle `Dresdener` erfasst werden. Dies gelingt mithilfe eines [Join's](#Join).
```sql
CREATE TABLE Dresdener AS [EDGE] SELECT Adresse.Address_ID, Name FROM Kunde INNER JOIN Adresse ON Adresse.Address_ID = Kunde.Address_ID WHERE Adresse.Stadt LIKE 'Dresden';
-- [EDGE] wird nur in T-SQL benötigt.
```
#### Alter
Das `ALTER` Statement wird in SQL benutzt um Spalten und [Constrains](https://glossar.hs-augsburg.de/SQL_Integrit%C3%A4tsregeln) zu modifizieren. Constrains sind Integritätsregeln die Fehler und Unschlüssigkeiten bei der Erstellung von Tabellen ausschließen sollen. Durch richtig festgelegte Regeln werden fehlerhafte Datensätze gar nicht erst von der Datenbank angenommen. 

**Syntax der Statements**

*Löschen einer Spalte*
```sql
ALTER TABLE <table> DROP [COLUMN] <columnname> {RESTRICT | CASCADE}
```
*Hinzufügen einer Spalte*
```sql
ALTER TABLE <table> ADD [COLUMN] <columnname> <datatype> [(NOT)NULL] [DEFAULT <value>] [PRIMARY KEY] [REFERENCES <table> (<column>)]
```

*Ändern einer Spalte*
```sql
-- Setzen des Default-Werts
ALTER TABLE <table> ALTER [COLUMN] <columnname> SET DEFAULT  <defaultvalue>

-- Löschen des Default-Werts
ALTER TABLE <table> ALTER [COLUMN] <columnname> DROP DEFAULT

-- Hinzufügen einer Referenz auf einen Datentypen
ALTER TABLE <table> ALTER [COLUMN] <columnname> ADD SCOPE <table> 

-- Löschen einer Referenz
ALTER TABLE <table> ALTER [COLUMN] <columnname> DROP SCOPE {RESTRICT | CASCADE}
```

**User-Storys**
```sql
-- Fügt die Spalte `Email` zur Tabelle Kunde hinzu.
ALTER TABLE Kunde ADD Email nvarchar(255);
```
```sql
-- Änderung der maximalen Zeichenanzahl auf 100
ALTER TABLE Kunde MODIFY COLUMN Email nvarchar(100);
```
```sql
-- Löschen der Spalte `Email`
ALTER TABLE Kunde DROP COLUMN Email;
```
```sql
-- Aktivierung der Einschränkung `FK_Adresse_Herkunftsland`
ALTER TABLE Adresse CHECK CONSTRAINT FK_Adresse_Herkunftsland;
```
```sql
-- Löschen der Einschränkung `FK_Adresse_Herkunftsland`
ALTER TABLE Person DROP CONSTRAINT FK_Adresse_Herkunftsland;
```

### Drop
Das `DROP` Statement wird in SQL benutzt um Datenbanken und Tabellen zu Löschen. 

**Syntax des Statements**
```sql
DROP { TABLE | DATABASE } <name>;
```

**User-Storys**
```sql
-- Löschen der Tabelle `Adresse` 
DROP TABLE Adresse;
```
```sql
-- Löschen der Datenbank `Ferienhaus`
DROP DATABASE Ferienhaus;
```
## DML
Die **D**ata **M**odifying **L**anguage *(dt. Datenmanipulationssprache)* dient zum erstellen, bearbeiten, löschen und auslesen von Daten.

**Befehlsübersicht**
- [Insert](#Insert)
- [Update](#Update)
- [Delete](#Delete)

### Insert
Durch das  `INSERT` Statement werden im Allgemeinen neue Daten hinzufügen.

Das Beiwort `INTO` bei dem Befehl `INSERT INTO` ist rein optional und unternimmt keinerlei Änderungen an der Verarbeitung des Befehls. Beide Varianten sind sozusagen identisch.

**Syntax**
```sql
INSERT INTO <name> (<columnname>[,...]) VALUES (<value>[,...]);
```

**User-Storys**
Ein Mitarbeiter möchte einen neuen Mietvertrag in die Tabelle "Mietvertrag" über ein UI hinzufügen. Dieser Mietvertrag wird von einem Kunden (Ehepaar Zander) angefordert. Der Kunde hatte vorher noch keinen Mietvertrag aufgesetzt und ist somit ein neuer Kunde und muss somit in das System eingepflegt werden.

```sql
-- Kunde anlegen: Ehepaar Zander
INSERT INTO Kunde (Kunde_ID, Address_ID, Name)
VALUES (5, 12, 'Ehepaar Zander');

--Mietvertrag anlegen
INSERT INTO Mietvertrag (Mietvertrag_ID, Ferienhaus_ID, Kunde_ID, Beginn, Ende) VALUES (1, 2, 5, CONVERT('2007-08-29' AS Date), CONVERT('2007-09-19' AS Date));
```

### Update
Mit dem `UPDATE` Statement ist es möglich Datensätze zu bearbeiten und aktualisieren.

**Syntax**
```sql
UPDATE <name> SET <columnname> = <value>[,...] WHERE <condition>; 
```

**User-Storys**
Ein Mitarbeiter hat einen Fehler gemacht, als er dem Ehepaar Zander den Mietvertrag aufgesetzte. Er hat vor Unterschrift des Vertrages jenen Vertrag schon in die Datenbank eingepflegt, somit muss er den Mietvertrag erneuert aufsetzten und den neuen Vertrag dem Ehepaar Zander zusenden. Der Mitarbeiter hat das falsche Haus für die Buchung ausgewählt.

```sql
UPDATE Mietvertrag SET Ferienhaus_ID = 1 WHERE Kunde_ID = 5 AND Beginn = CONVERT('2007-08-29' AS Date) AND Ferienhaus_ID = 2;
```
Das System muss die Änderung spezifisch auf das Ferienhaus auslegen, wo der Fehler unterlaufen ist, deswegen muss man mehrere Faktoren in die Conditions einfließen lassen. Da das Ehepaar Zander auch mehrere Ferienhäuser gebucht haben kann, muss man auch den Beginn mit hinzuzählen.

## DQL
In einer Datenbank werden verschiedene Abfragen und Operationen über mehre Tabellen hinweg ausgeführt. Als Ergebnis wird immer eine Tabelle zurückgegeben.

**D**ata **Q**uery **L**anguage, bedueted übersetzt so viel wie Datenbankabfragesprache. Diese ist ein Bestandteil von SQL und dient zum konkreten Abfragen von Datensätzen aus Tabellen.

**Befehlsübersicht**
- [Projektion](#Projektion)
- [Selektion ](#Selektion)
- [Join](#Join)
- [Group By](#Group-By)

### Selektion & Projektion
#### Projektion

> Projektion = Auswahl von speziellen Spalten

Die Projektion wird in SQL mit dem `SELECT`-Statement realisiert. Das Statement kann verschiedene Eigenschaften enthalten. Diese repräsentieren die Spaltennamen der entsprechenden Tabelle. Werden keine Eigenschaften im Statement angegeben, wird dies automatisch durch einen `*` in SQL ersetzt. 

**Syntax des Statements**
```sql
SELECT ... FROM ...;
```
```sql
SELECT [{ ALL | * } | DISTINCT] FROM <name> [AS columnname];
```

**User-Storys**
```sql
-- Anzeigen aller Mietverträge
SELECT * FROM Mietvertrag;
```
```sql
-- Anzeigen von Spalten aus Tabellen über einen Alias
SELECT adr.Address_ID, adr.Stadt, k.Name FROM Kunde k, Adresse adr;
```

#### Selektion

> Auswahl von Zeilen nach Bedingungen

Die Selektion wird in SQL mit der sogenannten `WHERE`-Bedingungen hinter dem eigentlichem `SELECT` Statement realisiert. Die `WHERE` -Bedingung kann mehrere Prädikate enthalten. Zurückgegeben wird  eine Tabelle mit einer bestimmten Ergebnismenge, die diese(s) Prädikate erfüllen.

**Syntax des Statements**
```sql
SELECT ... FROM ... [WHERE ...][GROUP BY ... HAVING...][ORDER BY ...];
```

**User-Storys**
```sql
-- Anzeigen aller Herkunftsländer deren Name mit D beginnt und endet, sowie deren Kürzel ein e an zweiter Position nachweisen kann
SELECT Name, Abkuerzung FROM Herkunftsland WHERE Name LIKE "D%d" AND WHERE Nachname LIKE "_e%";
```

```sql
-- Anzeigen der Durchschnittlichen Anzahl an Schlafzimmer von Ferienhäusern, die später als dem 01.04.2008 eingestellt wurden
SELECT Name, AVG(Anzahl_Schlafzimmer) AS DurchschnitsSchlafzimmer FROM Ferienhaus WHERE Einstell_dat >= CAST('2008-04-01' AS Date);  
```

```sql
-- Fügt alle Ferienhäuser in die Tabelle GuteFerienhaeuser ein, die mehr als 3 Schlafzimmer haben. Die Tabelle GuteFerienhaeuser muss manuell erstellt werden.
SELECT Name INTO GuteFerienhaeuser FROM Ferienhaus WHERE Anzahl_Schlafzimmer > 3;
```

```sql
-- Anzeigen aller Kunden die in Dresden wohen und den Buchstaben k in ihrem Namen haben
SELECT Adresse.Address_ID, Name FROM Kunde INNER JOIN Adresse ON Adresse.Address_ID = Kunde.Address_ID WHERE Adresse.Stadt LIKE 'Dresden' AND WHERE Kunde.Name LIKE '%k%';
```

### Join
#### Inner Join
Gibt Datensätze zurück, die in beiden Tabellen mindestens ein übereinstimmenden Wert haben.

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/inner-schema.png" width="500" height="300" />

```sql
SELECT Person.PersonID, Mitarbeiter.Name, Person.Nachname FROM Person INNER JOIN Mitarbeiter
ON Mitarbeiter.Name = Person.Nachname;
```
### Left [Outer] Join
Gibt alle Datensätze aus der "linken" Tabelle zurück, sowie übereinstimmende Datensätze aus der "rechten" Tabelle.

**Wichtig: Die Datensätze werden aus der linken Tabelle immer zurückgegeben, auch wenn es keine Übereinstimmung mit den Datensätzen aus der rechten Tabelle gibt.**

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/left-outer-schema.png" width="500" height="300" />


```sql
SELECT Person.PersonID, Mitarbeiter.Name, Person.Nachname FROM Person LEFT JOIN Mitarbeiter
ON Mitarbeiter.Name = Person.Nachname ORDER BY Mitarbeiter.Name;
```
### Right [Outer] Join
Gibt alle Datensätze aus der "rechten" Tabelle zurück, sowie übereinstimmende Datensätze aus der "linken " Tabelle.

**Wichtig: Die Datensätze werden aus der rechten Tabelle immer zurückgegeben, auch wenn es keine Übereinstimmung mit Datensätzen aus der linken Tabelle gibt.**

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/right-outer-schema.png" width="500" height="300" />


```sql 
SELECT Person.PersonID, Mitarbeiter.Name, Person.Nachname FROM Person RIGHT JOIN Mitarbeiter
ON Mitarbeiter.Name = Person.Nachname;
```

### Full [Outer] Join
Gibt immer Datensätze zurück, unabhängig davon ob es eine Übereinstimmung in der anderen Tabelle gibt oder nicht. Es können keine Datensätze verschwinden.

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/all-joins.png" width="500" height="300" />


```sql 
SELECT Person.PersonID, Mitarbeiter.Name, Person.Nachname FROM Person FULL JOIN Mitarbeiter
ON Mitarbeiter.Name = Person.Nachname;
```

**Weitere Join-Varianten die für MS SQL Server gelten sind [hier](https://github.com/derech1e/LernsituationSQL/blob/vortrag_joins/README.md) zu finden.**

### Group By
Durch das `GROUP BY` ist es einem möglich, mehrere Datensätze anhand von gleichen Werten zu gruppieren. 

**Syntax des Statements**
```sql
SELECT ... FROM ... [WHERE ...] GROUP BY <columnname> [ORDER BY ...]
```

**User-Storys**
```sql
-- Gruppiert alle Schlafzimmer von Ferienhäuser die nicht am 01.04.2008 eigestellt wurden und Sortiert der Anzahl nach aufsteigend 
SELECT COUNT(Anzahl_Schlafzimmer), Name FROM Ferienhaus WHERE Einstell_dat != CAST('2008-04-01' AS Date) GROUP BY Name ORDER BY Anzahl_Schlafzimmer ASC;
```

```sql 
-- Gruppiert alle Schlafzimmer von Ferienhäuser die nicht am 01.04.2008 eigestellt wurden, dem Eigenümer mit der ID 2 gehöhren und Sortiert diese der Schlafzimmeranzahl nach aufsteigend 
SELECT COUNT(fer.Anzahl_Schlafzimmer), fer.Name, eig.Name FROM Ferienhaus fer RIGHT JOIN Eigentuemer eig ON eig.Eigentuemer_ID = 2 WHERE Einstell_dat != CAST('2008-04-01' AS Date) GROUP BY Name ORDER BY Anzahl_Schlafzimmer ASC;
```

### DCL
Mit den DCLs (**D**ata **C**ontrol **L**anguage(s)) *(dt. Datenkontrollsprache)* kann man Berechtigungen verteilen und entziehen.

- [GRANT](#GRANT)
- [REVOKE](#REVOKE)

#### GRANT
`GRANT` *(dt. gewähren )* gewährt Datenbankbenutzern bestimmte Rechte auf eine Tabelle. 

**Syntax**
```sql
GRANT <privilegename> 
ON <objectname>
TO <username>
[WITH GRANT OPTION];
```

**Userstory(s)**
*Userstory 1*
In dieser Userstory bekommt ein neuer Mitarbeiter definierte Rechte auf die Tabellen *"Ferienhaus"* und *"Mietvertrag"*, damit dieser das System benutzen kann. 
Er kann sich somit mit einer SQL Session verbinden und in dieser über ein UI arbeiten. 

Der Befehl `ALTER` gibt in diesem Beispiel de  Benutzer die Rechte, dass er auf der Datenbank unendlich viele Daten speichern kann.  [Siehe mehr](#Alter)

Er erhält aus Sicherheitsgründen keine [DELETE](#DELETE) und [UPDATE](#UPDATE) Rechte. 
Diese werden dann von IT-Mitarbeitern übernommen. 
```sql
GRANT CREATE SESSION TO <username_mitarbeiter>;
GRANT SELECT ON Ferienhaus TO <username_mitarbeiter>;
GRANT INSERT ON Ferienhaus TO <username_mitarbeiter>;
GRANT SELECT ON Mietvertrag TO <username_mitarbeiter>;
GRANT INSERT ON Mietvertrag TO <username_mitarbeiter>;
GRANT SELECT ON Maengelanzeige TO <username_mitarbeiter>;
GRANT INSERT ON Maengelanzeige TO <username_mitarbeiter>;
ALTER USER <username_mitarbeiter> QUOTA UNLIMITED ON SYSTEM;
```
*Userstory 2*
Mit dem folgendem SQL Statement kann man die Rechte auf die Befehle `SELECT`, `UPDATE`, `INSERT`, `DELETE` und `REFERENCES` alle auf einmal für einen Benutzer auf eine Tabelle, in dem Fall *"Ferienhaus"*, "*Mietvertrag"* und *"Maengelanzeige",* übergeben. Somit spart man sich Zeit und Arbeit. 

```sql
GRANT CREATE SESSION TO <username_mitarbeiter_chef>;
GRANT ALL ON Ferienhaus TO <username_mitarbeiter_chef>;
GRANT ALL ON Mietvertrag TO <username_mitarbeiter_chef>;
GRANT ALL ON Maengelanzeige TO <username_mitarbeiter_chef>;
```
*Userstory 3*
Ein neuer IT-Mitarbeiter wird eingestellt, welcher einzelne Tabellen erstellen und löschen muss. Dazu erhält dieser auch alle Rechte auf die *"Ferienhaus"* Tabelle, damit dieser bestimmte Datensätze auch ändern kann.

```sql
GRANT CREATE ANY TABLE TO <username_it_mitarbeiter>; 
GRANT DROP ANY TABLE TO <username_it_mitarbeiter>;
GRANT ALL ON Ferienhaus TO <username_it_mitarbeiter>;
```

#### REVOKE
Der Befehl `Revoke` *(dt. widerrufen)* widerruft eine Berechtigung von einem Benutzer / Rolle. 

**Syntax des Statements**
```sql
REVOKE <privilegename> ON <objectname> FROM <username>
```
**Users-Storys**
Ein Mitarbeiter verlässt die Firma. Somit müssen auch seine Zugriffsrechte, aus Datensicherheitsgründen, weggenommen werden.

```sql
REVOKE CREATE SESSION FROM <username_mitarbeiter>;
```
*Ein weiteres Beispiel:*
Ein IT Mitarbeiter verlässt die IT-Firma. Somit müssen auch seine Rechte weggenommen werden.

```sql
REVOKE CREATE ANY TABLE FROM <username_it_mitarbeiter>; 
REVOKE DROP ANY TABLE FROM <username_it_mitarbeiter>;
```

Die Befehle `SELECT`, `UPDATE`, `INSERT`, `DELETE` und `REFERENCES` ([DML](#DML) / [DQL](#DQL)) des Mitarbeiter Chefs werden alle auf einmal entfernt, sowie die Zugriffsrechte auf die Datenbank
```sql
REVOKE CREATE SESSION FROM <username_mitarbeiter_chef>;
REVOKE ALL ON Ferienhaus FROM <username_mitarbeiter_chef>;
REVOKE ALL ON Mietvertrag FROM <username_mitarbeiter_chef>;
```

# Quellen
- https://www.devart.com/dbforge/sql/sqlcomplete/sql-join-statements.html
- https://stackedit.io
