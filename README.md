


# Vortrag Joins

Diese Dokumentation erklärt die Grundlegenden Sprachbestanteile von SQL. Im Zusammenhang mit einem Ferienhaus-Auftrag werden diese anschaulich dargestellt und verdeutlicht.

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

Auf dieser Beispildatenbank basiren die folgenden Beispile. Das Script ist speziell an T-SQL angepasst und muss daher in entsprechender umgebung ausgeführt werden. 

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
    ('ABX039','Rodger Ruben','Schweiz'),
    ('ABX040','Cedric Don','USA'),
    ('ABX050','Gretta Wimmer','Deutschland'),
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
Es wird nach einer gleichnamigen Spalte geschaut und entsprechend automatisch gefiltert. 

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
Gibt Datensätze zurück, die in beiden Tabellen mindestens ein übereinstimmenden Wert haben. 
<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/inner-schema.png" width="50%" height="50%" />

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

Das Ergebnis der Abfrage lautet:

| RechnungsNr | KundenNr | Betrag | Kartennummer | Firma            | Inhaber        | Ablaufdatum |
| ----------- | -------- | ------ | ------------ | ---------------- | -------------- | ----------- |
| 98765       | ABX039   | 49,95  | 12345        | VISA             | Max Mustermann | 05/2007     |
| 98767       | ABX040   | 79,95  | 12347        | American Express | John Doe       | 01/2007     |
| 98768       | ABX050   | 59,99  | 12347        | American Express | John Doe       | 01/2007     |
| 98769       | ABX050   | 29,99  | 12348        | Diners Club      | John Doe       | 03/2008     |


**Beachten Sie, dass die Reihenfolge, in der die Tabellen genannt werden, bei diesem Join egal ist.**


## Left [Outer] Join
Gibt alle Datensätze aus der "linken" Tabelle zurück, sowie übereinstimmende Datensätze aus der "rechten" Tabelle. 

**Wichtig: Die Datensätze werden aus der linken Tabelle immer zurückgegeben, auch wenn es keine Übereinstimmung mit den Datensätzen aus der rechten Tabelle gibt.**

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/left-outer-schema.png" width="50%" height="50%" />

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


**Beachten Sie, dass im Unterschied zum INNER JOIN die Herkunft der selektierten Kartennummer eine Rolle spielt. Dies ist mehr eine syntaktische Feinheit als inhaltliche Notwendigkeit.**



## Right [Outer] Join
Gibt alle Datensätze aus der "rechten" Tabelle zurück, sowie übereinstimmende Datensätze aus der "linken " Tabelle.

**Wichtig: Die Datensätze werden aus der rechten Tabelle immer zurückgegeben, auch wenn es keine Übereinstimmung mit Datensätzen aus der linken Tabelle gibt.**

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/right-outer-schema.png" width="50%" height="50%" />


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


**Beachten Sie, dass im Unterschied zum INNER JOIN die Herkunft der selektierte Kartennummer eine Rolle spielt. Dies ist mehr eine syntaktische Feinheit als inhaltliche Notwendigkeit.**

## Full [Outer] Join
Gibt immer Datensätze zurück, unabhängig davon ob es eine Übereinstimmung in der anderen Tabelle gibt oder nicht. Es können keine Datensätze verschwinden.

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/all-joins.png" width="50%" height="50%" />


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
OUTER JOIN Kreditkarte ON Kreditkarte.Kartennummer = Rechnungen.Kartennummer;
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

**Beachten Sie, dass in diesem Fall die Reihenfolge der Tabellen wiederum egal ist. Achtung: MySQL unterstützt diese Abfrage nicht.**

## Self Join

# Quellen
- https://www.sqlshack.com/sql-cross-join-with-examples/
- https://www.w3resource.com/sql/joins/natural-join.php
- https://wiki.byte-welt.net/wiki/
- https://wiki.selfhtml.org/wiki/Datenbank/Einführung_in_Joins
- https://www.ionos.de/digitalguide/hosting/hosting-technik/inner-join-erklaerung-und-beispiele/
- https://www.ionos.de/digitalguide/hosting/hosting-technik/sql-outer-join/
- https://www.devart.com/dbforge/sql/sqlcomplete/sql-join-statements.html
- https://stackedit.io
