create table companyxml as
select deptno,
       xmlelement("Mitarbeiterliste",
                  xmlattributes(
                  deptno as "abteilung"
           ),
                  xmlagg(xmlelement("Mitarbeiter",
                                    xmlattributes(
                                    empno as "id",
                                    job as "Beruf",
                                    mgr as "Manager",
                                    hiredate as "einstellDatum"
                      ),
                                    xmlforest(
                                            ename as "Name",
                                            comm as "Kommission",
                                            sal as "Gehalt"
                                    )
                         )
                  )
       ) mitarbeiterliste
from emp
group by deptno;