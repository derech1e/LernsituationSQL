--1.1
--SELECT name, vorname, gehalt, bonus FROM mitarbeiter;

--1.2
--SELECT name, vorname, gehalt, bonus, gehalt+bonus as gesamt FROM mitarbeiter;

--1.3
--SELECT AVG(gehalt+bonus) as Durchschnittseinkommen FROM mitarbeiter

--1.4
--SELECT name, vorname, bonus FROM mitarbeiter where bonus is null;

--1.5
--SELECT name, vorname FROM mitarbeiter WHERE abteilungen_id like 2;

--1.6
--SELECT AVG(DATEDIFF(YEAR, gebdatum, GETDATE())) as Date from mitarbeiter;

--1.7
--SELECT name, vorname from mitarbeiter where name like '%er';

--1.8
