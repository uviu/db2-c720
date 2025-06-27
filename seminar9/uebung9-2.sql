-- subaufgabe a
select *
from companyxml;

-- subaufgabe b
select t.*
from companyxml,
     xmltable('/Mitarbeiterliste/Mitarbeiter'
              passing mitarbeiterliste
              columns empno number path '@id',
                  job varchar2(10) path '@Beruf',
                  mgr number path '@Manager',
                  hiredate date path '@einstellDatum',
                  comm number path 'Kommission',
                  sal number path 'Gehalt'
     ) t;

-- subaufgabe c       
select t.*
from companyxml,
     xmltable('/Mitarbeiterliste/Mitarbeiter'
              passing mitarbeiterliste
              columns empno number path '@id',
                  job varchar2(10) path '@Beruf',
                  mgr number path '@Manager',
                  hiredate date path '@einstellDatum',
                  comm number path 'Kommission',
                  sal number path 'Gehalt'
     ) t
where deptno = 30;

-- subaufgabe d
select t.*
from companyxml,
     xmltable('/Mitarbeiterliste/Mitarbeiter'
              passing mitarbeiterliste
              columns empno number path '@id',
                  job varchar2(10) path '@Beruf',
                  mgr number path '@Manager',
                  hiredate date path '@einstellDatum',
                  comm number path 'Kommission',
                  sal number path 'Gehalt'
     ) t
where t.empno = 7902;

-- subaufgabe e
select t.job
from companyxml,
     xmltable('/Mitarbeiterliste/Mitarbeiter'
              passing mitarbeiterliste
              columns empno number path '@id',
                  job varchar2(10) path '@Beruf'
     ) t
where t.empno = 7902;

-- subaufgabe f
select t.*
from companyxml,
     xmltable('/Mitarbeiterliste/Mitarbeiter'
              passing mitarbeiterliste
              columns empno number path '@id',
                  job varchar2(10) path '@Beruf',
                  mgr number path '@Manager',
                  hiredate date path '@einstellDatum',
                  comm number path 'Kommission',
                  sal number path 'Gehalt'
     ) t
where t.sal >= 3000;

-- subaufgabe g
select t.empno
from companyxml,
     xmltable('/Mitarbeiterliste/Mitarbeiter'
              passing mitarbeiterliste
              columns empno number path '@id',
                  sal number path 'Gehalt'
     ) t
where t.sal >= 3000;

-- subaufgabe h
select t.*
from companyxml,
     xmltable('/Mitarbeiterliste/Mitarbeiter'
              passing mitarbeiterliste
              columns empno number path '@id',
                  job varchar2(10) path '@Beruf',
                  mgr number path '@Manager',
                  hiredate date path '@einstellDatum',
                  comm number path 'Kommission',
                  sal number path 'Gehalt'
     ) t
where t.sal >= &min_sal;