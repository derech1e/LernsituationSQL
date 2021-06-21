
# Dokumentation Lernsituation SQL 

Diese Dokumentation erklärt die Grundlegenden Sprachbestanteile von SQL. Im Zusammenhang mit einem Ferienhaus-Auftrag werden diese anschaulich dargestellt und verdeutlicht.

# Inhaltsverzeichnis
- [Auftragsanalyse](#Auftragsanalyse)
- [Arbeitsplanung](#Arbeitsplanung)
	- [Thomas](#Thomas)
	- [Anton](#Anton)
	- [Louis](#Louis)
- [SOLL-IST Auswertung](#SOLL-IST)
- [USER-STORIES](#USER-STORIES)
	- [DDL](#DDL)
	- [DML](#DML)
	- [DQL](#DQL)
	- [DCL](#DCL)
- [Quellen](#Quellen)
- [TODO](#TODO)

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

# USER-STORIES
Die User-Stories umfassen Erklärungen und Anwendungsfälle der Standart-Query-Language im Bezug auf den Auftrag "Ferienhaus".

## DDL
### Create
```sql 
CREATE TABLE Person (
    PersonID int NOT NULL PRIMARY KEY,
    Nachname varchar(255) NOT NULL,
    Vorname varchar(255) NOT NULL,
    Alter int,
    Addresse varchar(255),
    Stadt varchar(255)
    );
```
```sql
CREATE TABLE Mitarbeiter AS SELECT Nachname, Vorname FROM Person;
```
```sql
CREATE TABLE Mitarbeiter AS SELECT Nachname, Vorname FROM Person WHERE Stadt LIKE "%D%";
```
#### Alter
```sql
ALTER TABLE Person ADD Email varchar(255);
```
```sql
ALTER TABLE Person DROP COLUMN Email;
```
```sql
ALTER TABLE Person MODIFY COLUMN Email varchar(100);
```
```sql
ALTER TABLE Person ADD CONSTRAINT PK_Person PRIMARY KEY (PersonID, Nachname);
```
```sql
ALTER TABLE Person DROP CONSTRAINT PK_Person;
```

### Drop
```sql
DROP TABLE Person;
```

### DML

Mit den DMLs (**D**ata **M**odifying **L**anguage(s)) *(dt. Datenmanipulationssprache(n))* kann man Daten bearbeiten, löschen, erstellen und, oder auslesen.
```sql
INSERT INTO <tabelle> (<column1>, ...)
VALUES (<value1>, ...);
```

**Userstory(s)**
Ein Mitarbeiter möchte einen neuen Mietvertrag in die Tabelle "Mietvertrag" über ein UI hinzufügen. Dieser Mietvertrag wird von einem Kunden (Ehepaar Zander) angefordert. Der Kunde hatte vorher noch keinen Mietvertrag aufgesetzt und ist somit ein neuer Kunde und muss somit in das System eingepflegt werden. 

```sql
/** Kunde anlegen: Ehepaar Zander **/
INSERT INTO Kunde (Kunde_ID, Address_ID, Name)
VALUES (5, 12, 'Ehepaar Zander');

/** Mietvertrag anlegen **/
INSERT INTO Mietvertrag (Mietvertrag_ID, Ferienhaus_ID, Kunde_ID, Beginn, Ende) 
VALUES (1, 2, 5, CONVERT('2007-08-29'  AS  Date), CONVERT('2007-09-19'  AS  Date));
```

#### UPDATE
Mit dem `INSERT` Befehl kann man sich im Allgemeinen Daten updaten (vorhandene Daten bearbeiten).

**Syntax**
```sql
UPDATE  <tabelle>  
SET  <column1> = <value1>, ...  
WHERE  <condition>; 
```

**Userstory(s)**
Ein Mitarbeiter hat einen Fehler gemacht, als er dem Ehepaar Zander den Mietvertrag aufgesetzte. Er hat vor Unterschrift des Vertrages jenen Vertrag schon in die Datenbank eingepflegt, somit muss er den Mietvertrag erneuert aufsetzten und den neuen Vertrag dem Ehepaar Zander zusenden. Der Mitarbeiter hat das falsche Haus für die Buchung ausgewählt.

```sql
UPDATE Mietvertrag
SET Ferienhaus_ID = 1
WHERE Kunde_ID = 5 AND Beginn = CONVERT('2007-08-29'  AS  Date) AND Ferienhaus_ID = 2
```
Das System muss die Änderung spezifisch auf das Ferienhaus auslegen, wo der Fehler unterlaufen ist, deswegen muss man mehrere Faktoren in die Conditions einfließen lassen. Da das Ehepaar Zander auch mehrere Ferienhäuser gebucht haben kann, muss man auch den Beginn mit hinzuzählen.

## DQL
In einer Datenbank werden verschiedene Abfragen und Operationen über mehre Tabellen hinweg ausgeführt. Als Ergebnis wird immer eine Tabelle zurückgegeben.

**D**ata **Q**uery **L**anguage, bedueted übersetzt so viel wie Datenbankabfragesprache. Diese ist ein Bestandteil von SQL und dient zum konkreten Abfragen von Datensätzen aus Tabellen. 

## Selektion & Projektion
### Projektion (=Auswahl von speziellen Spalten)
Die Projektion wird in SQL der `SELECT`-Klauses ausgeführt. Diese Klausel kann verschiedene Eigenschaften enthalten. Diese repräsentieren die Spaltennamen der entsprechenden Tabelle. Werden keine Eigenschaften in der Klausel angegeben, wird dies automatisch durch einen `*` in SQL ersetzt. 
```sql
SELECT * FROM Person;
```
```sql
SELECT Vorname, Nachname FROM Person;
```

### Selektion (=Auswahl von Zeilen nach Bedingungen)
Die Selektion wird in SQL mit der sogenannten `WHERE`-Bedingungen hinter dem eigentlichem `SELECT` Statement realisiert. Die `WHERE` -Bedingung kann mehrere Prädikate enthalten. Zurückgegeben wird  eine Tabelle mit einer bestimmten Ergebnismenge, die diese(s) Prädikate erfüllen. 

```sql
SELECT Vorname, Nachname FROM Person WHERE Vorname LIKE "T%s" AND WHERE Nachname LIKE "_r%";
```

```sql
SELECT Nachname, AVG(Alter) AS Durchschnittsalter WHERE Vorname = "Ben";  
```

```sql
SELECT Vorname, Nachname INTO PersonenNamen FROM Person WHERE PersonID > 10;
```

## Join
### Inner Join
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

## GROUP BY
```sql 
SELECT COUNT(Alter), Nachname FROM Person WHERE Alter >= 18 GROUP BY Nachname ORDER BY Nachname;
```

```sql 
SELECT COUNT(Person.Alter), Mitarbeiter.Name, Person.Nachname FROM Person LEFT JOIN Mitarbeiter
ON Mitarbeiter.Name = Person.Nachname GROUP BY Nachname ORDER BY COUNT(Alter) DESC;
```

# DCL
## GRANT
`GRANT` *(dt. gewähren )* gibt Datenbankbenutzern bestimmte Rechte auf eine Datenbank. 

**Syntax**
```sql
GRANT <privilegename> 
ON <objectname>
TO <username>
[WITH GRANT OPTION];
```

**Userstory(s)**
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
Mit dem folgendem SQL Statement kann man die Rechte auf die Befehle `SELECT`, `UPDATE`, `INSERT`, `DELETE` und `REFERENCES` alle auf einmal für einen Benutzer auf eine Tabelle, in dem Fall *"Ferienhaus"*, "*Mietvertrag"* und *"Maengelanzeige",* übergeben. Somit spart man sich Zeit und Arbeit. 

```sql
GRANT CREATE SESSION TO <username_mitarbeiter_chef>;
GRANT ALL ON Ferienhaus TO <username_mitarbeiter_chef>;
GRANT ALL ON Mietvertrag TO <username_mitarbeiter_chef>;
GRANT ALL ON Maengelanzeige TO <username_mitarbeiter_chef>;
```

*Ein weiteres Beispiel:*
Ein neuer IT-Mitarbeiter wird eingestellt, welcher einzelne Tabellen erstellen und löschen muss. Dazu erhält dieser auch alle Rechte auf die *"Ferienhaus"* Tabelle, damit dieser bestimmte Datensätze auch ändern kann.

```sql
GRANT CREATE ANY TABLE TO {username_it_mitarbeiter}; 
GRANT DROP ANY TABLE TO {username_it_mitarbeiter};
GRANT ALL ON Ferienhaus TO {username_it_mitarbeiter};
```

#### REVOKE
Der Befehl `Revoke` *(dt. widerrufen)* widerruft eine Berechtigung von einem Benutzer / Rolle.

**Syntax**
```sql
REVOKE <privilegename> ON <objectname> FROM <username>
```
**Userstory(s)**
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

# TODO

 - [ ] Where Bedingung?
 - [ ] Natural Join
 - [ ] Self Join
 - [ ] (Lateral Join)
 - [ ] Cross Join
 - [ ] https://www.devart.com/dbforge/sql/sqlcomplete/sql-join-statements.html
 - [ ] https://stackedit.io
 - [ ] Verweis zu erweitertem Join Doc
 - [ ] Order by Erklärung
 - [ ] SQL erklärung
