

# Dokumentation Lernsituation SQL 
Diese Dokumentation erklärt die grundlegenden Sprachbestandteile von SQL. Im Zusammenhang mit einem Ferienhaus-Auftrag werden diese anschaulich dargestellt und verdeutlicht.

# Inhaltsverzeichnis
- [Erläuterung der Struktur](#Erläuterung-der-Struktur)
- [Auftragsanalyse](#Auftragsanalyse)
- [Schutzbedarfsanalyse](#Schutzbedarfsanalyse)
- [SOLL-IST Analyse](#SOLL-IST-Analyse)
- [Arbeitsplanung](#Arbeitsplanung)
- [Hinweise zum Verständnis](#Hinweise-zum-Verständnis)
- [SQL Bestandteile](#SQL-Bestandteile)
	- [DDL](#DDL)
	- [DML](#DML)
	- [DQL](#DQL)
	- [DCL](#DCL)

# Erläuterung der Struktur
Dieses Dokument wird zunächst die verschiedenen Sprachbestandteile von SQL behandeln.
Nach diesem erläuternden Teil leitet das Dokument in den analytischen Teil hier in Form von der Auftragsanalyse, SOLL-IST Analyse und Schutzbedarfsanalyse ein und schließt mit der Quellenangabe ab.

#### Hinweise zum Verständnis des Syntax
Die allgemeine Syntax der Befehle orientiert sich immer an dem vom SQL vorgegebenen Standard. Darüber hinaus werden die [Anwendungsbeispiele](#User-Storys) nach dem im [MS-Server Management Studio](https://docs.microsoft.com/de-de/sql/ssms/sql-server-management-studio-ssms?view=sql-server-ver15) enthaltenen [T-SQL](https://de.wikipedia.org/wiki/Transact-SQL) Standard erläutert. 

#### Conditions/ WHERE Clause

In SQL gibt es verschiedene Vergleichsoperatoren. In der nachfolgenden Tabelle sind alle Operatoren gelistet, die in einer `WHERE` Klausel benutzt werden können. Die `WHERE` Klausel an sich befindet sich am Ende eines Statements.

| Operator| Beschreibung| 
| ------- | -------|
| =       | Gleich| 
| >       | Größer als| 
| <       | Kleiner als|
| >=      | Größer oder Gleich|
| <=      | Kleiner oder Gleich|
| <>      | Ungleich. Der Operator wird in manchen Version auch so geschrieben: != |
| BETWEEN | Zwischen einem bestimmten Bereich |
| LIKE    | Suche nach einem [Muster](https://www.w3schools.com/sql/sql_wildcards.asp)|
| IN      | Das Spezifizieren von mehreren möglichen Werten für eine Spalte |


> Predicates sind eine weitere Möglichkeit um eine logische Bedingung zu definieren, die dann auf Zeilen in einer Tabelle angewendet werden kann. Sie werden in der Suchbedingung von `WHERE` Klauseln verwendet, bei denen ein boolescher Wert erforderlich ist. Ein Überblick zu den Predicates, ist [hier](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=RSQL_PREDICATES) zu finden. 

#### Wildcards

Wildcards sind Platzhalterzeichen, die in Zeichenfolgen eingesetzt werden können. Sie dienen zur besseren Einstellung von Filtern und werden mit dem `LIKE` Operator benutzt, bei einer `WHERE` Bedingung. Die Platzhalter werden später in die entsprechende Filter-Logik übersetzt. Eine Liste zu allen Wildcards mit entsprechender Erklärung ist [hier](https://www.w3schools.com/sql/sql_wildcards.asp) zu finden. 

#### Constraints

Constraints heißt im Deutschen so viel wie Einschränkungen. Constraints sind Integritätsregeln, die Fehler und Unschlüssigkeiten bei der Erstellung von Tabellen ausschließen sollen. Dies gewährleistet die Integrität von Daten in der Tabelle, somit werden durch diese Regeln fehlerhafte Datensätze gar nicht erst von der Datenbank angenommen. Eine Liste zu allen Constraints mit entsprechender Erklärung ist [hier](https://www.w3schools.com/sql/sql_constraints.asp) zu finden.

#### Order By

Die `ORDER BY` Klausel wird benutzt, um Datensätze zu sortieren. Es gibt zwei Möglichkeiten der Sortierung. 
`ASC` (Ascending) und `DESC` (Descending).

*Syntax des Statements*
```sql
SELECT { * | <columnname>[,...]} FROM <tablename>[,...] ORDER BY <columnname>[,...] {ASC | DESC}
```

## Arbeitsplanung

**Louis:**
- [Schutzbedarfsanalyse](#Schutzbedarfsanalyse)

**Anton:**
- [DML](#DML)
- [DCL](#DML)

**Thomas:**
- [DDL](#DDL)
- [DQL](#DQL)
- [Auftragsanalyse](#Auftragsanalyse)

# Auftragsanalyse

Der Auftrag ist die Restrukturierung und Aktualisierung der IT-Lösung vom Unternehmen Bengel&Gölp GmbH. Eines der Hauptziele ist die Systematisierung der Geschäftsprozesse des Unternehmens in Form einer Datenbank für die Bereitstellung und Nutzung der Geschäftsdaten unter Beachtung aktueller Bestimmungen des Datenschutzes.

Der erste Schritt zu Abhandlung des Auftrags ist die Überprüfung der primären Funktionalitäten während der Nutzung der Datenbank. Mithilfe einer [Schutzbedarfsanalyse](#Schutzbedarfsanalyse) sollen Kontrollkriterien klar definiert werden, sodas alle Richtlinien des Datenschutzes und der allg. Daten- und Informationssicherheit unter den Punkten Vertraulichkeit, Integrität, Verfügbarkeit und Authentizität erfüllt sind. 

Fehlende Kriterien und Zustände sind in einer [SOLL-IST Analyse](SOLLT-IST-Analyse) festzuhalten.

# Schutzbedarfsanalyse

Die Schutzbedarfsanalyse baut auf das vom Bundesamt für Sicherheit in der Informationstechnik veröffentlichte Dokument „APP.4.3: Relationale Datenbanken“ auf und versucht ein Konzept zum sicheren Betrieb von relationalen Datenbanksysteme aufzustellen. Die Schutzbedarfsanalyse ist somit ein wichtiger Teil des analytischen Anteils von jedem Projekt um Datenbanksystemen.

## Unzureichende Dimensionierung der Systemressourcen

Die Analyse und Abschätzung der zureichenden Dimensionierung der Systemressourcen ist, damit es nicht zu unzureichenden Systemressourcen kommt, in zwei Teile einzuteilen.
Einmal in eine speicherorientierte und zweitens in die leistungsorientierte Abschätzung.

### Speicherorientierte Abschätzung der Systemressourcen
Die speicherorientierte Abschätzung beschäftigt sich mit der benötigten Menge an Speicherplatz, welche auch noch nach z. B. 5 Jahren mit den vor-angelegten Datenbankkonfigurationen gemeint sind Tabellenstrukturen, Tabellenrelationen usw. nicht vollläuft.

Dazu sollte man folglich zuerst die Auslastung des projektspezifische Datenbanksystem (in diesem Falle ein Microsoft SQL Server) protokollieren und dann diese Daten auf den gewünschten Zeitraum spekulativ, aber auch realitätsnah hochrechnen. Die Berichterstellung für die Speicherauslastung kann man mit dem [Microsoft SQL Server Management Studio](#https://docs.microsoft.com/de-de/sql/ssms/sql-server-management-studio-ssms?view=sql-server-ver15) überbrücken, da dieses ein internes Feature bietet, welches diesen Bericht generiert.

  <img src="https://raw.githubusercontent.com/derech1e/LernsituationSQL/master/assets/img/Datenträgerverwendung_Bericht.png"/>

*Abbildung 1: Aus dem UI ausgelesener allgemeiner Bericht*

Aus den beiden Berichten kann man entnehmen, dass gerade die Datendateienspeichermenge der Datenbank 3,63 MB beträgt. Dazu muss angemerkt werden, dass die Datenbank natürlich für jeden einzelnen Teil ihrer Struktur (pro Tabellenspalte bspw.) im Speichermedium Speicherplatz reserviert. Dieses Verhalten und dessen Ergebnis (reservierter Speicherplatz) sollte mit beachtet werden. Somit kann man nun vom reservierten und aktuell belegten Speicherplatz ausgehend die Speichermenge auf die 5 Jahre hochrechnen.

Ein guter Standard, welcher hier anzuwenden ist, ist eine prophylaktische Zusatzkapazität von ungefähr 100% also 200% insgesamt einzukalkulieren. Diese würde bei 16,00 MB insgesamt reservierter Speicherplatz eine Minimalspeichermenge von 32,00 MB ergeben. 

Die andere Variante wäre die Hochrechnung auf 5 Jahren bei einem ungefähren Beispielswachstum  des Unternehmens von 20% und einer demzufolge 20% anwachsenden Datenmenge pro Jahr (also exponentiell).
Dies ergibt bei 16,00MB auf 5 Jahre mit 20% Zuwachs die folgende Tabelle
| Jahr | Wert | Prozentwert |
|--|--|--|
| 1 | 16 | 3,2 |
| 2 | 19,2 | 3,82 |
| 3 | 23,04 | 4,608 |
| 4 | 27,648 | 5,5296 |
| 5 | 33,1776 | - |

*Tabelle 1: Beispielswachstum der Speicherkapazität*

mit 33,1776 MB (gerundet 33,00 MB) als hypothetischer Wert für 5 Jahre Wachstum. 
Die Differenz der zwei angewandten Methoden ist mit 1 MB wenig und für geschätzte Werte somit ignorierbar.
Die Analyse des Speicherbedarfs in 5 Jahre ist somit mit dem Wert 32,00 MB als Ergebnis beendet.

### Leistungsorientierte Abschätzung der Systemressourcen


→  Leistungsstarke Userstory anwenden und Bericht Analysieren


## Aktivierte Standard-Benutzerkonten

Um diesem Gefahrenbereich auszuweichen, sollte man nach dem aufsetzen der Datenbank darauf achten, dass man die entsprechenden Standard-Benutzerkonten deaktiviert, löscht oder dessen Passwort ändert. Dieser Hinweis ist recht allgemein und nicht projektspezifisch. Alle Projekte, die im groben Sinne mit Datenbank arbeiten, sollten sich diesem Hinweis fügen. Wie in dem maßgebendem Dokument erwähnt, können sich Angreifer durch die vom Hersteller vorgegebenen Passwörter Zugang verschaffen. Da diese öffentlich einsehbar sind, kann dies zu verehrenden Schäden in bspw. der Rechtevergabe von diversen Accounts führen.

## Unverschlüsselte Datenbankverbindung

→ Recherche MS-Datenbank verschlüsselte Verbindung

## Datenverlust in der Datenbank

→ Persistenz und Backups recherchieren (Da Daten auch von Anwendungen genutzt werden, welche nicht ausfallen sollten)

## Integritätsverlust der gespeicherten Daten

Um einem Integritätsverlust durch bspw. fehlerhaft konfigurierte Datenbanken oder manipulierten Daten vorzubeugen, ist allgemein und somit auch projektspezifisch die Nutzung eines Testsystem zu empfehlen. Dieses hätte effektiv eine deckungsgleiche Tabellen- bzw. Datenbankstruktur mit dem Produktivsystem. 
Zusammen mit entsprechenden Testdaten ist somit die Abdeckung von Sonderfällen gewährleistet. Zusätzlich dazu kann man sicherstellen, dass kritische Änderungen zum Beispiel an Job-Abläufen im Testsystem zuerst durch allgemeine Beobachtung und Prüfung der Ergebnisse getestet werden. Die Änderungen sollten in diesem Zeitraum auch durch manipulierten Daten bezüglich der Sicherheit geprüft werden. Somit werden die angesprochenen Test-Objekte und Strukturen für die Testung der Patches bzw. Änderungen verwendet. Nachdem sich diese als Funktional erwiesen haben, können sie im Produktivsystem sicher angewendet werden.

## SQL-Injections

→ nochmals genauer Recherchieren → Durch String-Prüfung

## Unsichere Konfiguration des DBS

→ Standardkonfiguration erklären und Verbesserungen vorschlagen

## Malware und unsichere Datenbank-Skripte

→ Recherchieren dazu.

## Beschreibung der Sicherheitsrichtlinie für Datenbanksysteme

→ Analysieren welche Daten im DBS personenbezogen sind und somit verschlüsselt werden. → Projektspez. → in Tabelle gucken

# SOLL-IST Analyse

# SQL Bestandteile
Die User-Stories umfassen Erklärungen und Anwendungsfälle der Standard-Query-Language im Bezug auf den Auftrag "Ferienhaus".

## DDL
Die **D**ata **D**efinition **L**anguage (dt. Datendefinitionssprache) dient der Beschreibung von Datenstrukturen und Elementen. Die Sprache wird verwendet um die Struktur und den Aufbau einer Datenbank zu beschreiben.

**Befehlsübersicht**
- [Create](#Create)
- [Alter](#Alter)
- [Drop](#Drop)

### Create
Das `CREATE` Statement wird in SQL benutzt um eine neue Datenbank oder Tabelle zu erstellen.
Für die Erzeugung einer Tabelle gilt ein standardisierter Syntax. Abhängig vom Datenbanktypen kann es eigene Besonderheiten geben.

**Syntax des Statements**
```sql
CREATE TABLE <tablename> [<columnname>[,...] <constraint>[,...]];
```

**User-Storys**

*User-Story 1*

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

*User-Story 2*

Im Beispiel sollen alle Kunden aus Dresden in der Tabelle `Dresdner` erfasst werden. 
Dies gelingt mithilfe eines [Join's](#Join).
```sql
CREATE TABLE Dresdner AS [EDGE] SELECT Adresse.Address_ID, Name FROM Kunde INNER JOIN Adresse ON Adresse.Address_ID = Kunde.Address_ID WHERE Adresse.Stadt LIKE 'Dresden';
-- [EDGE] wird nur in T-SQL benötigt.
```

#### Alter
Das `ALTER` Statement wird in SQL benutzt um Spalten und [Constraints](#Constraints) zu modifizieren.  

**Syntax der Statements**

*Löschen einer Spalte*
```sql
ALTER TABLE <tablename> DROP [COLUMN] <columnname> {RESTRICT | CASCADE}
```
*Hinzufügen einer Spalte*
```sql
ALTER TABLE <tablename> ADD [COLUMN] <columnname> <datatype> [[NOT]NULL] [DEFAULT <value>] [PRIMARY KEY] [REFERENCES <tablename> (<columnname>)]
```

*Ändern einer Spalte*
```sql
-- Setzen des Default-Werts
ALTER TABLE <tablename> ALTER [COLUMN] <columnname> SET DEFAULT  <defaultvalue>

-- Löschen des Default-Werts
ALTER TABLE <tablename> ALTER [COLUMN] <columnname> DROP DEFAULT

-- Hinzufügen einer Referenz auf einen Datentypen
ALTER TABLE <tablename> ALTER [COLUMN] <columnname> ADD SCOPE <tablename> 

-- Löschen einer Referenz
ALTER TABLE <tablename> ALTER [COLUMN] <columnname> DROP SCOPE {RESTRICT | CASCADE}
```

**User-Storys**

*User-Story 1*

Als Beispiel möchte der Auftraggeber im Nachhinein die E-Mail-Adresse der Kunden speichern. 
Es wird das ``ALTER`` Statement benutzt, um eine neue Spalte `Email` vom Typ `nvarchar` mit einer maximalen Zeichenlänge von 255 hinzuzufügen.

```sql
-- Fügt die Spalte `Email` zur Tabelle Kunde hinzu.
ALTER TABLE Kunde ADD Email nvarchar(255);
```

*User-Story 2*

Nach längerer Nutzung, fällt durch Analysen auf das auch eine maximale Zeichenlänge von 100 ausreicht. Die E-Mail Spalte wird dahingehend angepasst.
Todo: T-SQL Modify ist anders
```sql
-- Änderung der maximalen Zeichenanzahl auf 100
ALTER TABLE Kunde ALTER COLUMN Email nvarchar(100);
```

*User-Story 3*

Alle E-Mail Adressen sollen nach einer IT-Sicherheit-Analyse aufgrund von datenschutzrechtlichen Bedenken gelöscht werden. 
```sql
-- Löschen der Spalte `Email`
ALTER TABLE Kunde DROP COLUMN Email;
```

### Drop
Das `DROP` Statement wird in SQL benutzt um Datenbanken und Tabellen zu löschen. 

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
Mit der **D**ata **M**odifying **L**anguage *(dt. Datenmanipulationssprache)* kann man Daten bearbeiten, löschen, erstellen.

**Befehlsübersicht**
 - [Insert](#Insert)
 - [Update](#Update)
 - [Delete](#Delete)

### Insert
>`INSERT` *(dt. einfügen)* fügt neue Datensätze hinzu.

Das Beiwort `INTO` bei dem Statement `INSERT INTO` ist rein optional und unternimmt keinerlei Änderungen an der Verarbeitung des Befehls. Beide erwähnten Varianten sind sozusagen identisch. [Hier mehr dazu.](https://stackoverflow.com/questions/233919/insert-vs-insert-into)

**Syntax des Statements**
```sql
INSERT INTO <tablename> (<columnname>[,...]) VALUES (<value>[,...]);
```

**User-Storys**

Ein Mitarbeiter möchte einen neuen Mietvertrag in die Tabelle "Mietvertrag" über ein UI hinzufügen. Dieser Mietvertrag wird von einem Kunden (Ehepaar Zander) angefordert. Der Kunde hatte vorher noch keinen Mietvertrag aufgesetzt und ist somit ein neuer Kunde und muss somit in das System eingepflegt werden. 

```sql
--Kunde anlegen: Ehepaar Zander
INSERT INTO Kunde (Kunde_ID, Address_ID, Name)
VALUES (5, 12, 'Ehepaar Zander');

--Mietvertrag anlegen
INSERT INTO Mietvertrag (Mietvertrag_ID, Ferienhaus_ID, Kunde_ID, Beginn, Ende) 
VALUES (1, 2, 5, CAST('2007-08-29' AS Date), CAST('2007-09-19'  AS  Date));
```

### Update
>`UPDATE` *(dt. aktualisieren)* ändert und erneuert vorhandene Datensätze.

**Syntax des Statements**
```sql
UPDATE <tablename> SET <columnname> = <value> [,...] WHERE <condition>[,...]; 
```

**User-Storys**

Ein Mitarbeiter hat einen Fehler gemacht, als er dem Ehepaar Zander den Mietvertrag aufsetzte. Der Mitarbeiter hat ein falsches Haus für die Buchung ausgewählt. Zwecks fehlender Rechte muss ein Mitarbeiter der IT-Abteilung eine Änderung im System vornehmen und das richtige Haus eintragen. 

```sql
-- Mietvertrag bearbeiten
UPDATE Mietvertrag SET Ferienhaus_ID = 1
-- Bedinunungen: Kunde = Ehepaar Zander, Beginn = 29.08.2007, FerienhausID = 2
WHERE Kunde_ID = 5 AND Beginn = CAST('2007-08-29'  AS  Date) AND Ferienhaus_ID = 2
```
Der IT-Mitarbeiter muss die Änderung spezifisch auf das Ferienhaus mit dem Fehler auslegen, wo jener Fehler unterlaufen ist. Aus diesem Grund muss man mehrere Faktoren in die Bedingungen (Conditions) einfließen lassen. Das Ehepaar Zander kann auch mehrere Ferienhäuser gebucht haben, deswegen muss man auch den "Beginn" einfließen lassen. 

### Delete
>`DELETE` *(dt. löschen)* entfernt einzelne oder mehrere Datensätze.

**Syntax des Statements**
```sql
DELETE FROM <tablename> WHERE <condition>[,...];
```

**User-Story**

Eine Mängelanzeige, explizit eine *"Defekte Heizung"*, muss aus der Datenbank gelöscht werden, da diese sich als Fehler herausstellte. Ein IT-Mitarbeiter nimmt die Löschung im System vor. Vorher holt er sich die Mängelanzeige-ID aus dem System.

```sql
-- Löschen einer Mängelanzeige
DELETE FROM Maengelanzeige WHERE Maengelanzeige_ID = 89;
```

## DQL
In einer Datenbank werden verschiedene Abfragen und Operationen über mehrere Tabellen hinweg ausgeführt. Als Ergebnis wird immer eine aus dem Befehl resultierende Tabelle zurückgegeben.

**D**ata **Q**uery **L**anguage, bedeutet übersetzt so viel wie Datenbankabfragesprache. Diese ist ein Bestandteil von SQL und dient zum konkreten Abfragen von Datensätzen aus Tabellen.

**Befehlsübersicht**
- [Projektion](#Projektion)
- [Selektion](#Selektion)
- [Join](#Join)
- [Group By](#Group-By)

### Selektion & Projektion
#### Projektion

> Projektion = Auswahl von speziellen Spalten

Die Projektion wird in SQL mit dem `SELECT`-Statement realisiert. Das Statement kann durch Parameterangaben, in diesem Falle die Angabe von Spaltennamen, die bestimmten Spalten auslesen und anzeigen. Diese repräsentieren die Spaltennamen der entsprechenden Tabelle. Werden keine Eigenschaften im Statement angegeben, wird dies automatisch durch einen `*` in SQL ersetzt. 

**Syntax des Statements**
```sql
SELECT ... FROM ...;
```
```sql
SELECT [{ *, <columname[,...]> } | DISTINCT] FROM <name> [AS columnname];
```

**User-Storys**

*User-Story 1*

Um zu überprüfen, ob die Mietverträge richtig gespeichert werden, kann man sich alle Spalten von der Tabelle ``Mietvertrag`` anzeigen lassen.
```sql
-- Anzeigen aller Mietverträge
SELECT * FROM Mietvertrag;
```

*User-Story 2*

Man möchte ebenfalls die Funktionalität der Tabelle `Kunde` in Relation der Tabelle `Adresse` überprüfen. 
Um manuell zu überprüfen, ob die Tabelle Kunden die `Address_ID` richtig speichert, werden beide Tabellen über das Statement projiziert.
```sql
-- Anzeigen von Spalten aus Tabellen über einen Alias
SELECT adr.Address_ID, k.Address_ID, k.Kunde_ID, adr.Stadt, k.Name FROM Kunde k, Adresse adr;
```

#### Selektion

> Selektion = Auswahl von Zeilen nach Bedingungen

Die Selektion wird in SQL mit der sogenannten `WHERE`-Bedingungen hinter dem eigentlichem `SELECT` Statement realisiert. Die `WHERE` -Bedingung kann mehrere Prädikate enthalten. Zurückgegeben wird eine Tabelle mit einer bestimmten Ergebnismenge, die dieses Prädikat bzw. diese Prädikate erfüllen.

**Syntax des Statements**
```sql
SELECT ... FROM ... [WHERE <condition>[,...]][GROUP BY ... HAVING...][ORDER BY ...];
```

**User-Storys**

*User-Story 1*

Der Auftraggeber wünscht sich eine Filtermöglichkeit für die Tabelle `Herkunftsländer`.
Angezeigt werden, sollen alle Herkunftsländer deren Name mit "D" beginnt, sowie wenn deren Kürzel ein "D" ist. Da der Filter 1 : 1 in SQL übersetzt wird, werden die [Wildcards](#Wildcards) aus dem GUI ebenfalls in das Statement übernommen.
```sql
SELECT Name, Abkuerzung FROM Herkunftsland WHERE Name LIKE 'D%' AND Abkuerzung = 'D';;
```

*User-Story 2*

Der Auftraggeber möchte den Filter erweitern.
Es soll nun die durchschnittliche Anzahl an Schlafzimmern von Ferienhäusern, die später als dem 01.04.2008 in die Datenbank aufgenommen wurden, gefiltert werden.
```sql
SELECT AVG(Anzahl_Schlafzimmer) AS DurchschnitsSchlafzimmer FROM Ferienhaus WHERE Einstell_dat >= CAST('2008-04-01' AS Date) 
```

```sql
-- Fügt alle Ferienhäuser in die Tabelle GuteFerienhaeuser ein, die mehr als 3 Schlafzimmer haben. Die Tabelle GuteFerienhaeuser muss manuell erstellt werden.
SELECT Name INTO GuteFerienhaeuser FROM Ferienhaus WHERE Anzahl_Schlafzimmer > 3;
```

```sql
-- Anzeigen aller Kunden die in Dresden wohnen und den Buchstaben k in ihrem Namen haben
SELECT Adresse.Address_ID, Name FROM Kunde INNER JOIN Adresse ON Adresse.Address_ID = Kunde.Address_ID WHERE Adresse.Stadt LIKE 'Dresden' AND Kunde.Name LIKE '%k%';
```

### Join
**Syntax des Statements**
```sql
SELECT {* | <columnname> [,...]} FROM <tablename> {INNER JOIN | LEFT JOIN | RIGHT JOIN | FULL JOIN} <tablename> ON <columnname> = <columnname>;
```

#### Inner Join
Gibt Datensätze zurück, die in beiden Tabellen mindestens ein übereinstimmenden Wert haben.

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/inner-schema.png" width="50%" height="50%" />

**User-Story**

Der Auftraggeber möchte gerne alle wissen, welche Mietverträge dem Kunde 1 zugeordnet sind. 
```sql
SELECT Mietvertrag.Mietvertrag_ID, Mietvertrag.Kunde_ID, Kunde.Name FROM Mietvertrag INNER JOIN Kunde ON Mietvertrag.Kunde_ID = Kunde.Kunde_ID WHERE Kunde.Kunde_ID = 1;
```

### Left Join
Gibt auf jeden Fall alle Datensätze aus der "linken" Tabelle zurück, sowie übereinstimmende Datensätze aus der "rechten" Tabelle.

**Wichtig: Die Datensätze werden aus der linken Tabelle immer zurückgegeben, auch wenn es keine Übereinstimmung mit den Datensätzen aus der rechten Tabelle gibt.**

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/left-outer-schema.png" width="50%" height="50%" />

**User-Story**

Der Auftraggeber möchte gern zustätzliche Daten, wie beispielsweise den Namen der Ferienhäusern erfahren, die geschlossen sind. 

```sql
SELECT * FROM geschlossen LEFT JOIN Ferienhaus ON geschlossen.Ferienhaus_ID = Ferienhaus.Ferienhaus_ID;
```
### Right Join
Gibt auf jeden Fall alle Datensätze aus der "rechten" Tabelle zurück, sowie übereinstimmende Datensätze aus der "linken" Tabelle.

**Wichtig: Die Datensätze werden aus der rechten Tabelle immer zurückgegeben, auch wenn es keine Übereinstimmung mit Datensätzen aus der linken Tabelle gibt.**

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/right-outer-schema.png" width="50%" height="50%" />

**User-Story**

Der Auftraggeber möchte gern von allen Ferienhäusern wissen, welche momentan geschlossen sind. 

```sql 
SELECT * FROM geschlossen RIGHT JOIN Ferienhaus ON geschlossen.Ferienhaus_ID = Ferienhaus.Ferienhaus_ID;
```

### Full Join
Gibt immer Datensätze zurück, unabhängig davon ob es eine Übereinstimmung in der anderen Tabelle gibt oder nicht. Es können keine Datensätze verschwinden.

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/all-joins.png" width="50%" height="50%" />

**User-Story**

Der Auftraggeber möchte zu allen Ferienhäuser den entsprechenden Eigentümer herrausfinden und Ihnen unter anderem beim Namen nennen können.
```sql 
SELECT * FROM Ferienhaus FULL JOIN Eigentuemer ON Eigentuemer.Eigentuemer_ID = Ferienhaus.Eigentuemer_ID;
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
SELECT Anzahl_Schlafzimmer, Name FROM Ferienhaus GROUP BY Anzahl_Schlafzimmer, Name ORDER BY Anzahl_Schlafzimmer ASC;
```

```sql 
-- Gruppiert alle Schlafzimmer von Ferienhäuser die nicht am 01.04.2008 eigestellt wurden, dem Eigenümer mit der ID 2 gehöhren und Sortiert diese der Schlafzimmeranzahl nach aufsteigend 
SELECT fer.Anzahl_Schlafzimmer, fer.Name, eig.Name FROM Ferienhaus fer RIGHT JOIN Eigentuemer eig ON eig.Eigentuemer_ID = 2 WHERE Einstell_dat != CAST('2008-04-01' AS Date) GROUP BY fer.Anzahl_Schlafzimmer, fer.Name, eig.Name ORDER BY Anzahl_Schlafzimmer ASC;
```

## DCL

Mit der **D**ata **C**ontrol **L**anguage *(dt. Datenkontrollsprache)* werden Berechtigungen an User erteilt und entfernt. Die Sprache ist mit einem Berechtigungssystem vergleichbar.

**Befehlsübersicht**
- [Grant](#Grant)
- [Revoke](#Revoke)

### Grant
>`GRANT` *(dt. gewähren)* gibt Datenbankbenutzern bestimmte Rechte, beschränkt auf eine Tabelle. 

**Syntax des Statements**
```sql
GRANT <privilegename> ON <objectname> TO <username> [WITH GRANT OPTION];
```

**User-Storys**

*User-Story 1*

In dieser Userstory bekommt ein neuer Mitarbeiter definierte Rechte auf die Tabellen "Ferienhaus" und "Mietvertrag", damit dieser das System benutzen kann. Er kann sich somit mit einer SQL Session verbinden und in dieser über eine UI arbeiten. 

Das Statement `ALTER` gibt in diesem Beispiel dem Benutzer die Rechte, dass er auf der Datenbank unendlich viele Daten speichern kann.  [Siehe mehr](#Alter)

Er erhält aus Sicherheitsgründen keine [Delete](#Delete) und [Update](#Update) Rechte. 
Diese werden dann von IT-Mitarbeitern übernommen. 
```sql
-- Gewähren von Rechten 1
-- Session Berechtigung
GRANT CREATE SESSION TO <username_mitarbeiter>;
-- Schreib / Leseberechtigungen
GRANT SELECT ON Ferienhaus TO <username_mitarbeiter>;
GRANT INSERT ON Ferienhaus TO <username_mitarbeiter>;
GRANT SELECT ON Mietvertrag TO <username_mitarbeiter>;
GRANT INSERT ON Mietvertrag TO <username_mitarbeiter>;
GRANT SELECT ON Maengelanzeige TO <username_mitarbeiter>;
GRANT INSERT ON Maengelanzeige TO <username_mitarbeiter>;
ALTER USER <username_mitarbeiter> QUOTA UNLIMITED ON SYSTEM;
```

*User-Story 2*

Mit dem folgendem SQL Statement kann man die Rechte auf die Befehle `SELECT`, `UPDATE`, `INSERT`, `DELETE` und `REFERENCES` auf einmal für einen Benutzer auf eine Tabelle, in dem Fall *"Ferienhaus"*, "*Mietvertrag"* und *"Maengelanzeige",* gewähren. Somit spart man sich Zeit und Arbeit. 

```sql
-- Gewähren von Rechten 2
GRANT CREATE SESSION TO <username_mitarbeiter_chef>;
GRANT ALL ON Ferienhaus TO <username_mitarbeiter_chef>;
GRANT ALL ON Mietvertrag TO <username_mitarbeiter_chef>;
GRANT ALL ON Maengelanzeige TO <username_mitarbeiter_chef>;
```

*User-Story 3*

Ein neuer IT-Mitarbeiter wird eingestellt, welcher einzelne Tabellen erstellen und löschen muss. Dazu erhält dieser auch alle Rechte auf die *"Ferienhaus"* Tabelle, damit dieser bestimmte Datensätze ändern kann.

```sql
-- Gewähren von Rechten 3
GRANT CREATE ANY TABLE TO <username_it_mitarbeiter>; 
GRANT DROP ANY TABLE TO <username_it_mitarbeiter>;
GRANT ALL ON Ferienhaus TO <username_it_mitarbeiter>;
```

### Revoke
>`Revoke` *(dt. widerrufen)* widerruft eine Berechtigung von einem Benutzer / Rolle. 

**Syntax des Statements**
```sql
REVOKE <privilegename> ON <objectname> FROM <username>
```
**Users-Storys**

*User-Story 1*

Ein Mitarbeiter verlässt die Firma. Somit müssen auch seine Zugriffsrechte, aus Datensicherheitsgründen, weggenommen werden.

```sql
-- Entziehen von Rechten 1
REVOKE CREATE SESSION FROM <username_mitarbeiter>;
```

*User-Story 2*

Ein IT Mitarbeiter verlässt die IT-Firma. Somit müssen auch seine Rechte weggenommen werden.

```sql
-- Entziehen von Rechten 2
REVOKE CREATE ANY TABLE FROM <username_it_mitarbeiter>; 
REVOKE DROP ANY TABLE FROM <username_it_mitarbeiter>;
```

*User-Story 3*

Die Befehle `SELECT`, `UPDATE`, `INSERT`, `DELETE` und `REFERENCES` ([DML](#DML) / [DQL](#DQL)) des Mitarbeiter Chefs werden alle auf einmal entfernt, sowie die Zugriffsrechte auf die Datenbank
```sql
-- Entziehen von Rechten 3
REVOKE CREATE SESSION FROM <username_mitarbeiter_chef>;
REVOKE ALL ON Ferienhaus FROM <username_mitarbeiter_chef>;
REVOKE ALL ON Mietvertrag FROM <username_mitarbeiter_chef>;
```
# Quellen
- https://www.w3schools.com/sql
- https://www.devart.com/dbforge/sql/sqlcomplete/sql-join-statements.html
- https://www.quora.com/What-is-a-predicate-in-SQL
- https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=RSQL_PREDICATES
- https://stackedit.io
