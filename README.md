
# Vortrag Joins

Diese Dokumentation erklärt die Grundlegenden Sprachbestanteile von SQL. Im Zusammenhang mit einem Ferienhaus-Auftrag werden diese anschaulich dargestellt und verdeutlicht.

# Inhaltsverzeichnis
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
- [TODO](#TODO)

# Beispieldatenbank

```sql
# CREATE DATABASE  IF NOT EXISTS `selfhtml`;
# USE `selfhtml`;

DROP TABLE IF EXISTS `Kreditkarte`;
CREATE TABLE `Kreditkarte` (
  `Kartennummer` BIGINT(20) NOT NULL,
  `Firma` tinytext NOT NULL,
  `Inhaber` tinytext NOT NULL,
  `Ablaufdatum` DATE NOT NULL,
  KEY `Kartennummer` (`Kartennummer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Kreditkarte` WRITE;
INSERT INTO `Kreditkarte` VALUES
    (12345,'VISA','Max Mustermann','2017-05-01'),
    (12346,'Mastercard','Katrin Musterfrau','2018-01-01'),
    (12347,'American Express','John Doe','2015-02-01'),
    (12348,'Diners Club','John Doe','2020-03-01');
UNLOCK TABLES;

DROP TABLE IF EXISTS `Rechnungen`;
CREATE TABLE `Rechnungen` (
  `RechnungsNr` BIGINT(20) NOT NULL,
  `KundenNr` tinytext NOT NULL,
  `Betrag` DECIMAL(10,2) NOT NULL,
  `Kartennummer` BIGINT(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Rechnungen` WRITE;
INSERT INTO `Rechnungen` VALUES
    (98765,'ABX039',49.95,12345),
    (98766,'ABX039',12.95,NULL),
    (98767,'ABX040',79.95,12347),
    (98768,'ABX050',59.99,12347),
    (98769,'ABX050',29.99,12348),
    (98770,'ABX060',99.99,NULL);
UNLOCK TABLES;
```

# Join-Arten
## Cross Join
Der Cross Join ist der "standard" Join, es wird aus alle Einträgen der beiden Tabellen das Kreuzprodukt gebildet. Das Ergebnis des Join wird ungefiltert zurückgegeben.

Das Kreuzprodukt, lieft als Resultat alle Kombinationsmöglichkeiten beider Tabellen.

**Beispiel**
<table>
<tr><td>

| ID| Name | Ort_ID |
|--|--|--|
| 1 | person1 | 1 |
| 2 | person2 | 1 |
| 3 | person3 | 2 |

*Tabelle 1: Personentabelle*
</td><td>

| Ort_ID| Ortsname |
|--|--|
| 1 | Berlin |
| 2 | Hamburg |
| 3 | München |

*Tabelle 2: Ortstabelle*
</td></tr> </table>

| Person\_ID | Name    | Ort\_ID | Ort\_ID | Ortsname |
| ---------- | ------- | ------- | ------- | -------- |
| 1          | person1 | 1       | 1       | Berlin   |
| 2          | person2 | 1       | 1       | Berlin   |
| 3          | person3 | 2       | 1       | Berlin   |
| 1          | person1 | 1       | 2       | Hamburg  |
| 2          | person2 | 1       | 2       | Hamburg  |
| 3          | person3 | 2       | 2       | Hamburg  |
| 1          | person1 | 1       | 3       | München  |
| 2          | person2 | 1       | 3       | München  |
| 3          | person3 | 2       | 3       | München  |

*Tabelle 3: Personen- und Ortstabelle im Kreuzprodukt*

Quelle: https://wiki.byte-welt.net/wiki/Cross_Join_(SQL)

## Natural Join
Der Natural Join ist eine Erweiterung des [Cross Join](#Cross-Join), wobei die zurückgegebene Tabelle automatisch gefiltert wird.

**Syntax**
```sql 
NATURAL JOIN
```
```sql
SELECT * FROM tabelle1 NATURAL JOIN tabelle2;
```
Es wird nach einer gleichnamigen Spalte geschaut und entsprechend automatisch gefiltert. 

Quelle: https://wiki.byte-welt.net/wiki/Natural_Join_(SQL)

**Beispiel**
<table>
<tr><td>

| ID| Name | Ort_ID |
|--|--|--|
| 1 | person1 | 1 |
| 2 | person2 | 1 |
| 3 | person3 | 2 |

*Tabelle 1: Personentabelle*
</td><td>

| Ort_ID| Ortsname |
|--|--|
| 1 | Berlin |
| 2 | Hamburg |
| 3 | München |

*Tabelle 2: Ortstabelle*
</td></tr> </table>

| Person\_ID | Name    | Ort\_ID | Ort\_ID | Ortsname |
| ---------- | ------- | ------- | ------- | -------- |
| 1          | person1 | 1       | 1       | Berlin   |
| 2          | person2 | 1       | 1       | Berlin   |
| 3          | person3 | 2       | 2       | Hamburg  |

*Tabelle 3: Ergebnis des Joins*

## Inner Join
Gibt Datensätze zurück, die in beiden Tabellen mindestens ein übereinstimmenden Wert haben. 
<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/inner-schema.png" width="500" height="300" />

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

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/left-outer-schema.png" width="500" height="300" />

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

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/right-outer-schema.png" width="500" height="300" />


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

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/all-joins.png" width="500" height="300" />


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
https://wiki.selfhtml.org/wiki/Datenbank/Einführung_in_Joins
https://www.ionos.de/digitalguide/hosting/hosting-technik/inner-join-erklaerung-und-beispiele/
https://www.ionos.de/digitalguide/hosting/hosting-technik/sql-outer-join/

# TODO

 - [ ] https://www.devart.com/dbforge/sql/sqlcomplete/sql-join-statements.html
 - [ ] https://stackedit.io
 - [ ] Impliziete und Expliziete Schreibweise
