/* Skript zur Demonstration von XML
Alle Beispiele von der Seite:
https://www.data2type.de/xml-xslt-xslfo/oracle/xml-abfragen/bearbeitung-von-xml-instanzen/ 
*/

-- Schrittweise Erzeugung einer XML-Instanz
select xmlelement("Mitarbeiter") resultat
  from emp;

-- Zweiter Schritt: Erg�nzung von Attributen
select xmlelement("Mitarbeiter",
         xmlattributes(
           hiredate "einstellDatum",
           empno "id"
         )
       ) resultat
  from emp;
  
-- Dritter Schritt: Erg�nzung von Kindelementen
select xmlelement("Mitarbeiter",
         xmlattributes(
           hiredate "einstellDatum",
           empno "id"
         ),
         xmlforest(
           initcap(ename) "Name",
           initcap(job) "Beruf",
           trim(to_char(sal, '999G990D00L')) "Gehalt"
         )
       ) resultat
  from emp;
 
-- Letzter Schritt: Gruppierung nach Abteilung
-- Anwendung der Gruppenfunktion xmlagg
-- Zusammenfassung mehrerer XML-Elemente zu einem Fragment

select xmlelement("Mitarbeiterliste",
         xmlattributes(
           deptno "abteilung"
         ),
         xmlagg(
           xmlelement("Mitarbeiter",
             xmlattributes(
               hiredate "einstellDatum",
               empno "id"
             ),
             xmlforest(
               initcap(ename) "Name",
               initcap(job) "Beruf",
               trim(to_char(sal, '999G990D00L')) "Gehalt"
             )
           )
         ) 
       ) resultat
  from emp
 group by deptno;
 
-- Ausgabe mittels XMLSerialize (Einr�ckung)
select xmlserialize
(
         document 
         xmlelement("Mitarbeiterliste",xmlattributes(deptno "abteilung"),
           			xmlagg( xmlelement("Mitarbeiter",
                                        xmlattributes
                                        (
                							hiredate "einstellDatum",
                 							empno "id"
               							),
               						   xmlforest 
               						   (
                						initcap(ename) "Name",
                						initcap(job) "Beruf",
                 						trim(to_char(sal, '999G990D00L')) "Gehalt"
               						   )
                                     )
                        ) 
                  ) as clob indent size = 3 
) resultat
from emp
group by deptno;
 
/* �nderungen an XML-Instanzen in SQL durchf�hren */
-- Erster Schritt: Tabelle, die die vorweg erzeugten XML-Instanzen speichert
create table dept_emp_xml as
select deptno, 
         xmlelement("Mitarbeiterliste",
           xmlattributes(
             deptno "abteilung"
           ),
           xmlagg(
             xmlelement("Mitarbeiter",
               xmlattributes(
                 empno "id",
		 hiredate "einstellDatum"
                 
               ),
               xmlforest(
                 initcap(ename) "Name",
                 initcap(job) "Beruf",
                 trim(to_char(sal, '999G990D00L')) "Gehalt"
               )
             )
           ) 
       ) liste
  from emp
 group by deptno;

select *
  from dept_emp_xml
 where deptno = 10;
  
-- Aktualisierung eines XML-Knotens
update dept_emp_xml
   set liste = updatexml(
                 liste,
                 '/Mitarbeiterliste/Mitarbeiter[3]/Beruf/text()',
                 'PR�SIDENT')
 where deptno = 10;
 
-- Aktualisierung von zwei Knoten in einer Anweisung
update dept_emp_xml
   set liste = updatexml(liste,
                 '//Mitarbeiter[3]/Beruf',
                 XMLType('<Beruf>PR�SIDENT</Beruf>'),
                 '//Mitarbeiter[2]/Name',
                 XMLType('<Name>M�ller</Name>'))
 where deptno = 10;
 
rollback;
 
-- L�schen eines Elementes
update dept_emp_xml
   set liste = deletexml(liste,
               '//Mitarbeiter[Name="King"]')
 where deptno = 10;
 
select *
  from dept_emp_xml
 where deptno = 10;
 
rollback;

-- Einf�gen eines neuen Elementes
-- Ein Geschwisterkind einf�gen
update dept_emp_xml
   set liste = 
       insertxmlbefore(liste,
         '//Mitarbeiter[2]',
         xmltype('<Mitarbeiter einstellDatum="12.03.2001">' ||
                 '  <Name>Meier</Name>' ||
                 '  <Beruf>Halbkreisingenieur</Beruf>' ||
                 '  <Gehalt>3.500,00�</Gehalt>' ||
                 '</Mitarbeiter>'))
 where deptno = 10;
 
select liste
  from dept_emp_xml
 where deptno = 10;
 
rollback;
-- Ein Kindelement als letzes anf�gen
update dept_emp_xml
   set liste = 
       appendChildXML(liste,
         '/Mitarbeiterliste',
         xmltype('<Mitarbeiter einstellDatum="12.03.2001">' ||
                 '  <Name>Meier</Name>' ||
                 '  <Beruf>Halbkreisingenieur</Beruf>' ||
                 '  <Gehalt>3.500,00�</Gehalt>' ||
                 '</Mitarbeiter>'))
 where deptno = 10;

select liste
  from dept_emp_xml
 where deptno = 10;
 
rollback;


/* Entschachteln der XML-Instanz */
-- Erster Schritt:
select v.*
from dept_emp_xml x,
       table(
         xmlsequence(
           extract(x.liste, '//Mitarbeiter'))) v
 where deptno = 10;
 
-- N�chster Schritt: Einen Namen extrahieren
select extractValue(v.column_value, '//Name') ename
  from dept_emp_xml x,
       table(
         xmlsequence(
           extract(x.liste, '//Mitarbeiter'))) v;

/* XQuery */
-- einfaches Beispiel mit einem XPath-Ausdruck
select xmlquery(
       '/Mitarbeiterliste/Mitarbeiter'
       passing liste
       returning content) ergebnis
  from dept_emp_xml;


-- Erweiterung auf mehrere Tabellen
select xmlquery(
       'for $emp in fn:collection("oradb:/SCOTT/EMP"),
            $dept in fn:collection("oradb:/SCOTT/DEPT")
        where $emp/ROW/DEPTNO = $dept/ROW/DEPTNO
          and $emp/ROW/SAL >= 3000
        return <Mitarbeiter>
                <Name>{$emp/ROW/ENAME/text()}</Name>
                <Gehalt>{$emp/ROW/SAL/text()}</Gehalt>
                <Abteilung>{$dept/ROW/DNAME/text()}</Abteilung>
               </Mitarbeiter>'
       returning content) ergebnis
  from dual;
  
/* Die Verwendung der Funktion XMLTABLE */
select erg.Familienname, erg.Taetig, erg.Seit
from   dept_emp_xml, xmltable ('/Mitarbeiterliste/Mitarbeiter'
       passing liste 
       columns Familienname varchar2(10) path '//Name',
               Taetig varchar2(10) path '//Beruf',
  	       Seit date path '@einstellDatum'	
      ) erg;
       
/* Die Verwendung der Funktion XMLEXISTS */
select liste
  from dept_emp_xml
 where xmlexists(
         '/Mitarbeiterliste/Mitarbeiter[Name = "King"]'
         passing liste);
