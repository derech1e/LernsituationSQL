
# Dokumentation Lernsituation SQL 

Lernsituation für SQL der IGD19

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

## TEMPLATE
Mit den DMLs (**D**ata **M**odifying **L**anguage(s)) *(dt. Übersetzung-Sprache(n))* kann man Daten ... .

**BEFEHLE**

 - [Befehl](#Befehl)
 - [Befehl](#Befehl)
 - [Befehl](#Befehl)

#### BEFEHL_NAME
Mit dem `<BEFEHL>` kann man ... .

**Syntax**
```sql
TEMPLATE SQL SATEMENT FOR SYNTAX
```
**Userstory(s)**
```sql
TEMPLATE SQL STATEMENT FOR USERSTORY
```
**Quellen und Extras**

## Thomas
### DDL
CREATE, ALTER, DROP Anwendungsfälle

### DML
Mit den DMLs (**D**ata **M**odifying **L**anguage(s)) *(dt. Datenmanipulationssprache(n))* kann man Daten bearbeiten, löschen, erstellen und, oder auslesen.

 - [INSERT](#INSERT)
 - [UPDATE](#UPDATE)
 - [DELETE](#DELETE)

#### INSERT
Mit dem `INSERT` *(dt. einfügen)* Befehl kann man im Allgemeinen Daten hinzufügen.

Das Beiwort `INTO` bei dem Befehl `INSERT INTO` ist rein optional und unternimmt keinerlei Änderungen an der Verarbeitung des Befehls. Beide Varianten sind sozusagen identisch. 

**Syntax**
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

### DQL
SELECT, JOIN, GROUP BY, SELEKTION, PROJEKTION mit WHERE, (DURCHSCHNITT etc.)

### DCL
Mit den DCLs (Data Control Language(s)) *(dt. Datenkontrollsprache)* kann man Berechtigungen verteilen und entziehen.


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
GRANT CREATE ANY TABLE TO <username_it_mitarbeiter>; 
GRANT DROP ANY TABLE TO <username_it_mitarbeiter>;
GRANT ALL ON Ferienhaus TO <username_it_mitarbeiter>;
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

### Zusatz
Benutzer Hinzufügen

**Erst Anwendungsfall dann Überlegung**

## Anton
- Arbeitsplanung
- Dokumentation schreiben

## Louis
- Analyse einer DB
