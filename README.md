
# Vortrag Joins

Diese Dokumentation gibt einen kleinen Einblick über die Verbindungen von Tabellen in SQL. Im Zusammenhang mit entsprechenden Beispielen werden die Vorgestellten Join Arten veranschaulicht.

# Inhaltsverzeichnis
- [Beispieldatenbank](#Beispieldatenbank)
- [Join-Arten](#Join-Arten)
	- [Cross Join](#Cross-Join)
	- [Natural Join](#Natural-Join)
	- [Inner Join](#Inner-Join)
	- [Left Join](#Left-Join)
	- [Right Join](#Right-Join)
	- [Full Join](#Full-Join)
	- [Self Join](#Self-Join)
	- [Apply](#Apply)
- [Quellen](#Quellen)

# Beispieldatenbank

Auf dieser Datenbank basieren die folgenden Beispiele. Das Script ist speziell an T-SQL angepasst und muss daher in entsprechender Umgebung ausgeführt werden.

```sql
CREATE DATABASE IF NOT EXISTS joinDB;
USE joinDB;

DROP TABLE IF EXISTS Kreditkarte;
CREATE TABLE Kreditkarte (
  Kartennummer int NOT NULL,
  Firma nvarchar(100) NOT NULL,
  Inhaber nvarchar(75) NOT NULL,
  Ablaufdatum DATE NOT NULL,
  KEY Kartennummer (Kartennummer)
);

INSERT INTO Kreditkarte VALUES
    (12345,'VISA','Max Mustermann','2017-05-01'),
    (12346,'Mastercard','Katrin Musterfrau','2018-01-01'),
    (12347,'American Express','John Doe','2015-02-01'),
    (12348,'Diners Club','John Doe','2020-03-01');

DROP TABLE IF EXISTS Rechnungen;
CREATE TABLE Rechnungen (
  RechnungsNr int NOT NULL,
  KundenNr nvarchar(6) NOT NULL,
  Betrag DECIMAL(10,2) NOT NULL,
  Kartennummer int DEFAULT NULL
);

INSERT INTO Rechnungen VALUES
    (98765,'ABX039',49.95,12345),
    (98766,'ABX039',12.95,NULL),
    (98767,'ABX040',79.95,12347),
    (98768,'ABX050',59.99,12347),
    (98769,'ABX050',29.99,12348),
    (98770,'ABX060',99.99,NULL);

DROP TABLE IF EXISTS Kunden;
CREATE TABLE Kunden(
  KundenNr nvarchar(6) NOT NULL,
  Name nvarchar(50) NOT NULL,
  Land nvarchar(50) NOT NULL
);

INSERT INTO Kunden VALUES
    ('ABX039','Lissa Yockey','Deutschland'),
    ('ABX040','Cedric Don','USA'),
    ('ABX050','Jolanda Shontz','Russland'),
    ('ABX060','Naoma Bernardi','Norwegen');
```

# Join-Arten
## Cross Join
Der Cross Join ist der "standard" Join, es wird aus alle Einträgen der beiden Tabellen das Kreuzprodukt gebildet. Das Ergebnis des Join wird ungefiltert zurückgegeben.

Das Kreuzprodukt, lieft als Resultat alle Kombinationsmöglichkeiten beider Tabellen.

**Syntax**

```sql
SELECT  { * | <columnname>[,...]} FROM <tablename1> CROSS JOIN <tablename2>
```

**Datenbankscript**

```sql
CREATE TABLE Meals(MealName nvarchar(100));
CREATE TABLE Drinks(DrinkName nvarchar(100));
INSERT INTO Drinks VALUES ('Orange Juice'),('Tea'),('Cofee');
INSERT INTO Meals VALUES('Omlet'), ('Fried Egg'), ('Sausage');
```

**Beispiel**

```sql
SELECT CONCAT_WS('-',MealName,DrinkName) AS MenuList FROM Meals CROSS JOIN Drinks;
```

> `CONCAT_WS` = concatenate with separator (dt. mit Trennzeichen verketten)

<p float="left">
<img src="./assets/img/Table1.png" width="18%" height="18%" />
<img src="./assets/img/Table2.png" hspace="50" width="25%" height="25%" />
<img src="./assets/img/Table3.png" width="25%" height="25%" />
</p>

![Image1](https://www.sqlshack.com/wp-content/uploads/2020/02/sql-cross-join-working-mechanism.png)

## Natural Join

Der Natural Join ist eine Erweiterung des [Cross Join](#Cross-Join), wobei die zurückgegebene Tabelle automatisch gefiltert wird. Voraussetzung dafür ist, dass mindestens eine identische Spalte existiert. Es wird keine `ON`-Klausel im Natural Join benötigt. Die gleichnamigen Spalten werden zu einer Zusammengefasst.

**Syntax**

```sql 
NATURAL JOIN
```
```sql
SELECT { * | columnname[,...]} FROM tabelle1 NATURAL JOIN tabelle2;
```

**Beispiel**
```sql
SELECT * FROM Kunden NATURAL JOIN Rechnungen;
```


| KundenNr | Name           | Land        | RechnungsNr | Betrag | Kartennummer |
| -------- | -------------- | ----------- | ----------- | ------ | ------------ |
| ABX039   | Lissa Yockey   | Deutschland | 98765       | 49,95  | 12345        |
| ABX039   | Lissa Yockey   | Deutschland | 98766       | 12,95  | (Null)       |
| ABX040   | Cedric Don     | USA         | 98767       | 79,95  | 12347        |
| ABX050   | Gretta Wimmer  | Deutschland | 98768       | 59,99  | 12347        |
| ABX050   | Gretta Wimmer  | Deutschland | 98769       | 29,99  | 12348        |
| ABX060   | Naoma Bernardi | Norwegen    | 98770       | 99,99  | (Null)       |


## Inner Join

Der Inner Join gibt Datensätze zurück, die in beiden Tabellen mindestens ein übereinstimmenden Wert haben. 
Die Reihenfolge, in der die Tabellen genannt werden, ist bei diesem Join egal.
<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/inner-schema.png" width="60%" height="60%" />

**Syntax**

```sql 
INNER JOIN
```
```sql
SELECT { * | columnname[,...]} FROM <tablename> INNER JOIN <tablename> ON <columnname> = <columnname>;
```

**Beispiel**

Gesucht werden alle Rechnungen, die mit Kreditkarte beglichen wurden.

```sql
SELECT
  RechnungsNr,
  KundenNr,
  Betrag,
  Rechnungen.Kartennummer,
  Firma,
  Inhaber,
  Ablaufdatum
FROM Kreditkarte
INNER JOIN Rechnungen ON Kreditkarte.Kartennummer = Rechnungen.Kartennummer
```

**Ergebnis der Abfrage**

| RechnungsNr | KundenNr | Betrag | Kartennummer | Firma            | Inhaber        | Ablaufdatum |
| ----------- | -------- | ------ | ------------ | ---------------- | -------------- | ----------- |
| 98765       | ABX039   | 49,95  | 12345        | VISA             | Max Mustermann | 05/2007     |
| 98767       | ABX040   | 79,95  | 12347        | American Express | John Doe       | 01/2007     |
| 98768       | ABX050   | 59,99  | 12347        | American Express | John Doe       | 01/2007     |
| 98769       | ABX050   | 29,99  | 12348        | Diners Club      | John Doe       | 03/2008     |


## Left Join

Der Left Join gibt alle Datensätze aus der "linken" Tabelle zurück, sowie übereinstimmende Datensätze aus der "rechten" Tabelle. Die Reihenfolge, in der die Tabellen genannt werden, kann bei diesem Join andere Ergebnisse liefern.

**Logik**

Die Datensätze werden aus der linken Tabelle immer zurückgegeben, auch wenn es keine Übereinstimmung mit den Datensätzen aus der rechten Tabelle gibt. Erfüllt ein Datensatz das `ON`-Kriterium aus der rechten Tabelle, wird er ebenfalls zurückgegeben andernfalls bleibt die Spalte leer (`NULL`).


<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/left-outer-schema.png" width="60%" height="60%" />

**Syntax**

```sql 
LEFT JOIN
```
```sql
SELECT { * | columnname[,...]} FROM <tablename> LEFT JOIN <tablename> ON <columnname> = <columnname>;
```

**Beispiel**

Gesucht werden alle Rechnungen. Falls sie per Kreditkarte bezahlt wurden, so sollen die Kartendaten ebenfalls ausgegeben werden.

```sql
SELECT
  RechnungsNr,
  KundenNr,
  Betrag,
  Rechnungen.Kartennummer,
  Firma,
  Inhaber,
  Ablaufdatum
FROM Rechnungen
LEFT JOIN Kreditkarte ON Kreditkarte.Kartennummer = Rechnungen.Kartennummer
```

| RechnungsNr | KundenNr | Betrag | Kartennummer | Firma            | Inhaber        | Ablaufdatum |
| ----------- | -------- | ------ | ------------ | ---------------- | -------------- | ----------- |
| 98765       | ABX039   | 49,95  | 12345        | VISA             | Max Mustermann | 05/2007     |
| 98766       | ABX039   | 12,95  | -           | -               | -             | -          |
| 98767       | ABX040   | 79,95  | 12347        | American Express | John Doe       | 01/2007     |
| 98768       | ABX050   | 59,99  | 12347        | American Express | John Doe       | 01/2007     |
| 98769       | ABX050   | 29,99  | 12348        | Diners Club      | John Doe       | 03/2008     |
| 98770       | ABX060   | 99,99  | -           | -               | -             | -          |

## Right Join

Der Right Join gibt alle Datensätze aus der "rechten" Tabelle zurück, sowie übereinstimmende Datensätze aus der "linken " Tabelle. Er arbeitet genau entgegengesetzt des [Left Joins](Left-Join).

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/right-outer-schema.png" width="60%" height="60%" />

**Syntax**

```sql 
RIGHT JOIN
```
```sql
SELECT { * | columnname[,...]} FROM <tablename> RIGHT JOIN <tablename> ON <columnname> = <columnname>;
```

**Beispiel**

Gesucht werden alle Karteninformationen. Falls mit der entsprechenden Kreditkarte etwas bestellt wurde, sollen die Rechnungsinformationen beigefügt werden.
```sql 
SELECT
  RechnungsNr,
  KundenNr,
  Betrag,
  Kreditkarte.Kartennummer,
  Firma,
  Inhaber,
  Ablaufdatum
FROM Rechnungen RIGHT JOIN Kreditkarte
ON Kreditkarte.Kartennummer = Rechnungen.Kartennummer
```

| RechnungsNr | KundenNr | Betrag | Kartennummer | Firma            | Inhaber           | Ablaufdatum |
| ----------- | -------- | ------ | ------------ | ---------------- | ----------------- | ----------- |
| 98765       | ABX039   | 49,95  | 12345        | VISA             | Max Mustermann    | 05/2007     |
| -          | -       | -     | 12346        | Mastercard       | Katrin Musterfrau | 01/2008     |
| 98767       | ABX040   | 79,95  | 12347        | American Express | John Doe          | 01/2007     |
| 98768       | ABX050   | 59,99  | 12347        | American Express | John Doe          | 01/2007     |
| 98769       | ABX050   | 29,99  | 12348        | Diners Club      | John Doe          | 03/2008     |


## Full Join

Der Full Join, gibt immer Datensätze zurück, unabhängig davon ob es eine Übereinstimmung in der anderen Tabelle gibt oder nicht. Es können keine Datensätze verschwinden.

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/all-joins.png" width="60%" height="60%" />

**Logik**

Jeder Datensatz der rechten und der linken Tabelle kommt in die Ergebnismenge. Findet sich über das `ON`-Kriterium ein passender Partner werden beide zusammengefügt, andernfalls wird die jeweils fehlende Seite mit `NULL` aufgefüllt.

**Syntax**

```sql 
FULL JOIN
```
```sql
SELECT { * | columnname[,...]} FROM <tablename> FULL JOIN <tablename> ON <columnname> = <columnname>;
```

**Beispiel**

Gesucht werden sowohl alle Karteninformationen als auch alle Rechnungen. Sofern möglich sollen dabei Rechnungen und Karten kombiniert werden.

```sql 
SELECT
  RechnungsNr,
  KundenNr,
  Betrag,
  Rechnungen.Kartennummer,
  Firma,
  Inhaber,
  Ablaufdatum
FROM Rechnungen
FULL JOIN Kreditkarte ON Kreditkarte.Kartennummer = Rechnungen.Kartennummer;
```

| RechnungsNr | KundenNr | Betrag | Kartennummer | Firma            | Inhaber           | Ablaufdatum |
| ----------- | -------- | ------ | ------------ | ---------------- | ----------------- | ----------- |
| 98765       | ABX039   | 49,95  | 12345        | VISA             | Max Mustermann    | 05/2007     |
| 98766       | ABX039   | 12,95  | -           | -               | -                | -          |
| -          | -       | -     | 12346        | Mastercard       | Katrin Musterfrau | 01/2008     |
| 98767       | ABX040   | 79,95  | 12347        | American Express | John Doe          | 01/2007     |
| 98768       | ABX050   | 59,99  | 12347        | American Express | John Doe          | 01/2007     |
| 98769       | ABX050   | 29,99  | 12348        | Diners Club      | John Doe          | 03/2008     |
| 98770       | ABX060   | 99,99  | -           | -               | -                | -          |

## Self Join

Ein Self Join ist ein [Inner Join](#Inner-Join), bei dem die Tabelle mit sich selber verbunden wird.

**Syntax**

```sql 
INNER JOIN
```
```sql
SELECT { * | columnname[,...]} FROM <tablename> INNER JOIN <tablename> ON <columnname> = <columnname>;
```
**Beispiel**

*Datensatz:*

| Id | Name      | Gehalt | ManagerId  |
| -- | ------------- | ------ | ---------- |
| 1  | John Smith    | 10000  | 3          |
| 2  | Jane Anderson | 12000  | 3          |
| 3  | Tom Lanon     | 15000  | 4          |
| 4  | Anne Connor   | 20000  | John Smith |
| 5  | Jeremy York   | 9000   | 1          |

*Statement:*

```sql
SELECT employee.Id,
        employee.FullName,
        employee.ManagerId,
        manager.FullName as ManagerName
FROM Employees employee
JOIN Employees manager
ON employee.ManagerId = manager.Id
```

*Zurückgegebene Tabelle:*

| Id | Name | ManagerId | ManagerName |
| -- | ------------- | --------- | ----------- |
| 1  | John Smith    | 3         | Tom Lanon   |
| 2  | Jane Anderson | 3         | Tom Lanon   |
| 3  | Tom Lanon     | 4         | Anne Connor |
| 5  | Jeremy York   | 1         | John Smith  |

## Apply

- Performance Stark
Aufgabe: Aus einer Tabelle mit ausreichend Umsatz-Datensätzen sollen für die Top 5 Kunden die Top 5 Produkte ermittelt werden.
http://dcx.sap.com/1201/de/dbusage/apply-joins-joinsasp.html

![enter image description here](https://cdn.bissantz.de/images/2016/01/SQL4.png)



# Quellen
- https://www.sqlshack.com/sql-cross-join-with-examples/
- https://www.w3resource.com/sql/joins/natural-join.php
- https://wiki.byte-welt.net/wiki/
- https://wiki.selfhtml.org/wiki/Datenbank/Einführung_in_Joins
- https://www.ionos.de/digitalguide/hosting/hosting-technik/inner-join-erklaerung-und-beispiele/
- https://www.ionos.de/digitalguide/hosting/hosting-technik/sql-outer-join/
- https://www.devart.com/dbforge/sql/sqlcomplete/sql-join-statements.html
- https://learnsql.com/blog/what-is-self-join-sql/
- https://stackedit.io
