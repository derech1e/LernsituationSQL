
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
https://wiki.byte-welt.net/wiki/Natural_Join_(SQL)

## Self Join



# Quellen

# TODO

 - [ ] https://www.devart.com/dbforge/sql/sqlcomplete/sql-join-statements.html
 - [ ] https://stackedit.io
