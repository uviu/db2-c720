--uebung 5.4
create noneditionable type mitarbeiter under PERSON
(
    ma_nr     number,
    abteilung varchar2(30)
) not final;

create sequence MA_SEQ start with 1;

insert into PERSONAL
values (mitarbeiter('Heinrich', 'Hertel', 1966, 'Herderstr. 43', 'Paderborn',
                    (select ref(p) from PERSONAL p where VNAME = 'Horst'),
                    MA_SEQ.nextval, 'Vertrieb'));

--auswerten 
select value(p)
from PERSONAL p;

select p.manager.vname "Manager von Heinrich"
from PERSONAL p
where p.VNAME = 'Heinrich';

--ausgabe aller attribute (auch von subtypen)
select p.nname,
       p.vname,
       p.gebjahr,
       p.manager.nname                          as manager_name,
       treat(value(p) as mitarbeiter).abteilung as abteilung,
       treat(value(p) as mitarbeiter).ma_nr     as mitarbeiter_nr
from PERSONAL p;