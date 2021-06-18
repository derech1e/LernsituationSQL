

# Dokumentation Lernsituation SQL 

Kurzbeschreibung

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
	- [Zusatz: Benutzer Hinzufügen](#Zusatz)

# Arbeitsplanung
> Aufgabenverteilung für die LS SQL

## Thomas
### DDL
#### Create
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

#### Drop
```sql 
DROP TABLE Person;
```


### DML
INSERT, UPDATE, DELETE

### DQL
#### Select
```sql 
SELECT * FROM Person;
```

```sql 
SELECT Vorname, Nachname FROM Person WHERE Vorname LIKE "T%s" AND WHERE Nachname LIKE "_r%";
```

```sql 
SELECT Nachname, AVG(Alter) AS Durchschnittsalter WHERE Vorname = "Ben";  
```

```sql 
SELECT Vorname, Nachname INTO PersonenNamen FROM Person WHERE PersonID > 10;
```

#### Join
##### Inner Join
Gibt Datensätze zurück, die in beiden Tabellen mindestens ein übereinstimmenden Wert haben. 
![Inner Join](https://www.w3schools.com/sql/img_innerjoin.gif)

```sql 
SELECT Person.PersonID, Mitarbeiter.Name, Person.Nachname FROM Person INNER JOIN Mitarbeiter
ON Mitarbeiter.Name = Person.Nachname;
```
##### Left [Outer] Join
Gibt alle Datensätze aus der "linken" Tabelle zurück, sowie übereinstimmende Datensätze aus der "rechten" Tabelle. 

**Wichtig: Die Datensätze werden aus der linken Tabelle immer zurückgegeben, auch wenn es keine Übereinstimmung mit den Datensätzen aus der rechten Tabelle gibt.**
![Left Join](https://www.w3schools.com/sql/img_leftjoin.gif)

```sql 
SELECT Person.PersonID, Mitarbeiter.Name, Person.Nachname FROM Person LEFT JOIN Mitarbeiter
ON Mitarbeiter.Name = Person.Nachname ORDER BY Mitarbeiter.Name;
```

Todo: Order by erklärung


##### Right [Outer] Join
Gibt alle Datensätze aus der "rechten" Tabelle zurück, sowie übereinstimmende Datensätze aus der "linken " Tabelle.

**Wichtig: Die Datensätze werden aus der rechten Tabelle immer zurückgegeben, auch wenn es keine Übereinstimmung mit Datensätzen aus der linken Tabelle gibt.**

![Right Join](https://www.w3schools.com/sql/img_rightjoin.gif)

```sql 
SELECT Person.PersonID, Mitarbeiter.Name, Person.Nachname FROM Person RIGHT JOIN Mitarbeiter
ON Mitarbeiter.Name = Person.Nachname;
```

##### Full [Outer] Join
Gibt immer Datensätze zurück, unabhängig davon ob es eine übereinstimmung in der anderen Tabelle gibt oder nicht. Es können keine Datensätze verschwinden.
![Full Outer Join](https://www.w3schools.com/sql/img_fulljoin.gif)

```sql 
SELECT Person.PersonID, Mitarbeiter.Name, Person.Nachname FROM Person FULL JOIN Mitarbeiter
ON Mitarbeiter.Name = Person.Nachname;
```
Todo: Where Bedingung?
Natural Join
Self Join
(Lateral Join)
Cross Join
https://www.devart.com/dbforge/sql/sqlcomplete/sql-join-statements.html
https://stackedit.io/app#



#### GROUP BY
```sql 
SELECT COUNT(Alter), Nachname FROM Person WHERE Alter >= 18 GROUP BY Nachname ORDER BY Nachname;
```

```sql 
SELECT COUNT(Person.Alter), Mitarbeiter.Name, Person.Nachname FROM Person LEFT JOIN Mitarbeiter
ON Mitarbeiter.Name = Person.Nachname GROUP BY Nachname ORDER BY COUNT(Alter) DESC;
```




#### SELEKTION
#### PROJEKTION mit WHERE
#### DURCHSCHNITT

### DCL
GRANT, DENY

### Zusatz
Benutzer Hinzufügen

**Erst anwendungsfall dann Überlegung**

## Anton
- Dokumentation schreiben

## Louis
- Analyse einer DB
