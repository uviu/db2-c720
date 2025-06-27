create table companyxml as
select deptno,
       xmlelement("Mitarbeiterliste",
                  xmlattributes(
                  deptno as "abteilung"
           ),
                  xmlagg(xmlelement("Mitarbeiter",
                                    xmlattributes(
                                    empno as "id",
                                    ename as "Name",
                                    job as "Beruf",
                                    mgr as "Manager",
                                    hiredate as "einstellDatum"
                      ),
                                    xmlforest(
                                            comm as "Kommission",
                                            sal as "Gehalt"
                                    )
                         )
                  )
       ) mitarbeiterliste
from emp
group by deptno;