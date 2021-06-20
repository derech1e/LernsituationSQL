# Vortrag Joins

Diese Dokumentation erklärt die Grundlegenden Sprachbestanteile von SQL. Im Zusammenhang mit einem Ferienhaus-Auftrag werden diese anschaulich dargestellt und verdeutlicht.

# Inhaltsverzeichnis
- [Join-Arten](#Join-Arten)
- [Quellen](#Quellen)
- [TODO](#TODO)


# Join-Arten
## Inner Join
Gibt Datensätze zurück, die in beiden Tabellen mindestens ein übereinstimmenden Wert haben. 
<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/inner-schema.png" width="500" height="300" />

```sql
SELECT Person.PersonID, Mitarbeiter.Name, Person.Nachname FROM Person INNER JOIN Mitarbeiter
ON Mitarbeiter.Name = Person.Nachname;
```
## Left [Outer] Join
Gibt alle Datensätze aus der "linken" Tabelle zurück, sowie übereinstimmende Datensätze aus der "rechten" Tabelle. 

**Wichtig: Die Datensätze werden aus der linken Tabelle immer zurückgegeben, auch wenn es keine Übereinstimmung mit den Datensätzen aus der rechten Tabelle gibt.**

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/left-outer-schema.png" width="500" height="300" />


```sql
SELECT Person.PersonID, Mitarbeiter.Name, Person.Nachname FROM Person LEFT JOIN Mitarbeiter
ON Mitarbeiter.Name = Person.Nachname ORDER BY Mitarbeiter.Name;
```
## Right [Outer] Join
Gibt alle Datensätze aus der "rechten" Tabelle zurück, sowie übereinstimmende Datensätze aus der "linken " Tabelle.

**Wichtig: Die Datensätze werden aus der rechten Tabelle immer zurückgegeben, auch wenn es keine Übereinstimmung mit Datensätzen aus der linken Tabelle gibt.**

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/right-outer-schema.png" width="500" height="300" />


```sql 
SELECT Person.PersonID, Mitarbeiter.Name, Person.Nachname FROM Person RIGHT JOIN Mitarbeiter
ON Mitarbeiter.Name = Person.Nachname;
```

## Full [Outer] Join
Gibt immer Datensätze zurück, unabhängig davon ob es eine Übereinstimmung in der anderen Tabelle gibt oder nicht. Es können keine Datensätze verschwinden.

<img src="https://www.devart.com/dbforge/sql/sqlcomplete/images/all-joins.png" width="500" height="300" />


```sql 
SELECT Person.PersonID, Mitarbeiter.Name, Person.Nachname FROM Person FULL JOIN Mitarbeiter
ON Mitarbeiter.Name = Person.Nachname;
```

## Natural Join

## Self Join

## Cross Join

# Quellen

# TODO

 - [ ] https://www.devart.com/dbforge/sql/sqlcomplete/sql-join-statements.html
 - [ ] https://stackedit.io
