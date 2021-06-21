
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

## Thomas
### DDL
CREATE, ALTER, DROP Anwendungsfälle

### DML
Mit den DMLs (**D**ata **M**odifying **L**anguage(s)) *(dt. Datenmanipulationssprache)* kann man Daten bearbeiten, löschen, erstellen und, oder auslesen.

#### INSERT
Mit dem `INSERT` *(dt. einfügen)* Befehl kann man sich im Allgemeinen Daten hinzufügen.

Das Beiwort `INTO` bei dem Befehl `INSERT INTO` ist rein optional und unternimmt keinerlei Änderungen an der Verarbeitung des Befehls. Beide Varianten sind sozusagen identisch. 

**Syntax**
```sql
INSERT INTO <Tabelle> ()
```

**Userstroys**
In dieser Userstory möchte ein Mitarbeiter einen neuen Mietvertrag der Tabelle "Mietvertrag" einen Neuen Mietvertrag in die Datenbank über eine UI hinzufügen. Dieser Mietvertrag wird von einem Kunden (Ehepaar Zander) angefordert. Der Kunde hat vorher noch keinen Mietvertrag aufgesetzt und ist somit ein neuer Kunde und muss in das System eingepflegt werden. 

```sql
/** Kunde anlegen: Ehepaar Zander **/
INSERT INTO Kunde (Kunde_ID, Address_ID, Name)
VALUES (5, 12, 'Ehepaar Zander')

/** Mietvertrag anlegen **/
INSERT INTO Mietvertrag (Mietvertrag_ID, Ferienhaus_ID, Kunde_ID, Beginn, Ende) 
VALUES (1, 2, 5, CONVERT('2007-08-29'  AS  Date), CONVERT('2007-09-19'  AS  Date))
```

### DQL
SELECT, JOIN, GROUP BY, SELEKTION, PROJEKTION mit WHERE, (DURCHSCHNITT etc.)

### DCL
Mit den DCLs (Data Control Language(s)) *(dt. Datenkontrollsprache)* kann man Berechtigungen verteilen und entziehen.


#### GRANT
`GRANT` *(dt. gewähren )* gibt Datenbankbenutzern bestimmte Rechte auf eine Datenbank. 

In dieser Userstory bekommt ein neuer Mitarbeiter Rechte auf die Datenbank, damit dieser das System benutzen kann. Er kann sich somit mit einer SQL Session verbinden und in dieser arbeiten. 

Der Befehl `ALTER` gibt in diesem Beispiel de  Benutzer die Rechte, dass er auf der Datenbank unendlich viele Daten speichern kann.  [Siehe mehr](#Alter)

```sql
GRANT CREATE SESSION TO <username_mitarbeiter>;
GRANT SELECT ON Ferienhaus TO <username_mitarbeiter>;
GRANT DELETE ON Ferienhaus TO <username_mitarbeiter>;
GRANT UPDATE ON Ferienhaus TO <username_mitarbeiter>;
ALTER USER <username_mitarbeiter> QUOTA UNLIMITED ON SYSTEM;
```
Mit dem folgendem SQL Statement kann man die Rechte auf die Befehle `SELECT`, `UPDATE`, `INSERT`, `DELETE` und `REFERENCES` alle auf einmal für einen Benutzer auf eine Datenbank übergeben. Wichtig hierbei ist die Angabe der Datenbank, in dem Fall "Ferienhaus". In diesem Beispiel bekommt der Chef der Mitarbeiter alle Rechte auf die Ferienhaus Datenbank. Somit spart man sich zeit. 
```sql
GRANT ALL ON Ferienhaus TO <username_mitarbeiter_chef>;
```

*Ein weiteres Beispiel:*
Ein neuer IT-Mitarbeiter wird eingestellt, welcher einzelne Tabellen erstellen und löschen muss. Dazu erhällt dieser auch alle Rechte auf die "Ferienhaus" Datenbank, damit dieser bestimmte Datensätze auch ändern kann. 

```sql
GRANT CREATE ANY TABLE TO <username_it_mitarbeiter>; 
GRANT DROP ANY TABLE TO <username_it_mitarbeiter>;
GRANT ALL ON Ferienhaus TO <username_it_mitarbeiter>;
```

#### REVOKE

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

### Zusatz
Benutzer Hinzufügen

**Erst Anwendungsfall dann Überlegung**

## Anton
- Arbeitsplanung
- Dokumentation schreiben

## Louis
- Analyse einer DB
