
# Dokumentation Lernsituation SQL 

Diese Dokumentation erklärt die Grundlegenden Sprachbestanteile von SQL. Im Zusammenhang mit einem Ferienhaus-Auftrag werden diese anschaulich dargestellt und verdeutlicht.

# Inhaltsverzeichnis
- [Auftragsanalyse](#Auftragsanalyse)
- [Arbeitsplanung](#Arbeitsplanung)
	- [Thomas](#Thomas)
	- [Anton](#Anton)
	- [Louis](#Louis)
- [SOLL-IST Auswertung](#SOLL-IST-Auswertung)
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

# SOLL-IST Auswertung

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

## DML
Mit den DMLs (Data Modifying Language(s)) *(dt. Datenmanipulations-Sprache)* kann man Daten bearbeiten, löschen, erstellen und, oder auslesen.
### INSERT
### UPDATE
### DELETE


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

**Weitere Join-Varianten die für MS SQL Server gelten sind [hier](https://github.com/derech1e/LernsituationSQL/blob/vortrag_joins/README.md) zu finden.**

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

In dieser Userstory bekommt ein neuer Mitarbeiter Rechte auf die Datenbank, damit dieser das System benutzen kann. Er kann sich somit mit einer SQL Session verbinden und in dieser arbeiten. 

Der Befehl `ALTER` gibt in diesem Beispiel de  Benutzer die Rechte, dass er auf der Datenbank unendlich viele Daten speichern kann.  [Siehe mehr](#Alter)

```sql
GRANT CREATE SESSION TO {username_mitarbeiter};
GRANT SELECT ON Ferienhaus TO {username_mitarbeiter};
GRANT DELETE ON Ferienhaus TO {username_mitarbeiter};
GRANT UPDATE ON Ferienhaus TO {username_mitarbeiter};
ALTER USER {username_mitarbeiter} QUOTA UNLIMITED ON SYSTEM;
```
Mit dem folgendem SQL Statement kann man die Rechte auf die Befehle `SELECT`, `UPDATE`, `INSERT`, `DELETE` und `REFERENCES` alle auf einmal für einen Benutzer auf eine Datenbank übergeben. Wichtig hierbei ist die Angabe der Datenbank, in dem Fall "Ferienhaus". In diesem Beispiel bekommt der Chef der Mitarbeiter alle Rechte auf die Ferienhaus Datenbank. Somit spart man sich zeit. 
```sql
GRANT ALL ON Ferienhaus TO {username_mitarbeiter_chef};
```

*Ein weiteres Beispiel:*
Ein neuer IT-Mitarbeiter wird eingestellt, welcher einzelne Tabellen erstellen und löschen muss. Dazu erhällt dieser auch alle Rechte auf die "Ferienhaus" Datenbank, damit dieser bestimmte Datensätze auch ändern kann. 

```sql
GRANT CREATE ANY TABLE TO {username_it_mitarbeiter}; 
GRANT DROP ANY TABLE TO {username_it_mitarbeiter};
GRANT ALL ON Ferienhaus TO {username_it_mitarbeiter};
```

## REVOKE

Ein Mitarbeiter verlässt die Firma. Somit müssen auch seine Rechte, aus Datensicherheitsgründen, weggenommen werden. Dies ist mit dem Befehl `Revoke` *(dt. widerrufen)* möglich. 

```sql
REVOKE CREATE SESSION FROM {username_mitarbeiter};
REVOKE FROM {username_mitarbeiter} QUOTA UNLIMITED ON SYSTEM;
```
*Ein weiteres Beispiel:*
Ein IT Mitarbeiter verlässt die IT-Firma. Somit müssen auch seine Rechte weggenommen werden.

```sql
REVOKE CREATE ANY TABLE FROM {username_it_mitarbeiter}; 
REVOKE DROP ANY TABLE FROM {username_it_mitarbeiter};
```

Mit folgendem SQL Statement kann man Rechte eines Benutzers entfernen. Die Befehle `SELECT`, `UPDATE`, `INSERT`, `DELETE` und `REFERENCES` des normalen Mitarbeiter Chefs werden alle auf einmal entfernt. 
```sql
REVOKE ALL ON Ferienhaus FROM {username_mitarbeiter_chef};
```
# Quellen
- https://www.devart.com/dbforge/sql/sqlcomplete/sql-join-statements.html

# TODO
 - [ ] Where Bedingung?
 - [ ] https://stackedit.io
 - [ ] Verweis zu erweitertem Join Doc
 - [ ] Order by Erklärung
 - [ ] SQL erklärung
